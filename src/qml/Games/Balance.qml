import QtQuick 2.4
import io.qt.MathEngine 1.0

BalanceForm {
    MathEngine{id: mathEngine}
    property var rotationSpeed : 0
    property var windStrength : 0.1
    property var leftWindPressed : false
    property var rightWindPressed : false
    property var limitAngle : 70
    property var particleNumber : 5

    function run(){
        if(mathEngine.mathRandom() < 0.03)
        {
            rotationSpeed += mathEngine.mathRandom()-0.5;
        }
        if(leftWindPressed)
        {
            rotationSpeed+=windStrength
            var pl = mapFromItem(leftWind, leftWind.x, leftWind.y)
            particles.x = pl.x + leftWind.width*0.5
            particles.y = pl.y
            particles.burst(particleNumber);
        }
        if(rightWindPressed)
        {
            rotationSpeed-=windStrength
            var pr = mapFromItem(rightWind, rightWind.x, rightWind.y)
            particles.x = pr.x + rightWind.width*0.5
            particles.y = pr.y
            particles.burst(particleNumber);
        }

        rotationSpeed += seesaw.rotation * 0.0006;
        seesaw.rotation += rotationSpeed;

        if(seesaw.rotation > limitAngle || seesaw.rotation < -limitAngle)
        {
            seesaw.rotation = 0
            rotationSpeed = 0
        }
    }

    Timer {
           interval: 33; running: true; repeat: true
           onTriggered: run()
       }

    leftWind.onPressed: {leftWindPressed = true}
    leftWind.onReleased: {leftWindPressed = false}
    rightWind.onPressed: {rightWindPressed = true}
    rightWind.onReleased: {rightWindPressed = false}

    OpacityAnimator {
             target: gameText;
             from: 1;
             to: 0.0;
             duration: 5000
             running: true
    }
}
