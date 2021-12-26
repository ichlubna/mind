import QtQuick

Breath1Form {
    property int initBreathLength: 5000
    property int breathLength: 5000
    property int transitionLength: 150

    breathSlider.onValueChanged: {breathLength = initBreathLength*(2.0-breathSlider.value); ani.restart(); breathIn.opacity=1.0;}

    SequentialAnimation {
            id: ani
            running: true
            loops: Animation.Infinite
        ScaleAnimator {
                target: sprite;
                from: 0.5;
                to: 1;
                duration: breathLength
                easing.type: Easing.InOutCubic
            }
        OpacityAnimator {
                 target: breathIn;
                 from: 1.0;
                 to: 0.0;
                 duration: transitionLength
        }
        OpacityAnimator {
                 target: breathOut;
                 from: 0.0;
                 to: 1.0;
                 duration: transitionLength
        }
        ScaleAnimator {
                target: sprite;
                from: 1;
                to: 0.5;
                duration: breathLength
                easing.type: Easing.InOutCubic
            }
        OpacityAnimator {
                 target: breathOut;
                 from: 1.0;
                 to: 0.0;
                 duration: transitionLength
        }
        OpacityAnimator {
                 target: breathIn;
                 from: 0.0;
                 to: 1.0;
                 duration: transitionLength
        }

    }

}
