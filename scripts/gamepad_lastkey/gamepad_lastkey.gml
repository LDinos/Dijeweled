///@param device
///Returns last pressed key
function gamepad_lastkey(argument0) {
	/* LIST
	32769 = gp_face1
	32770 = gp_face2
	32771 = gp_face3
	32772 = gp_face4

	32773 = gp_shoulderl
	32774 = gp_shoulderr
	32775 = gp_shoulderlb
	32776 = gp_shoulderrb

	32777 = gp_select
	32778 = gp_start

	32779 = gp_stickl
	32780 = gp_stickr

	32781 = gp_padu
	32782 = gp_padd
	32783 = gp_padl
	32784 = gp_padr

	32785 = gp_axislh
	32786 = gp_axislv
	32787 = gp_axisrh
	32788 = gp_axisrv
	*/

	var but = -1
	for (var i=gp_face1; i<gp_axisrv; i++)
	{
	    if gamepad_button_check(argument0, i)
		{
	        but = i
		}
	}
	return but;


}
