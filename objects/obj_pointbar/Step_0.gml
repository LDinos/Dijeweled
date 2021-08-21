/// @description Insert description here
// You can write your code in this editor
if Gamerule_1.points > 0 && Gamerule_1.points < obj_quest_control.C_num_points && !Gamerule_1.lightOn && !Gamerule_1.flameon
{
	if (Gamerule_1.points - obj_quest_control.L_drain < 0) Gamerule_1.points = 0
	else Gamerule_1.points -= obj_quest_control.L_drain
}
