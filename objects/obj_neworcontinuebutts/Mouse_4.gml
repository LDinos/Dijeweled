if image_index = 1 file_delete("autosave_" + string(room_get_name(global.goto)))
fade_to_room(global.goto)
instance_destroy(obj_neworcontinue)