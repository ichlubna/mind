import QtQuick
import QtQuick.Controls

SwipePage {
    property var listInputText: ""
    property var withDescription: true
    property variant items: []
    SwipeView {
        anchors.fill: parent
        Repeater {
            id: itemsContainer
            model: (withDescription) ? items.length / 2 : items.length
            Item {
                id: delegate
                Button {
                    id: leftButton
                    background: Image {
                        source: "qrc:/images/arrow.svg"
                        fillMode: Image.PreserveAspectFit
                    }
                    onClicked: (index === 0) ? delegate.SwipeView.view.currentIndex
                                               = items.length / 2
                                               - 1 : delegate.SwipeView.view.decrementCurrentIndex()
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    width: parent.width * 0.1
                }
                property var topText:  (withDescription) ? items[index * 2].trim() : tems[index].trim()
                property var bottomText: (withDescription) ? items[index * 2+1].trim() : ""

                DescriptionLabel {
                    id: tip
                    text: topText
                    anchors.bottom: (bottomText==="") ? undefined : leftButton.verticalCenter
                    anchors.verticalCenter: (bottomText==="") ? leftButton.verticalCenter : undefined
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width * 0.8
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignBottom
                    font.bold: true
                }
                DescriptionLabel {
                    text: bottomText
                    anchors.top: leftButton.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: tip.width
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignTop
                }

                Button {
                    id: rightButton
                    background: Image {
                        source: "qrc:/images/arrow.svg"
                        fillMode: Image.PreserveAspectFit
                        rotation: 180
                    }
                    onClicked: (index === items.length / 2
                                - 1) ? delegate.SwipeView.view.currentIndex
                                       = 0 : delegate.SwipeView.view.incrementCurrentIndex()
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    width: parent.width * 0.1
                }
                SequentialAnimation {
                    running: true
                    loops: Animation.Infinite

                    OpacityAnimator {
                        target: rightButton
                        from: 1.0
                        to: 0.3
                        duration: 2000
                    }
                    OpacityAnimator {
                        target: rightButton
                        from: 0.3
                        to: 1.0
                        duration: 2000
                    }
                }
                SequentialAnimation {
                    running: true
                    loops: Animation.Infinite

                    OpacityAnimator {
                        target: leftButton
                        from: 1.0
                        to: 0.3
                        duration: 2000
                    }
                    OpacityAnimator {
                        target: leftButton
                        from: 0.3
                        to: 1.0
                        duration: 2000
                    }
                }
            }
        }
        Connections {
            target: itemsContainer
            Component.onCompleted: {
                items = listInputText.split("\n")
               }
        }
    }
}
