/// @description Insert description here
// You can write your code in this editor
var len = array_length_1d(surf)
for(var i=0;i<len;i++) 
{
	if !am_done[i]
	{
		func[i] += 0.06
		if (func[i] >= 1) 
		{
			func[i] = 1
			num--
			am_done[i] = true
		}		
		var_circle_radius[i] = lerp(def_radius[i],def_radius_dest[i],func[i])
		var_circle_zoom_min[i] = lerp(def_zoom_min[i],1.0,func[i])
		var_circle_zoom_max[i] = lerp(def_zoom_max[i],0.0,func[i])		
	}
}
if num = 0 instance_destroy()