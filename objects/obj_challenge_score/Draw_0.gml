/// @description Insert description here
// You can write your code in this editor
draw_set_font(font0)
centerize_text()
var i = 0
var w = sprite_width
//if instance_exists(obj_xplier) i++ //move us down
if (quest.C_num_chain != -1)
{
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	var rem = " / " + string(quest.C_num_chain)
	if (quest.L_endless) rem = ""
	var t = "Chain: " + string(Gamerule_1.chain)
	var s = string_width(t + rem) > w ? w/string_width(t + rem) : 1
	draw_text_transformed(xcenter,ycenter +i*sprite_height,t + rem, s, s, 0)
	i++
}

if (quest.C_num_zenifycombo != -1)
{
	var rem = " / " + string(quest.C_num_zenifycombo)
	if (quest.L_endless) rem = ""
	var t = "Zenify Combo: " + string(quest.S_num_zenifycombo)
	var s = string_width(t + rem) > w ? w/string_width(t + rem) : 1
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text_transformed(xcenter,ycenter +i*sprite_height,t + rem, s, s, 0)
	i++
}

if (quest.L_drain != -1)
{
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	if (Gamerule_1.points < quest.C_num_points) draw_text(xcenter,ycenter +i*sprite_height,"Score: " + string(Gamerule_1.points))
	else draw_text(xcenter,ycenter +i*sprite_height,"Score: " + string(quest.C_num_points))
	i++
}
else if (quest.C_num_points != -1)
{
	var rem = " / " + string(quest.C_num_points)
	if (quest.L_endless) rem = ""
	var t = "Score: " + string(Gamerule_1.points)
	var s = string_width(t + rem) > w ? w/string_width(t + rem) : 1
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text_transformed(xcenter,ycenter +i*sprite_height,t + rem, s, s, 0)
	i++
}

if quest.C_movesneeded != -1
{
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text(xcenter,ycenter +i*sprite_height,"Moves Remaining: " + string(quest.C_movesneeded - quest.S_movesdone))	
	i++
}

if quest.C_summoves != -1
{
	var rem = " / " + string(quest.C_summoves)
	if (quest.L_endless) rem = ""
	var t = "Possible matches: " + string(Gamerule_1.summoves2)
	var s = string_width(t + rem) > w ? w/string_width(t + rem) : 1
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text_transformed(xcenter,ycenter +i*sprite_height,t + rem, s, s, 0)
	i++
}

if quest.C_cascades != -1
{
	var rem = " / " + string(quest.C_cascades)
	if (quest.L_endless) rem = ""
	var t = "Cascades: " + string(Gamerule_1.combo)
	var s = string_width(t + rem) > w ? w/string_width(t + rem) : 1
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text_transformed(xcenter,ycenter +i*sprite_height,t + rem, s, s, 0)
	i++
}

if quest.C_destroy_locks != -1
{
	var rem = " / " + string(quest.C_destroy_locks)
	if (quest.L_endless) rem = ""
	var t = "Locks Destroyed: " + string(quest.S_destroyed_locks)
	var s = string_width(t + rem) > w ? w/string_width(t + rem) : 1
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text_transformed(xcenter,ycenter +i*sprite_height,t + rem, s, s, 0)
	i++
}

if quest.C_destroy_fruits != -1
{
	var rem = " / " + string(quest.C_destroy_fruits)
	if (quest.L_endless) rem = ""
	var t = "Fruits Destroyed: " + string(quest.S_destroyed_fruits)
	var s = string_width(t + rem) > w ? w/string_width(t + rem) : 1
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text_transformed(xcenter,ycenter +i*sprite_height,t + rem, s, s, 0)
	i++
}

if quest.C_num_fruits != -1
{
	var rem = " / " + string(quest.C_num_fruits)
	if (quest.L_endless) rem = ""
	var t = "Fruits: " + string(quest.S_num_fruits)
	var s = string_width(t + rem) > w ? w/string_width(t + rem) : 1
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text_transformed(xcenter,ycenter +i*sprite_height,t + rem, s, s, 0)
	i++
}

