room_speed = 60
draw_texture_flush()
global.chl_to_unlock = "25:3"
global.chl_to_succeed = "25:2"
with(Gamerule_1)
{
	//points_xpliered_auto = true
	compliments_allowed = false
	levelcompleteallowed = false
	
	end_on_nomoves = false
	illegals_allowed = true
	AHM_allowed = true
	hypeallowed = false
	
	replay_allowed = false
	points_allowed = false
	autosave_allowed = false
	spawnallowed = true
	force_moves_allowed = false
	multiswap_allowed = false
}

with(obj_quest_control)
{
	C_movesneeded = 50
	//L_nospecialgems = 0
	//L_time = 300
	//L_onemove = true
}
with(obj_doom_control)
{
	DoomSpawnInstant = true //Should it spawn every time it gets destroyed?

DoomCounterLevelBased = false //Is the counter of the Dooms a level based variable?
DoomCounterDefault = 10 //The value to give to the newly spawned Doom
DoomCounter = DoomCounterDefault //The value to give to the newly spawned Doom

}
with(obj_bombcontrol)
{
TurnsToSpawnLevelBased = false //Does the variable turntospawn consist of the level variable?
BombSpawnLevelMin = -1 //When do we start allowing bombs to spawn? (-1 = infinite)
BombSpawnLevelMax = -1 //When do we stop allowing bombs? (-1 = infinite)
TurnsToSpawnDefault = 1
TurnsToSpawn = TurnsToSpawnDefault; //After how many turns will a bomb spawn? This changes every level if it is level based.
TurnsToSpawnCur = TurnsToSpawn //This gets decreased every turn. after going to 0, it becomes TurnsToSpawn again.
BombCounterLevelBased = false //Is the counter of the bombs a level based variable?
BombCounterDefault = 12 //The value to give to the newly spawned bomb
BombCounter = BombCounterDefault //The value to give to the newly spawned bomb
BombMax = 2 //Max amount of bombs on screen
ExaggerateOnce = false
BombExaggerate = -1 //Make bombs spawn in less time (1/3 of turns to spawn). -1 = disabled, 0-100 percent of bar to pass to enable it
}
with(obj_questmusic)
{
	danger_enable = true
	mus_main = mus_timerunning
	mus_danger = mus_timerunning_danger
	mus_win = mus_takeyourtimewin
	mus_loss = mus_takeyourtimeloss
	event_user(0)
}

instance_create(x,y,spawner1)
repeat(5) make_companion(false)
repeat(3) make_companion(true)
/*
var tb = instance_create(576,1088,obj_timebar)
with(tb)
{
	var t = 300
	time_full = t
	time_now = t
}
