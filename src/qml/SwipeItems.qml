import QtQuick 2.5
import QtQuick.Controls 2.5

SwipeView {
       anchors.fill: parent
       property variant items: []
       Repeater {
           model: items.length/2
           Item {
               id: delegate
               Button {
                   id: leftButton
                   background:  Image {
                       source: "qrc:/images/arrow.svg"
                       fillMode: Image.PreserveAspectFit
                   }
                   onClicked: (index === 0) ? delegate.SwipeView.view.currentIndex=items.length/2-1 : delegate.SwipeView.view.decrementCurrentIndex()
                   anchors.left: parent.left
                   anchors.verticalCenter: parent.verticalCenter
                   width: parent.width*0.1
               }

               DescriptionLabel {
                   id: tip
                   text: items[index*2].trim()
                   anchors.centerIn: parent
                   width: parent.width*0.8
                   horizontalAlignment: Text.AlignHCenter
                   verticalAlignment: Text.AlignVCenter
                   font.pointSize: 30
               }
               DescriptionLabel {
                   text: items[index*2+1]
                   anchors.top: tip.bottom
                   anchors.horizontalCenter: parent.horizontalCenter
                   width: tip.width
                   horizontalAlignment: Text.AlignHCenter
                   verticalAlignment: Text.AlignTop
                   font.pointSize: 15
               }

               Button {
                   id: rightButton
                   background:  Image {
                       source: "qrc:/images/arrow.svg"
                       fillMode: Image.PreserveAspectFit
                       rotation: 180
                   }
                   onClicked: (index === items.length/2-1) ? delegate.SwipeView.view.currentIndex=0 : delegate.SwipeView.view.incrementCurrentIndex()
                   anchors.right: parent.right
                   anchors.verticalCenter: parent.verticalCenter
                   width: parent.width*0.1
               }
               SequentialAnimation {
                       running: true
                       loops: Animation.Infinite

                       OpacityAnimator {
                                target: rightButton
                                from: 1.0;
                                to: 0.3;
                                duration: 2000
                       }
                       OpacityAnimator {
                                target: rightButton
                                from: 0.3;
                                to: 1.0;
                                duration: 2000
                       }
               }
               SequentialAnimation {
                       running: true
                       loops: Animation.Infinite

                       OpacityAnimator {
                                target: leftButton
                                from: 1.0;
                                to: 0.3;
                                duration: 2000
                       }
                       OpacityAnimator {
                                target: leftButton
                                from: 0.3;
                                to: 1.0;
                                duration: 2000
                       }
               }
           }
       }
   }

