#include "mathengine.h"
#include <stdlib.h>
#include <time.h>

MathEngine::MathEngine(QObject *parent) : QObject(parent)
{
     srand (static_cast<unsigned int>(time(nullptr)));
}

QString MathEngine::getNewExercise()
{
    a = rand() % 10;
    b = rand() % 10;
    operation = static_cast<Operation>(rand()%3);

    char op = '+';
    switch (operation)
    {
        case SUB:
            op = '-';
            if (b>a)
            {
                int tmp=b;
                b=a;
                a=tmp;
            }
            result = a-b;
        break;

        case MUL:
            op = '*';
            result = a*b;
        break;

        case DIV:
            op = '/';
            result = a/b;
        break;

        case ADD:
            op = '+';
            result = a+b;
        break;
    }

    return QString::number(a) + " " + op + " " + QString::number(b) + " = ";
}

bool MathEngine::submitResult(QString answer)
{
    return answer.toInt()==result;
}
