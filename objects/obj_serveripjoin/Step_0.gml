/// @description Insert description here
// You can write your code in this editor
if mouse_check_button_pressed(mb_right)
{
	if clipboard_has_text() {field = clipboard_get_text(); convert = true}
}

if keyboard_check_pressed(vk_enter)
    {
        
    if field != ""
        {
			global.ip = field
			instance_create(x,y,obj_client)
        }
            
    }

if keyboard_check_pressed(vk_backspace)
    {
    if once field = string_delete(field, string_length(field), 1);
	else
		{
			field = ""
			once = true
		}
	convert = true
    }
else if keyboard_check_pressed(vk_anykey)
    {
    if (keyboard_lastkey > 48 && keyboard_lastkey  < 91) || keyboard_lastchar = "." || keyboard_lastchar = "0"
        {		
        if string_length(field) <= 18
            {
				convert = true
				if !once {field = "";once = true}
                field = string(field) + string(keyboard_lastchar)   
            } 
        }
    }

if convert
{
	field_converted = ""
	for(var i = 0; i < string_length(field); i++)
	{
		var char_to_add = "."
		if string_char_at(field,i+1) != "."
		{
			char_to_add = "x"
		}
		field_converted += char_to_add
	}
	convert = false
}


