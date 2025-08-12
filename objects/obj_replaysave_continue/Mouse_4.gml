var json = json_read_parse(global.string_to_save)
json.title = obj_replaysave.text
json_write_file(global.string_to_save, json)
room_goto(rm_stats_blitz)