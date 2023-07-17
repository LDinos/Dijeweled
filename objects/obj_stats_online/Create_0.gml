/// @description
#macro NAME 0
#macro POINTS 1
#macro STYLE 2
#macro MATCHES 3

stats_index = 0 //the current array index for the gamemode to show stats from
stats_array = ["time_attack_60","time_attack_180","time_attack_300"]
stats_titles = ["TIME ATTACK: 1 MIN", "TIME ATTACK: 3 MINS","TIME ATTACK: 5 MINS"]
stats_board = []
stats_loaded = false
stats_page = 0
stats_failed = false
stats_order = POINTS
hover = -1
client_socket = network_create_socket(network_socket_ws);
buffer = buffer_create(1,buffer_grow,1)
var ip = network_resolve("ldinos.ddns.net")
network_connect_raw_async(client_socket, ip, 6970)

#region drawing variables
box_title_width = 192 //Gamemode Title box
box_title_height = 32
box_width = 512 //Stats box
box_height = 320
box_no_percentage = 0.06 //percentage of box width that the title "No." takes
box_name_percentage = 0.4 //percentage of box width that the title "Name" takes
box_score_percentage = 0.6 //percentage of box width that the title "Score" takes
box_style_percentage = 0.8 //percentage of box width that the title "Score" takes
#endregion

function request_stats() {
	stats_loaded = false
	stats_board = []
	stats_page = 0
	var request = {
		"gamemode" : "stats",
		"type" : stats_array[stats_index]
	}
	buffer_seek(buffer,buffer_seek_start,0)
	buffer_write(buffer,buffer_text,json_stringify(request))
	network_send_raw(client_socket,buffer,buffer_tell(buffer))
}

function order(category) {
	stats_order = category
	var n = array_length(stats_board)
	for(var i = 0; i < n-1; i++) {
		for(j = 0; j < n-i-1; j++) {
			if (stats_board[j][category] < stats_board[j+1][category]) {
				swap(j, j+1)
			}
		}
	}
}

function swap(i1,i2) {
	var temp = stats_board[i1][NAME]
	stats_board[i1][NAME] = stats_board[i2][NAME]
	stats_board[i2][NAME] = temp 
	temp = stats_board[i1][POINTS]
	stats_board[i1][POINTS] = stats_board[i2][POINTS]
	stats_board[i2][POINTS] = temp
	temp = stats_board[i1][STYLE]
	stats_board[i1][STYLE] = stats_board[i2][STYLE]
	stats_board[i2][STYLE] = temp
	temp = stats_board[i1][MATCHES]
	stats_board[i1][MATCHES] = stats_board[i2][MATCHES]
	stats_board[i2][MATCHES] = temp
}