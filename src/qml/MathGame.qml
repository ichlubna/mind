import QtQuick 2.4
import io.qt.MathEngine 1.0

MathGameForm{
    MathEngine{id: mathEngine}
    exercise.text: mathEngine.getNewExercise()

    OpacityAnimator {
         id: vignetteAnimator
         target: vignetteColor;
         from: 1.0;
         to: 0.0;
         duration: 1500
         running: false
    }

    function validateAnswer()
    {
        if(mathEngine.submitResult(answer.text))
        {
            exercise.text = mathEngine.getNewExercise();
            vignetteColor.color = "#00ff00";
        }
        else
            vignetteColor.color = "#ff0000";

       vignetteAnimator.start();
       answer.text = ""
    }
    submitButton.onClicked: validateAnswer()
}
