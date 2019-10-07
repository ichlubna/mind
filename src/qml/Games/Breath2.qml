import QtQuick 2.4

Breath2Form {
    property int initNumberLength: 1000
    property int numberLength: 1000
    property int currentNumber: 1
    property int phase: 0
    property int numbersCount: 4
    property variant breathText: [qsTrId("breathe-in"), qsTrId("breathe-hold"), qsTrId("breathe-out")]

    breathSlider.onValueChanged: {numberLength = initNumberLength*(2.0-breathSlider.value); currentNumber=1; phase=0; anim.restart();}
    onPhaseChanged: {phase=(phase > 10) ? 0 : phase;
                    currentNumber++;
                    if(phase==0){currentNumber=1;breathElement.text = breathText[0];}
                    else if(phase==4){currentNumber=1;breathElement.text = breathText[1];}
                    else if(phase==7){currentNumber=1;breathElement.text = breathText[2];}
                    }

         RotationAnimator {
                running: true
                 loops: Animation.Infinite
                 target: sprite;
                 from: 0;
                 to: 360;
                 duration: numberLength*14
             }

                ParallelAnimation{id: anim; loops: Animation.Infinite; running: true
                   /* SequentialAnimation{
                        ScaleAnimator {target: breathElement; from: 0.7; to: 1.0; duration: numberLength*4}
                        ScaleAnimator {target: breathElement; from: 0.7; to: 1.0; duration: numberLength*3}
                        ScaleAnimator {target: breathElement; from: 0.7; to: 1.0; duration: numberLength*4}
                    }*/
                    ScaleAnimator {target: breathElement; from: 0.7; to: 1.0; duration: numberLength*11}
                    SequentialAnimation{
                        ScaleAnimator {target: bar; from: 0.0; to: 1.0; duration: numberLength*4}
                        ScaleAnimator {target: bar; from: 1.0; to: 1.0; duration: numberLength*3}
                        ScaleAnimator {target: bar; from: 1.0; to: 0.0; duration: numberLength*4}
                    }
                    SequentialAnimation{ loops: 4+3+4
                        ScriptAction{script: {number.text=currentNumber.toString();}}
                        ParallelAnimation{
                            ScaleAnimator {target: number; from: 1.0; to: 0.0; duration: numberLength}
                            OpacityAnimator {target: number; from: 0.5; to: 0.0; duration: numberLength; }
                    }
                        ScriptAction{script: {phase++}}
                    }
                }
}
