/// @description send CBS
if(Gamerule_1.IsGemActive2)
{
	sendRequest("CBS|"+scr_board_to_string(Gamerule_1.gems_fallen)+"?"+string(Gamerule_1.points))
	Gamerule_1.points=0
	Gamerule_1.controlallowed=false
	alarm[0]=-1
	exit
}
alarm[0]=5
