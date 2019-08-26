import QtQuick 2.4

HomeForm {
    contactButton.onClicked: stackView.push("Contacts/Contacts.qml")
    depressionButton.onClicked: stackView.push("Depression/Depression.qml")
    panicButton.onClicked: stackView.push("Panic/Panic.qml")
    selfHarmButton.onClicked: stackView.push("SelfHarm/SelfHarm.qml")
    suicideButton.onClicked: stackView.push("Suicide/Suicide.qml")
    moodButton.onClicked: stackView.push("Mood.qml")
    foodButton.onClicked: stackView.push("Food/Food.qml")

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
