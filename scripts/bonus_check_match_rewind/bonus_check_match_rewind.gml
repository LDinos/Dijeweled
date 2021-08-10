//Did we match a color but it wasn't the desired one? Now we need to move the indicator back, but how much?
var flag, bonus_movement;
bonus_movement = bonus_index //go to zero first (bonus index - bonus_movement)
//bonus_index = 0

do
{
	flag = false
	for(var i = 0; i < ds_list_size(list_of_matches); i++)
	{
		if list_of_matches[| i] == bonus[bonus_index - bonus_movement]
		{
				bonus_movement-- //dont go to zero anymore, indicator should be a little more to the right
				ds_list_delete(list_of_matches,i)
				flag = true
		
		}
		if flag break;
	}
	
}
until flag = false
bonus_set_index(bonus_index-bonus_movement)
