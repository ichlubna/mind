import QtQuick

ThornsForm {
    property int thornsNum: 5
    property real thornSpeed: 0.004;
    property real collisionTollerance: 1.0;
    property real slashStartX: 0
    property real slashStartY: 0
    property real slashEndX: 0
    property real slashEndY: 0
    property bool pressed: false
    property bool released: false
    property bool slashing: false

    slashArea.onPressed:
    {
        pressed = true;
    }
    slashArea.onReleased:
    {
        released = true;
    }

    function resetSlash()
    {
        slashStartX = 0;
        slashStartY = 0;
        slashEndX = 0;
        slashEndY = 0;
    }

    function inputs(){
        slashEndX = slashArea.mouseX;
        slashEndY = slashArea.mouseY;

       if(pressed)
        {
           slashing = true;
            pressed = false;
            slashStartX = slashArea.mouseX;
            slashStartY = slashArea.mouseY;
        }

        if(released)
        {
            slashing = false;
            released = false;
            slashThorns();
            resetSlash();
        }
    }

    function coreCollisions()
    {
        for(var i=0; i<thornsNum; i++)
        {
            var thorn = thorns.itemAt(i);
            var distance = Math.sqrt(Math.pow(thorn.x-(core.x+core.width*0.5),2)+Math.pow(thorn.y-(core.y+core.height*0.5),2))*collisionTollerance;
            if(distance < core.width*0.5)
                return true;
        }
        return false;
    }

    function killThorn(id)
    {
        var thorn = thorns.itemAt(id);
        var side = Math.floor(Math.random() * 4);
        if(side < 2)
        {
            thorn.x = thorns.width*Math.random();
            thorn.y = (side === 0) ? 0 : thorns.height;
        }
        else
        {
            thorn.y = 0.01+thorns.height*Math.random();
            thorn.x = (side === 2) ? 0 : thorns.width;
        }
        thorn.directionX = core.x+core.width*0.5-thorn.x
        thorn.directionY = core.y+core.height*0.5-thorn.y
        thorn.thornRotation = 360-(180.0/Math.PI)*Math.atan2(-thorn.directionY,thorn.directionX);
        thorn.thornRotation += 180;
    }

    function ccw(a, b, c){
        return (c[1]-a[1]) * (b[0]-a[0]) > (b[1]-a[1]) * (c[0]-a[0])}

    function segmentsIntersect(a, b, c, d){
        return ccw(a,b,d) !== ccw(b,c,d) && ccw(a,b,c) !== ccw(a,b,d)}

    function slashThorns()
    {
        for(var i=0; i<thornsNum; i++)
        {
            var thorn = thorns.itemAt(i);
            var thornOrigin = [-1000*thorn.directionX, -1000*thorn.directionY];
            if(segmentsIntersect(thornOrigin, [thorn.x, thorn.y], [slashStartX, slashStartY], [slashEndX, slashEndY]))
                killThorn(i);
        }
    }

    function init()
    {
        for(var i=0; i<thornsNum; i++)
            killThorn(i);
    }
    Connections{
        Component.onCompleted: init();
    }

    function updateThorns()
    {
        for(var i=0; i<thornsNum; i++)
        {
            var thorn = thorns.itemAt(i);
            thorn.x += thorn.directionX*thornSpeed;
            thorn.y += thorn.directionY*thornSpeed;
        }
    }

    function run(){
        inputs();
        updateThorns();
        if(coreCollisions())
            init();
    }

    Timer {
           interval: 33; running: true; repeat: true
           onTriggered: run()
       }
}
