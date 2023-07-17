/// @description Insert description here
// You can write your code in this editor
draw_set_font(font0)
centerize_text()
var i = 0
//if instance_exists(obj_xplier) i++ //move us down
if (quest.C_num_chain != -1)
{
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text(xcenter,ycenter +i*sprite_height,"Chain: " + string(Gamerule_1.chain))
	i++
}

if (quest.C_num_zenifycombo != -1)
{
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text(xcenter,ycenter +i*sprite_height,"Zenify Combo: " + string(quest.S_num_zenifycombo))
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
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text(xcenter,ycenter +i*sprite_height,"Score: " + string(Gamerule_1.points))
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
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text(xcenter,ycenter +i*sprite_height,"Possible matches: " + string(Gamerule_1.summoves2))
	i++
}

if quest.C_cascades != -1
{
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text(xcenter,ycenter +i*sprite_height,"Cascades: " + string(Gamerule_1.combo))
	i++
}

if quest.C_destroy_locks != -1
{
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text(xcenter,ycenter +i*sprite_height,"Locks Destroyed: " + string(quest.S_destroyed_locks))
	i++
}

if quest.C_destroy_fruits != -1
{
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text(xcenter,ycenter +i*sprite_height,"Fruits Destroyed: " + string(quest.S_destroyed_fruits))
	i++
}

if quest.C_num_fruits != -1
{
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text(xcenter,ycenter +i*sprite_height,"Fruits: " + string(quest.S_num_fruits))
	i++
}

if quest.C_destroy_bombs != -1
{
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text(xcenter,ycenter +i*sprite_height,"Bombs Destroyed: " + string(quest.S_destroyed_bombs))
	i++
}

if quest.C_destroy_skulls != -1
{
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text(xcenter,ycenter +i*sprite_height,"Skulls Destroyed: " + string(quest.S_destroyed_skulls))
	i++
}

if quest.C_destroy_dooms != -1
{
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text(xcenter,ycenter +i*sprite_height,"Dooms Destroyed: " + string(quest.S_destroyed_dooms))
	i++
}

if quest.C_destroy_ice != -1
{
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text(xcenter,ycenter +i*sprite_height,"Ice Destroyed: " + string(quest.S_destroyed_ice))
	i++
}

if quest.C_destroy_coals!= -1
{
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text(xcenter,ycenter +i*sprite_height,"Coals Destroyed: " + string(quest.S_destroyed_coals))
	i++
}

if quest.C_destroy_gems != -1
{
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text(xcenter,ycenter +i*sprite_height,"Gems Destroyed: " + string(quest.S_destroyed_gems))
	i++
}
if quest.C_match_gems != -1
{
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text(xcenter,ycenter +i*sprite_height,"Gems Matched: " + string(quest.S_matched_gems))
	i++
}
if quest.C_destroy_flame != -1
{
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text(xcenter,ycenter +i*sprite_height,"Flames Destroyed: " + string(quest.S_destroyed_flames))
	i++
}
if quest.C_destroy_lightning != -1
{
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text(xcenter,ycenter +i*sprite_height,"Lightnings Destroyed: " + string(quest.S_destroyed_lights))
	i++
}
if quest.C_destroy_nova != -1
{
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text(xcenter,ycenter +i*sprite_height,"Novas Destroyed: " + string(quest.S_destroyed_novas))
	i++
}
if quest.C_destroy_septa != -1
{
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text(xcenter,ycenter +i*sprite_height,"Septas Destroyed: " + string(quest.S_destroyed_septas))
	i++
}
if quest.C_destroy_octa != -1
{
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text(xcenter,ycenter +i*sprite_height,"Octas Destroyed: " + string(quest.S_destroyed_octas))
	i++
}
if quest.C_destroy_hype != -1
{
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text(xcenter,ycenter +i*sprite_height,"Hypercubes Destroyed: " + string(quest.S_destroyed_hypes))
	i++
}
if quest.C_num_green != -1
{
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text(xcenter,ycenter +i*sprite_height,"Green Gems: " + string(quest.S_num_green))
	i++
}
if quest.C_num_red != -1
{
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text(xcenter,ycenter +i*sprite_height,"Red Gems: " + string(quest.S_num_red))
	i++
}
if quest.C_num_white != -1
{
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text(xcenter,ycenter +i*sprite_height,"White Gems: " + string(quest.S_num_white))
	i++
}
if quest.C_num_yellow != -1
{
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text(xcenter,ycenter +i*sprite_height,"Yellow Gems: " + string(quest.S_num_yellow))
	i++
}
if quest.C_num_purple != -1
{
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text(xcenter,ycenter +i*sprite_height,"Purple Gems: " + string(quest.S_num_purple))
	i++
}
if quest.C_num_orange != -1
{
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text(xcenter,ycenter +i*sprite_height,"Orange Gems: " + string(quest.S_num_orange))
	i++
}
if quest.C_num_blue != -1
{
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text(xcenter,ycenter +i*sprite_height,"Blue Gems: " + string(quest.S_num_blue))
	i++
}
if quest.C_num_coals != -1
{
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text(xcenter,ycenter +i*sprite_height,"Coals: " + string(quest.S_num_coals))
	i++
}
if quest.C_num_hype != -1
{
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text(xcenter,ycenter +i*sprite_height,"Hypercubes: " + string(quest.S_num_hypes))
	i++
}
if quest.C_num_flame != -1
{
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text(xcenter,ycenter +i*sprite_height,"Flames: " + string(quest.S_num_flames))
	i++
}
if quest.C_num_lightning != -1
{
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text(xcenter,ycenter +i*sprite_height,"Lightnings: " + string(quest.S_num_lights))
	i++
}
if quest.C_num_nova != -1
{
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text(xcenter,ycenter +i*sprite_height,"Supernovas: " + string(quest.S_num_novas))
	i++
}
if quest.C_num_septa != -1
{
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text(xcenter,ycenter +i*sprite_height,"Septanovas: " + string(quest.S_num_septas))
	i++
}
if quest.C_num_octa != -1
{
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text(xcenter,ycenter +i*sprite_height,"Octanovas: " + string(quest.S_num_octas))
	i++
}

if quest.L_movesleft != -1
{
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text(xcenter,ycenter +i*sprite_height,"Moves Left: " + string(quest.L_movesleft))
	i++
}
/*if quest.L_time != -1
{
	var t = round(obj_timebar.time_now)
	var t1 = t div 60
	var t2 = t mod 60
	var t3 = ""
	if (t2 < 10) t3 = "0"
	draw_sprite(sprite_index,0,x,y + i*sprite_height)
	draw_text(xcenter,ycenter +i*sprite_height,string(t1) + ":" + t3 + string(t2))
	i++
}*/
if (quest.C_pattern_enabled)
{
	var xx = x + sprite_width/2
	var yy = y + i*sprite_height
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
	i++
}
