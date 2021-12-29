import QtQuick

ObstaclesForm {
    property int obstaclesNum: 5
    property real obstaclesSpeed: obstacles.height*0.01;
    property real characterSpeed: obstacles.width*0.01;
    property real obstaclesSpacing: obstacles.height*0.3;
    property real collisionTollerance: 1.2;

    function inputs(){
        if(rightArea.pressed)
            character.x+=characterSpeed;
        if(leftArea.pressed)
            character.x-=characterSpeed;
    }

    function borderCollisions()
    {
        if(character.x+character.width >= obstacles.width)
            character.x -= characterSpeed;
        else if(character.x <= 0)
            character.x += characterSpeed;
    }

    function obstaclesCollisions()
    {
        for(var i=0; i<obstaclesNum; i++)
        {
            var obstacle = obstacles.itemAt(i);
            var xDist = Math.abs(character.x-obstacle.x)*collisionTollerance
            var yDist = Math.abs(character.y-obstacle.y)*collisionTollerance
            if((xDist < character.width*0.5 + obstacle.width*0.5) && (yDist < character.height*0.5+obstacle.height*0.5))
                return true;
        }

        return false;
    }

    function init()
    {
        character.x = (obstacles.width-character.width)*0.5
        for(var i=0; i<obstaclesNum; i++)
            obstacles.itemAt(i).y = obstacles.height*2;
    }
    Connections{
        Component.onCompleted: init();
    }

    function updateObstacles()
    {
        for(var i=0; i<obstaclesNum; i++)
        {
            var obstacle = obstacles.itemAt(i);
            if(obstacle.y > obstacles.height+obstacle.height)
            {
                obstacle.x = Math.random()*(obstacles.width-obstacle.width*0.5);
                obstacle.y = -Math.random()*obstacles.height-(obstacles.height-obstaclesSpacing*i);
            }
            obstacle.y+=obstaclesSpeed;
        }
    }

    function run(){
        inputs();
        borderCollisions();
        updateObstacles();
        if(obstaclesCollisions())
            init();
    }

    Timer {
           interval: 33; running: true; repeat: true
           onTriggered: run()
       }
}
