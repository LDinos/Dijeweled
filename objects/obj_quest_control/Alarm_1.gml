/// @description Discord
var desc = "In Quest"
var downline = string(global.DIS_quest_category+1) + "-" + string(global.DIS_quest_incategory+1)
if (global.DIS_quest_category == 26)
{
	desc = "In Custom Quest"
	//downline = ""
}
discord_update_presence(desc,downline,"ico_512","")