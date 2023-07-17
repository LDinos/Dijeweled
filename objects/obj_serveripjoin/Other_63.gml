/// @description Insert description here
var i_d = async_load[?"id"];

if i_d == dialog
    {
    if async_load[?"status"]
        {
        global.ip = string(async_load[?"result"]);
		instance_create(x,y,obj_client)
        }
    }