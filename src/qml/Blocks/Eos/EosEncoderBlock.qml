import QtQuick 2.5
import CustomElements 1.0
import "../../CustomBasics"
import "../../CustomControls"

BlockBase {
    id: root
    width: 130*dp
    height: block.attr("conditional")? 120*dp : 90*dp
    settingsComponent: settings

    StretchColumn {
        anchors.fill: parent

        TextInput {
            id: textInput
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 4*dp
            anchors.rightMargin: 4*dp
            height: 30*dp
            hintText: "Parameter"
            text: block.attr("parameterName").val
            onDisplayTextChanged: {
                if (displayText !== block.attr("parameterName").val) {
                    block.attr("parameterName").val = displayText
                }
            }
        }

        ButtonSideLine {
            height: 30*dp
            text: block.attr("fineMode").val ? "Fine" : "Coarse"
            onActiveChanged: {
                if (active) {
                    block.attr("fineMode").val = true
                } else {
                    block.attr("fineMode").val = false
                }
            }
            mappingID: block.getUid() + "fine"
        }
 BlockRow {
        ButtonSideLine {
            visible: block.attr("conditional").val === true
            height: 30*dp
            text: block.attr("enabled").val ? "Enabled" : "Enable"
            onActiveChanged: {
                    block.attr("enabled").val = true
            }
            mappingID: block.getUid() + "enable"
        }

        ButtonSideLine {
            visible: block.attr("conditional").val === true
            height: 30*dp
            text: block.attr("enabled").val ? "Disable" : "Disabled"
            onActiveChanged: {
                    block.attr("enabled").val = false
            }
            mappingID: block.getUid() + "disable"
        }
}
        DragArea {
            text: "Encoder"

            // ------------ Rx Status LED -----------

            Rectangle {
                width: 10*dp
                height: 10*dp
                radius: width / 2
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 10*dp
                color: ledTimer.running ? "lightgreen" : "#777"
                antialiasing: false

                Timer {
                    // this timer is triggered when the LED should light up
                    // it stops running 200ms after that
                    id: ledTimer
                    repeat: false
                    interval: 200
                }

                Connections {
                    target: block
                    // trigger the timer when a valid message has been received:
                    onValidMessageReceived: ledTimer.restart()
                }
            }
        }
    }  // end main column



    Component {
        id: settings
        StretchColumn {
            leftMargin: 15*dp
            rightMargin: 15*dp
            defaultSize: 30*dp

            BlockRow {
                StretchText {
                    text: "Learn:"
                }
                ButtonBottomLine {
                    text: block.learning ? "Cancel" : "Start"
                    onPress: block.startLearning()
                }
            }

            BlockRow {
                Text {
                    text: "accelerate:"
                    width: parent.width - 30*dp
                }
                AttributeCheckbox {
                    width: 30*dp
                    attr: block.attr("accelerate")
                }
            }
            BlockRow {
                Text {
                    text: "conditional:"
                    width: parent.width - 30*dp
                }
                AttributeCheckbox {
                    width: 30*dp
                    attr: block.attr("conditional")
                    onActiveChanged: block.height = block.attr("conditional")? 120*dp : 90*dp
                }
            }
            BlockRow {
                Text {
                    text: "active:"
                    width: parent.width - 30*dp
                }
                AttributeCheckbox {
                    width: 30*dp
                    attr: block.attr("active")
                }
            }

            BlockRow {
          //      visible: block.attr("active").val === true
                Text {
                    text: "feedback:"
                    width: parent.width - 30*dp
                }
                AttributeCheckbox {
                    width: 30*dp
                    attr: block.attr("feedback")
                }
            }
            BlockRow {
          //      visible: block.attr("active").val === true
                Text {
                    text: "Ticks multiplier:"
                    width: parent.width - 30*dp
                }
                TextInput {
                    id: textInput
                    width: 30*dp
                    validator: DoubleValidator
                    text: block.attr("multiplier").val
                    onTextChanged: {
                        if (text !== block.attr("multiplier").val) {
                            block.attr("multiplier").val = text
                        }
                    }
                }
            }
        }
    }  // end Settings Component
}