if quest.C_destroy_bombs != -1
{
	var rem = " / " + string(quest.C_destroy_bombs)
	if (quest.L_endless) rem = ""
	var t = "Bombs Destroyed: " + string(quest.S_destroyed_bombs)
	var s = string_width(t + rem) > w ? w/string_width(t + rem) : 1
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text_transformed(xcenter,ycenter +i*sprite_height,t + rem, s, s, 0)
	i++
}

if quest.C_destroy_skulls != -1
{
	var rem = " / " + string(quest.C_destroy_skulls)
	if (quest.L_endless) rem = ""
	var t = "Skulls Destroyed: " + string(quest.S_destroyed_skulls)
	var s = string_width(t + rem) > w ? w/string_width(t + rem) : 1
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text_transformed(xcenter,ycenter +i*sprite_height,t + rem, s, s, 0)
	i++
}

if quest.C_destroy_dooms != -1
{
	var rem = " / " + string(quest.C_destroy_dooms)
	if (quest.L_endless) rem = ""
	var t = "Dooms Destroyed: " + string(quest.S_destroyed_dooms)
	var s = string_width(t + rem) > w ? w/string_width(t + rem) : 1
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text_transformed(xcenter,ycenter +i*sprite_height,t + rem, s, s, 0)
	i++
}

if quest.C_destroy_ice != -1
{
	var rem = " / " + string(quest.C_destroy_ice)
	if (quest.L_endless) rem = ""
	var t = "Ice Destroyed: " + string(quest.S_destroyed_ice)
	var s = string_width(t + rem) > w ? w/string_width(t + rem) : 1
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text_transformed(xcenter,ycenter +i*sprite_height,t + rem, s, s, 0)
	i++
}

if quest.C_destroy_coals != -1
{
	var rem = " / " + string(quest.C_destroy_coals)
	if (quest.L_endless) rem = ""
	var t = "Coals Destroyed: " + string(quest.S_destroyed_coals)
	var s = string_width(t + rem) > w ? w/string_width(t + rem) : 1
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text_transformed(xcenter,ycenter +i*sprite_height,t + rem, s, s, 0)
	i++
}

