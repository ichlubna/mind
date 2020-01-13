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
}
