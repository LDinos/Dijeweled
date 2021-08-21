/// @description Insert description here
hover = false
width = 19*16
height = 64
text = "Enable Bot"
if global.bot1 text = "Disable Bot"
if os_is_phone() instance_destroy() //no reason to give choice to disable bot when on phone
