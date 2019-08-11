import QtQuick 2.4

GameForm {
    property int elapsed : 0;
    property var speed : [];
    property var wiggleAmount : [];
    property var wiggleSpeed : [];
    property var sceneWidth : 0;

    readonly property double minSpeed : 0.01*gamePage.height;
    readonly property double speedMultiplier : 0.01*gamePage.height;
    readonly property double wiggleMultiplier : 0.05*gamePage.width;
    readonly property int ballNum : 5;

    function hit(index)
    {
        var ball = balls.itemAt(index);
        if(ball.wanted)
        {
            particles.x = ball.x;
            particles.y = ball.y;
            particles.burst(200);
            ball.y = -99999;
        }
    }

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
                wiggleSpeed[i] = Math.random()*0.8;
                ball.wanted = Math.random() > 0.8;
                if(ball.wanted)
                    ball.color = "#EFFFFFFF";
                else
                    if(Math.random() > 0.5)
                        ball.color = "#A0000000";
                    else
                        ball.color = "#A0A0A0A0";

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

    OpacityAnimator {
             target: gameText;
             from: 1;
             to: 0.0;
             duration: 5000
             running: true
    }
}
