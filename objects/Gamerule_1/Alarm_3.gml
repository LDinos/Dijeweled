/// @description blazing speed countdown
// You can write your code in this editor
if !blazingspeed && IsGemActive
{
	if blazingspeedchain > 0 && blazingspeedchain < 15
	{
		if blazingcounter > 0 blazingcounter--
		else {
			blazingspeedchain = 0
			blazingspeedtotalchain = 0;
		}
	}
	else if blazingspeedchain >= 15
	{
		blazing_speed_enable(Board_1)
	}
}
alarm[3] = 1