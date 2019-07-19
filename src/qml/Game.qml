import QtQuick 2.4

GameForm {
    property int elapsed : 0;
    property var speed : [];
    property var wiggleAmount : [];
    property var wiggleSpeed : [];
    property var sceneWidth : 0;

    readonly property double minSpeed : 10.0;
    readonly property double speedMultiplier : 30.0;
    readonly property double wiggleMultiplier : 20.0;
    readonly property int ballNum : 5;

    function init()
    {
        balls.model = ballNum;
        for (var i = 0; i < balls.model; i++)
        {
            var ball = balls.itemAt(i);
            ball.y = -99999;
        }
        sceneWidth = gamePage.width;
    }

    function run()
    {
        //balls.itemAt(0).x = 100*Math.random();
        elapsed++;
        for (var i = 0; i < balls.model; i++)
        {
            var ball = balls.itemAt(i);
            if (ball.y < -ball.height)
            {
                ball.y = ball.parent.height;
                ball.x = sceneWidth*Math.random();
                speed[i] = minSpeed+speedMultiplier*Math.random();
                wiggleAmount[i] = wiggleMultiplier*Math.random();
                wiggleSpeed[i] = Math.random();
            }
            ball.y -= speed[i];
            ball.x += wiggleAmount[i]*Math.sin(wiggleSpeed[i]*elapsed+100*i);
        }
    }

    Timer {
           interval: 33; running: true; repeat: true
           onTriggered: run()
       }


    Connections {
        target: balls
        Component.onCompleted: {
            init();
        }
    }

}
