/// @description Controls for buyo buyo
image_angle = 0 // 0 = up, 90 = right, 180 = down, 270 = left
xx = 0 //x for second gem. Changes on rotation
yy = -64 //y for second gem. Changes on rotation
scr_buyo_findij()
left = false
gem1 = irandom(4) //center gem
gem2 = irandom(4) //outer gem
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
doonce2 = false
//alarm[0] = spd //start falling
