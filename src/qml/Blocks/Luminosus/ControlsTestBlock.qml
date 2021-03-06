import QtQuick 2.5
import CustomElements 1.0

import "../../CustomBasics"
import "../../CustomControls"

BlockBase {
    id: root
	width: 120*dp
    height: 270*dp

	StretchColumn {
        anchors.fill: parent

		BlockRow {
			StretchColumn {
                width: 30*dp
                Slider {
					mappingID: block.getUid() + "slider"
                }
            }
			StretchColumn {
				implicitWidth: -1
                CustomTouchArea {
                    height: 30*dp
                    Text {
                        anchors.fill: parent
                        text: "Touch"
                    }

                    mouseOverEnabled: true
                    clickDurationEnabled: true
                    onTouchDown: console.log("down")
                    onTouchMove: console.log("move")
                    onTouchUp: console.log("up")
                    onRightClick: console.log("right")
                    onShortClick: console.log("short")
                    onLongClick: console.log("long")
                    onClick: console.log("click")
                    onDoubleClick: console.log("doubleClick")
                    onMouseOverChanged: console.log("mouseOver: ", mouseOver)
                    onScrollEvent: console.log("wheel: ", deltaX, deltaY)
                }

				ComboBox2 {
					height: 30*dp
					values: ["some", "values", "to", "choose"]
				}

                ButtonBottomLine {
					height: 30*dp
                    mappingID: block.getUid() + "ButtonBottomLine"
					text: "BUTTON"
                }
                ButtonSideLine {
					height: 30*dp
                    mappingID: block.getUid() + "ButtonSideLine"
					text: "BUTTON"
                }
                Switch {
					height: 30*dp
					mappingID: block.getUid() + "Switch"
                }
                IconButton {
					height: 30*dp
                    mappingID: block.getUid() + "IconButton"
					iconName: "plus_icon"
                }
                TextInput {
					height: 30*dp
					hintText: "hint"
                }
                SliderHorizontal {
                    height: 30*dp
                }
            }
		}
        DragArea {
		}
    }
}

