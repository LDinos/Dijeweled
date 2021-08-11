/// @description Insert description here
// You can write your code in this editor
var end_alarm = 4
if (_i - upleft >= 0 && _j - upleft >= 0) //if we can check upleft and dont get out of bounds
{
    instance_destroy(Gamerule_1.gem_board1[_i-upleft][_j-upleft])
	
    upleft++
}
else end_alarm-- //else one diagonal is done

if (_i + downleft <= 7 && _j - downleft >= 0) //if we can check downleft and dont get out of bounds
{
    instance_destroy(Gamerule_1.gem_board1[_i+downleft][_j-downleft])
    downleft++
}
else end_alarm-- //else one diagonal is done

if (_i - upright >= 0 && _j + upright <= 7) //if we can check upright and dont get out of bounds
{
    instance_destroy(Gamerule_1.gem_board1[_i-upright][_j+upright])
    upright++
}
else end_alarm-- //else one diagonal is done

if (_i + downright <= 7 && _j + downright <= 7) //if we can check downright and dont get out of bounds
{
    instance_destroy(Gamerule_1.gem_board1[_i+downright][_j+downright])
    downright++
}
else end_alarm-- //else one diagonal is done

if (end_alarm == 0) {instance_destroy(); Gamerule_1.lightOn = false} //if all 4 diagonals are done, lets finish this
else alarm[0] = 15 //redo until all gems die