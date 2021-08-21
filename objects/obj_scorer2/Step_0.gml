/// @description Insert description here
// You can write your code in this editor
var points1, points2, matches1, matches2, style1, style2;
if !global.online
{
	points1 = Gamerule_local.points
	points2 = Gamerule_1.points
	matches1 = Gamerule_local.matches
	matches2 = Gamerule_1.matches
	style1 = Gamerule_local.style
	style2 = Gamerule_1.style
}
else
{
	if global.IAMHOST
	{
		points1 = Gamerule_2.points
		points2 = Gamerule_1.points
		matches1 = Gamerule_2.matches
		matches2 = Gamerule_1.matches
		style1 = Gamerule_2.style
		style2 = Gamerule_1.style
	
	}
	else
	{
		points1 = Gamerule_1.points
		points2 = Gamerule_2.points
		matches1 = Gamerule_1.matches
		matches2 = Gamerule_2.matches
		style1 = Gamerule_1.style
		style2 = Gamerule_2.style
	}
}

// WIN[0] \\
if points1 == points2
{
	if win[0] != 0
	{
		var lens = instance_create(x-488,y+32,obj_lensflare)
		with(lens) clr = c_orange
		win[0] = 0
	}
}
else if points1 > points2
{
	if win[0] != 1
	{
		audio_play_sound(snd_buttonchangeright,0,0)
		var lens = instance_create(x-488,y+32,obj_lensflare)
		with(lens) clr = c_green
		win[0] = 1
	}
}
else 
{
	if win[0] != 2
	{
		var lens = instance_create(x-488,y+32,obj_lensflare)
		with(lens) clr = c_red
		win[0] = 2
	}
}

// WIN[1] \\
if matches1 == matches2
{
	if win[1] != 0
	{
		var lens = instance_create(x-488,y+64,obj_lensflare)
		with(lens) clr = c_orange
		win[1] = 0
	}
}
else if matches1 > matches2
{
	if win[1] != 1
	{
		audio_play_sound(snd_buttonchangeright,0,0)
		var lens = instance_create(x-488,y+64,obj_lensflare)
		with(lens) clr = c_green
		win[1] = 1
	}
}
else 
{
	if win[1] != 2
	{
		var lens = instance_create(x-488,y+64,obj_lensflare)
		with(lens) clr = c_red
		win[1] = 2
	}
}

// WIN[2] \\
if style1 == style2
{
	if win[2] != 0
	{
		var lens = instance_create(x-488,y+64,obj_lensflare)
		with(lens) clr = c_orange
		win[2] = 0
	}
}
else if style1 > style2
{
	if win[2] != 1
	{
		audio_play_sound(snd_buttonchangeright,0,0)
		var lens = instance_create(x-488,y+64,obj_lensflare)
		with(lens) clr = c_green
		win[2] = 1
	}
}
else 
{
	if win[2] != 2
	{
		var lens = instance_create(x-488,y+64,obj_lensflare)
		with(lens) clr = c_red
		win[2] = 2
	}
}