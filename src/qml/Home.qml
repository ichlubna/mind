import QtQuick 2.4

HomeForm {
    SequentialAnimation {
        running: true
        loops: Animation.Infinite

        OpacityAnimator {
            target: logo
            from: 1.0
            to: 0.3
            duration: 4000
        }
        OpacityAnimator {
            target: logo
            from: 0.3
            to: 1.0
            duration: 4000
        }
    }

    Timer {
            interval: 500
            onTriggered: bAnim.start()
            running: true
        }

    PropertyAnimation{
        id: bAnim
        targets: [b1,b2,b3,b4,b5,b6,b7];
        property: "scale"
        from: 0.0;
        to: 1;
        duration: 250
    }

    PropertyAnimation{
        target: logo
        property: "scale"
        from: 0.0
        to: 1.0
        duration: 400
        running: true
    }
}
