/// @description Insert description here
// You can write your code in this editor
if Gamerule_1.debug && !global.online
{
	var p = instance_position(mouse_x,mouse_y,Gem_1)
	if p != noone
	{
		//var s = instance_create(x,y,skullAppear)
		//s.mygem = p.id
		p.gempower++
		//p.amHype = true
		//p.skinnum = 7
	}
}