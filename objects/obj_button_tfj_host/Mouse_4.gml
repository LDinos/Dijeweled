/// @description Insert description here
if (!global.canbepressed) exit

fade_to_room(rm_TFJeweled_lobby)
global.IAMHOST = true
global.canbepressed = false
obj_tfj_client.sendRequest("LBH") //LOBBYHOST

