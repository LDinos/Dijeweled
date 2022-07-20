/// @description Insert description here
// You can write your code in this editor
#macro STATUS_LOCKED 1
#macro STATUS_UNLOCKED 0
#macro STATUS_COMPLETED 2

function change_to_quest(_index) {
	pre_dist = dist
	index = _index
	func = 0
	ini_open("challenges.ini")
		ini_write_real("Last Index","index", index)
	ini_close()

	if index = 26
	{
		instance_create(0,0,obj_scrolldn)
		instance_create(0,0,obj_scrollup)
		instance_destroy(obj_editdelete)
		with(obj_challenges_selection)
		{
			read_custom_quest_info()
		}
		//create_deledit(true)
		//with(obj_challenges_selection) custom_challengemenu_getinfo()
	}
	else
	{
		with(obj_challenges_selection)
		{
			index = index - other.page*6
		}
		page = 0
		instance_destroy(obj_scrolldn)
		instance_destroy(obj_scrollup)
		instance_destroy(obj_editdelete)
	}
}

page = 0 //page used for custom challenges
var survivor_unlock_thresold = 0; //on 15 challenges completed we unlock survivor gamemode
global.canbepressed = true
ini_open("challenges.ini")
	index = ini_read_real("Last Index","index", 0)
	for(var i=0;i<27;i++)
	{
		AR_titles[i] = ini_read_string("Titles",string(i),"-")
		for(var j=0;j<6;j++)
		{
			AR_challenges[i,j] = ini_read_string("Challenges",string(i)+":"+string(j),"-")
			AR_status[i,j] = ini_read_real("Info",string(i)+":"+string(j)+"-Status",STATUS_UNLOCKED)
			if (global.debug && AR_status[i,j] = STATUS_LOCKED) AR_status[i,j] = STATUS_UNLOCKED
			if (AR_status[i,j] == STATUS_COMPLETED) survivor_unlock_thresold++
		}
	}
ini_close()

if (survivor_unlock_thresold >= 15) {
	gamemode_unlock(MODE_SURVIVOR, 0, 0)
}

func = 1
dist = index*48
pre_dist = dist

quests_buttons = [
	[obj_challenges_room, obj_challenges_room],
	[noone, noone],
	[noone, noone],
	[noone, noone],
	[noone, noone],
	[noone, noone],
	[noone, noone],
	[obj_button_back, obj_button_open_quest],
]

for(i=0;i<6;i++)
{
	var c = instance_create(x, 128 + i*32 + 48*i,obj_challenges_selection)
	quests_buttons[i+1][0] = c
	quests_buttons[i+1][1] = c
	c.index = i
}

if index = 26
{
	instance_create(0,0,obj_scrolldn)
	instance_create(0,0,obj_scrollup)
	with(obj_challenges_selection) read_custom_quest_info()
	//create_deledit(false)
}
