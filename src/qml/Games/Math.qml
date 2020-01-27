import QtQuick 2.4
import io.qt.MathEngine 1.0

MathForm{
    MathEngine{id: mathEngine}
    exercise.text: mathEngine.getNewExercise()

    OpacityAnimator {
         id: animator
         target: anim;
         from: 0.7;
         to: 0.0;
         duration: 1500
         running: false
    }

    function validateAnswer()
    {
        if(mathEngine.submitResult(answer.text))
        {
            exercise.text = mathEngine.getNewExercise();
            anim.source = "qrc:/images/tick.svg";
        }
        else
            anim.source = "qrc:/images/delete.svg";

       animator.start();
       answer.text = ""
    }
    submitButton.onClicked: validateAnswer()
}
