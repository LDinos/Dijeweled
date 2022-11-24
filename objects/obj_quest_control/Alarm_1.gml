/// @description Discord
var desc = "In Quest"
var downline = string(global.DIS_quest_category+1) + "-" + string(global.DIS_quest_incategory+1)
if (global.DIS_quest_category == 26)
{
	desc = "In Custom Quest"
	//downline = ""
}

DISCORD np_setpresence(downline, desc, "ico_512", "")