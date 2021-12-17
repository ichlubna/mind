import QtQuick

HomeForm {
    property var button : null
    property var array : []
    property var buttonTime : 150

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

    function shuffle(array) {
        let counter = array.length;
        while (counter > 0) {
            let index = Math.floor(Math.random() * counter);
            counter--;
            let temp = array[counter];
            array[counter] = array[index];
            array[index] = temp;
        }
        return array;
    }

    function animate(){
        if(array.length === 0)
            return;

        button = buttons.itemAt(array.shift());
        bAnim.start();
        bTimer.restart();
    }

    Connections{
        target: homePage
        Component.onCompleted: {
            for(var i=0; i<buttons.count; i++)
            {
                array.push(i);
                buttons.itemAt(i).scale=0;
            }
             array = shuffle(array);
            bTimer.start();
        }
    }

    Timer {
            id: bTimer
            interval: buttonTime+10
            onTriggered: {animate();}
        }

    PropertyAnimation{
        id: bAnim
        targets: button
        property: "scale"
        from: 0.0;
        to: 1;
        duration: buttonTime
    }

    PropertyAnimation{
        target: logo
        property: "scale"
        from: 0.0
        to: 1.0
        duration: buttonTime*buttons.count
        running: true
    }
}
