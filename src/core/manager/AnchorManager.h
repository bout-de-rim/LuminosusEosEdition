#ifndef ANCHORMANAGER_H
#define ANCHORMANAGER_H

#include "core/block_data/BlockInterface.h"

#include <QObject>
#include <QMap>
#include <QJsonObject>
#include <QJsonArray>


// forward declaration to prevent dependency loop
class MainController;

namespace AnchorManagerConstants {

}


class AnchorManager : public QObject
{

    Q_OBJECT

    Q_PROPERTY(bool presentationMode READ getPresentationMode WRITE setPresentationMode NOTIFY presentationModeChanged)
    Q_PROPERTY(bool anchorsExist READ getAnchorsExist NOTIFY anchorsChanged)
    Q_PROPERTY(int currentIndex READ getCurrentIndex NOTIFY currentIndexChanged)

public:

    explicit AnchorManager(MainController* controller);

    // ------------------- Persistence --------------------

    /**
     * @brief getState returns the settings of this manager to persist them
     * @return the settings as a QJsonObject
     */
    QJsonObject getState() const;

    /**
     * @brief setState restores the settings from a saved Json object
     * @param state a QJsonObject previously generated by getState()
     */
    void setState(const QJsonObject& state);

signals:
    void presentationModeChanged();
    void anchorsChanged();
    void currentIndexChanged();

public slots:
    // ------------------ Logic ------------------

    void showNext();
    void showCurrent();
    void showPrevious();

    void startPresentationMode();
    void endPresentationMode();
    void togglePresentationMode();

    // ------------------ Getter + Setter ------------------

    bool getPresentationMode() const { return m_presentationMode /*&& getAnchorsExist()*/; }  // FIXME: changed for OLED GUI Block
    void setPresentationMode(bool value) { m_presentationMode = value; emit presentationModeChanged(); }

    void addAnchor(BlockInterface* block);
    void removeAnchor(BlockInterface* block);

    int getAnchorIndex(BlockInterface* block) const;

    bool getAnchorsExist() const { return !m_anchors.isEmpty(); }

    int getCurrentIndex() const { return m_currentIndex; }

private slots:
    void setCurrentIndex(int value) { m_currentIndex = value; emit currentIndexChanged(); }


protected:

    MainController* const m_controller;  //!< a pointer to the MainController

    QMap<QString, BlockInterface*> m_anchors;

    QVector<QString> m_anchorOrder;

    bool m_presentationMode;

    int m_currentIndex;

};

#endif // ANCHORMANAGER_H
