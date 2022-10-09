var fastCarCanDrive:Bool = true;

function create() {
    resetFastCar();
}
function update(elapsed:Float) {
    if (!fastCarCanDrive && fastCar.x > 2000) {
        resetFastCar();
        fastCarCanDrive = true;
    }
}
function beatHit(curBeat:Int) {
    if (FlxG.random.bool(10) && fastCarCanDrive)
        fastCarDrive();
}


function resetFastCar() {
    fastCar.x = -12600;
    fastCar.y = FlxG.random.int(140, 250);
    fastCar.velocity.x = 0;
    fastCarCanDrive = true;
}
function fastCarDrive()
{
    FlxG.sound.play(Paths.soundRandom('carPass', 0, 1), 0.7);

    fastCar.velocity.x = (FlxG.random.int(170, 220) / FlxG.elapsed) * 3;
    fastCarCanDrive = false;
}