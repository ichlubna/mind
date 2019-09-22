import QtQuick 2.4

Breath2Form {
    property int initNumberLength: 1000
    property int numberLength: 1000
    property int currentNumber: 0
    property int phase: 0
    property int numbersCount: 4
    property double barStartSize: 0.0
    property double barEndSize: 1.0
    property variant breathText: [qsTrId("breathe-in"), qsTrId("breathe-hold"), qsTrId("breathe-out")]

    breathSlider.onValueChanged: {numberLength = initNumberLength*(2.0-breathSlider.value); anim.restart(); breathElement.opacity=1.0;}
    onPhaseChanged: {phase=(phase > 2) ? 0 : phase;
                    if(phase==0){numbersCount=4; barStartSize=0.0; barEndSize=1.0;}
                    else if(phase==1){numbersCount=3; barStartSize=1.0; barEndSize=1.0;}
                    else if(phase==2){numbersCount=4; barStartSize=1.0; barEndSize=0.0;}
                    breathElement.text = breathText[phase]; anim.restart();}

         RotationAnimator {
                running: true
                 loops: Animation.Infinite
                 target: sprite;
                 from: 0;
                 to: 360;
                 duration: numberLength*14
             }


        SequentialAnimation {id: anim; loops: Animation.Infinite; running: true
                ScriptAction{script: {currentNumber=0;}}
                ParallelAnimation{ loops: 1
                    ScaleAnimator {target: breathElement; from: 0.7; to: 1.0; duration: numberLength*numbersCount}
                    ScaleAnimator {target: bar; from: barStartSize; to: barEndSize; duration: numberLength*numbersCount}
                    SequentialAnimation{ loops: numbersCount
                        ScriptAction{script: {currentNumber++; number.text=currentNumber.toString();}}
                        ParallelAnimation{
                            ScaleAnimator {target: number; from: 1.0; to: 0.0; duration: numberLength}
                            OpacityAnimator {target: number; from: 0.5; to: 0.0; duration: numberLength; }
                    }}
                }
                ScriptAction{script: {phase++}}
}}
