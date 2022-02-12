/// @description Controls for buyo buyo
image_angle = 0 // 0 = up, 90 = right, 180 = down, 270 = left
xx = 0 //x for second gem. Changes on rotation
yy = -64 //y for second gem. Changes on rotation
scr_buyo_findij()
left = false
gem1 = -1;
gem2 = -1;
with(Gamerule_1)
{
	combo = 0
	reset_compliments()
}

spd_def = (Gamerule_1.level div 2) + 1
spd = spd_def

accidental_down = false
if keyboard_check(vk_down) || gamepad_button_check(global.gp[0],gp_padd) accidental_down = true
doonce = false
rot_once_r = false
rot_once_l = false
//alarm[0] = spd //start falling
move_endlag = 0
move_endlag_started = false
mobile_left = false
mobile_right = false
mobile_rot_left = false
mobile_rot_right = false
mobile_down = false
ang = -90;
cond_angle = 0
else_angle = 270