if quest.C_destroy_gems != -1
{
	var rem = " / " + string(quest.C_destroy_gems)
	if (quest.L_endless) rem = ""
	var t = "Gems Destroyed: " + string(quest.S_destroyed_gems)
	var s = string_width(t + rem) > w ? w/string_width(t + rem) : 1
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text_transformed(xcenter,ycenter +i*sprite_height,t + rem, s, s, 0)
	i++
}
if quest.C_match_gems != -1
{
	var rem = " / " + string(quest.C_match_gems)
	if (quest.L_endless) rem = ""
	var t = "Gems Matched: " + string(quest.S_matched_gems)
	var s = string_width(t + rem) > w ? w/string_width(t + rem) : 1
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text_transformed(xcenter,ycenter +i*sprite_height,t + rem, s, s, 0)
	i++
}
if quest.C_destroy_flame != -1
{
	var rem = " / " + string(quest.C_destroy_flame)
	if (quest.L_endless) rem = ""
	var t = "Flames Destroyed: " + string(quest.S_destroyed_flames)
	var s = string_width(t + rem) > w ? w/string_width(t + rem) : 1
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text_transformed(xcenter,ycenter +i*sprite_height,t + rem, s, s, 0)
	i++
}
if quest.C_destroy_lightning != -1
{
	var rem = " / " + string(quest.C_destroy_lightning)
	if (quest.L_endless) rem = ""
	var t = "Lightnings Destroyed: " + string(quest.S_destroyed_lights)
	var s = string_width(t + rem) > w ? w/string_width(t + rem) : 1
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text_transformed(xcenter,ycenter +i*sprite_height,t + rem, s, s, 0)
	i++
}
if quest.C_destroy_nova != -1
{
	var rem = " / " + string(quest.C_destroy_nova)
	if (quest.L_endless) rem = ""
	var t = "Novas Destroyed: " + string(quest.S_destroyed_novas)
	var s = string_width(t + rem) > w ? w/string_width(t + rem) : 1
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text_transformed(xcenter,ycenter +i*sprite_height,t + rem, s, s, 0)
	i++
}
if quest.C_destroy_septa != -1
{
	var rem = " / " + string(quest.C_destroy_septa)
	if (quest.L_endless) rem = ""
	var t = "Septas Destroyed: " + string(quest.S_destroyed_septas)
	var s = string_width(t + rem) > w ? w/string_width(t + rem) : 1
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text_transformed(xcenter,ycenter +i*sprite_height,t + rem, s, s, 0)
	i++
}
if quest.C_destroy_octa != -1
{
	var rem = " / " + string(quest.C_destroy_octa)
	if (quest.L_endless) rem = ""
	var t = "Octas Destroyed: " + string(quest.S_destroyed_octas)
	var s = string_width(t + rem) > w ? w/string_width(t + rem) : 1
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text_transformed(xcenter,ycenter +i*sprite_height,t + rem, s, s, 0)
	i++
}
if quest.C_destroy_hype != -1
{
	var rem = " / " + string(quest.C_destroy_hype)
	if (quest.L_endless) rem = ""
	var t = "Hypercubes Destroyed: " + string(quest.S_destroyed_hypes)
	var s = string_width(t + rem) > w ? w/string_width(t + rem) : 1
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text_transformed(xcenter,ycenter +i*sprite_height,t + rem, s, s, 0)
	i++
}
if quest.C_num_green != -1
{
	var rem = " / " + string(quest.C_num_green)
	if (quest.L_endless) rem = ""
	var t = "Green Gems: " + string(quest.S_num_green)
	var s = string_width(t + rem) > w ? w/string_width(t + rem) : 1
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text_transformed(xcenter,ycenter +i*sprite_height,t + rem, s, s, 0)
	i++
}
if quest.C_num_red != -1
{
	var rem = " / " + string(quest.C_num_red)
	if (quest.L_endless) rem = ""
	var t = "Red Gems: " + string(quest.S_num_red)
	var s = string_width(t + rem) > w ? w/string_width(t + rem) : 1
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text_transformed(xcenter,ycenter +i*sprite_height,t + rem, s, s, 0)
	i++
}
if quest.C_num_white != -1
{
	var rem = " / " + string(quest.C_num_white)
	if (quest.L_endless) rem = ""
	var t = "White Gems: " + string(quest.S_num_white)
	var s = string_width(t + rem) > w ? w/string_width(t + rem) : 1
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text_transformed(xcenter,ycenter +i*sprite_height,t + rem, s, s, 0)
	i++
}
if quest.C_num_yellow != -1
{
	var rem = " / " + string(quest.C_num_yellow)
	if (quest.L_endless) rem = ""
	var t = "Yellow Gems: " + string(quest.S_num_yellow)
	var s = string_width(t + rem) > w ? w/string_width(t + rem) : 1
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text_transformed(xcenter,ycenter +i*sprite_height,t + rem, s, s, 0)
	i++
}
if quest.C_num_purple != -1
{
	var rem = " / " + string(quest.C_num_purple)
	if (quest.L_endless) rem = ""
	var t = "Purple Gems: " + string(quest.S_num_purple)
	var s = string_width(t + rem) > w ? w/string_width(t + rem) : 1
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text_transformed(xcenter,ycenter +i*sprite_height,t + rem, s, s, 0)
	i++
}
if quest.C_num_orange != -1
{
	var rem = " / " + string(quest.C_num_orange)
	if (quest.L_endless) rem = ""
	var t = "Orange Gems: " + string(quest.S_num_orange)
	var s = string_width(t + rem) > w ? w/string_width(t + rem) : 1
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text_transformed(xcenter,ycenter +i*sprite_height,t + rem, s, s, 0)
	i++
}
if quest.C_num_blue != -1
{
	var rem = " / " + string(quest.C_num_blue)
	if (quest.L_endless) rem = ""
	var t = "Blue Gems: " + string(quest.S_num_blue)
	var s = string_width(t + rem) > w ? w/string_width(t + rem) : 1
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text_transformed(xcenter,ycenter +i*sprite_height,t + rem, s, s, 0)
	i++
}
if quest.C_num_coals != -1
{
	var rem = " / " + string(quest.C_num_coals)
	if (quest.L_endless) rem = ""
	var t = "Coals: " + string(quest.S_num_coals)
	var s = string_width(t + rem) > w ? w/string_width(t + rem) : 1
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text_transformed(xcenter,ycenter +i*sprite_height,t + rem, s, s, 0)
	i++
}
if quest.C_num_hype != -1
{
	var rem = " / " + string(quest.C_num_hype)
	if (quest.L_endless) rem = ""
	var t = "Hypercubes: " + string(quest.S_num_hypes)
	var s = string_width(t + rem) > w ? w/string_width(t + rem) : 1
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text_transformed(xcenter,ycenter +i*sprite_height,t + rem, s, s, 0)
	i++
}
if quest.C_num_flame != -1
{
	var rem = " / " + string(quest.C_num_flame)
	if (quest.L_endless) rem = ""
	var t = "Flames: " + string(quest.S_num_flames)
	var s = string_width(t + rem) > w ? w/string_width(t + rem) : 1
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text_transformed(xcenter,ycenter +i*sprite_height,t + rem, s, s, 0)
	i++
}
if quest.C_num_lightning != -1
{
	var rem = " / " + string(quest.C_num_lightning)
	if (quest.L_endless) rem = ""
	var t = "Lightnings: " + string(quest.S_num_lights)
	var s = string_width(t + rem) > w ? w/string_width(t + rem) : 1
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text_transformed(xcenter,ycenter +i*sprite_height,t + rem, s, s, 0)
	i++
}
if quest.C_num_nova != -1
{
	var rem = " / " + string(quest.C_num_nova)
	if (quest.L_endless) rem = ""
	var t = "Supernovas: " + string(quest.S_num_novas)
	var s = string_width(t + rem) > w ? w/string_width(t + rem) : 1
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text_transformed(xcenter,ycenter +i*sprite_height,t + rem, s, s, 0)
	i++
}
if quest.C_num_septa != -1
{
	var rem = " / " + string(quest.C_num_septa)
	if (quest.L_endless) rem = ""
	var t = "Septanovas: " + string(quest.S_num_septas)
	var s = string_width(t + rem) > w ? w/string_width(t + rem) : 1
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text_transformed(xcenter,ycenter +i*sprite_height,t + rem, s, s, 0)
	i++
}
if quest.C_num_octa != -1
{
	var rem = " / " + string(quest.C_num_octa)
	if (quest.L_endless) rem = ""
	var t = "Octanovas: " + string(quest.S_num_octas)
	var s = string_width(t + rem) > w ? w/string_width(t + rem) : 1
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text_transformed(xcenter,ycenter +i*sprite_height,t + rem, s, s, 0)
	i++
}

if quest.L_movesleft != -1
{
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text(xcenter,ycenter +i*sprite_height,"Moves Left: " + string(quest.L_movesleft))
	i++
}

if quest.L_pointslimit != -1
{
	var v = (Gamerule_1.points <= quest.L_pointslimit) ? quest.L_pointslimit - Gamerule_1.points : 0
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text(xcenter,ycenter +i*sprite_height,"Points Left: " + string(v))
	i++
}

if (quest.C_pattern_enabled)
{
	var xx = i == 0 ? x + sprite_width / 2 : room_width - 96 //x + sprite_width/2
	var yy = i == 0 ? y : 512 + 64 //+ i*sprite_height
	draw_sprite(spr_chl_pattern,0,xx,yy)
	for(var l = 0; l< 8; l++)
	{
		for(var k = 0; k <8; k++)
		{
			var sk = quest.C_pattern[l,k]
			if sk != -1
			{
				var spr = spr_chl_pattern_gems_off
				if (quest.C_pattern_isOn[l,k]) spr = spr_chl_pattern_gems_on
				draw_sprite(spr,sk,xx+9 -64 + k*16,yy+9 + l*16)
			}
		}
	}
	//i++
}
