/// @description All rules are here for the second local player.
//gems_id_array = gem id's
//gems_skin_array = gem skins (fallen down)
//gems_fallen = gem ids fallen down
isReplay = false
#region Powerups
	horizontal_swaps_only = false
	vertical_swaps_only = false
	inverted_swaps = false
#endregion

should_move = true //gems should be able to move physically
points_base_value = 25; //for classic mode, add plus base value for combos that are more than 1
points_type = 1; //different way to get points in classic mode ( = 2)
ONLINE_give_gem_id = false //if true, each gem when it spawns, will give ID info to the other player
if global.online
{
	GEM_ID = -1 //a list that fits 64 gems, so online multiplayer can have ids for each enemy gem
	for (var i = 0; i < 64; i++) {GEM_ID[i] = -1}
}
geodemax = 4 //max geodes that a coal can spawn
geode_xplier = 1 //coal geode points multiplier. Some modes like Countdown have a huge multiplier
Moves_Made = 0 //used in survivor
#region level variables
level = 1
levelbarfull = false //is the bar of the level full?
levelpointsneeded = 5000 //how many points do we need to finish the current level
levelcompleted = false //has the voice said "level complete"? This is used to reset the levelbar after all gems are steady
#endregion


isQuest = false //Are we on challenge mode? (Used to check 'with(quest_control)' only on challenge based levels)
//debug = true //Are we debugging? If so, some buttons will be enabled for debug
previous_points = 0 //Points on the previous level, so that we can make the progress bar relevant to that
zenify = false //Are we zenifying atm?
amzen = false //Am I on Zen? Used on levelcompletegetnextpoints
chain = 0 //Number of matches done legally and consecutively
challengewon = false //if we have a quest and we beat it, dont gameover the game at certain conditions
closecall = false //if a bomb is destroyed when its 0, and cascades are above 4, its a close call (check gem1 destroy event)
bomb_danger = 1 //skull danger on bomb spinner
var ch = irandom(99)
bomb_win = (ch > 99/(5-bomb_danger)) //chance to win a predetermined bomb defusal
bombis0 = false //variable used to disable player control when bomb counter hits 0
juststarted = true //used for replay, dont give replay button if no user matches have been made yet. this is set to false after a match
reset_compliments()
gemdestroyonemove = 0 //gems destroyed in one move (used for the blue text)

list_of_skulls = ds_list_create()
list_of_hiddengems = ds_list_create() //list of all below ice hidden gems
list_of_ampowered = ds_list_create() //list of all just powered gems, so they can become vulnerable again
list_of_doom = noone //one doom only allowed
list_of_ice_locks = ds_list_create() //used so that we can count the number of ice locks
list_of_locks = ds_list_create() //used so that we can count the number of locks
list_of_coals = ds_list_create() //Used so that we can count the number of coals
list_of_fruits = ds_list_create() //list of all EXPLODING fruits (NOT fruits in general)
list_of_bombs = ds_list_create() //all bombs are insterted here so we can deescalate their values each turn
list_of_matches = ds_list_create() //when checking for matches, all colors of the matches will be put here and checked by the challenge bonus
rows = 8 //board row stuff, same as global.board_rows
global.board_rows = 8
global.paused = false //if we have pressed ESC

#region allowances
gamepad_allowed = true;
keyboard_allowed = true;
infobox_allowed = false //do we allow infobox help for unique gems that appear for the first time?
shader_allowed = shader_is_compiled(shd_bright_contrast)
ultranovas_allowed = true //do we allow any novas above 6? (septanova and octanova)
specials_allowed = true //do we allow special gems or is this bejeweled 1?
levelcompleteallowed = true //do we allow "Level complete" or is this some kind of quest
replay_illegals_allowed = false //just for zenify mode where you make a last illegal move (for replay)
wheel_spinner_allowed = false //do we allow bomb wheel spinners, or do we lose automatically on bomb = 0?
points_xpliered_auto = false //is the multiplier dependant of the xplier object (false) or is it the same value as the level (true). 
replay_allowed = false//do we allow combo replays?
autosave_allowed = true //do we allow autosaving?
compliments_allowed = true //do we hear the voice complimenting you?
multiswap_allowed = false //do we allow multiswapping (swapping while cascades are happening)?
points_allowed = true //do we count for points?
controlallowed = true //are we allowed to move around / select gems at all?
spawnallowed = true //are we allowed to spawn gems?
AHM_allowed = true //should we always have possible moves? Used in arcade where moves MUST always exist
illegals_allowed = true //are we allowed to do matchless swaps?
force_moves_allowed = true //Do we force to always have moves, no matter what? (spawns a hypercube in that rare case)
end_on_nomoves = true //Gameover when we have no moves?
blazingallowed = false //is blazing speed allowed?
timegemallowed = false //are time gems allowed? (OBSOLETE)
multiallowed = false //are multiplier gems allowed? (OBSOLETE)
hypeallowed = false //do we allow hypercubes?
time_allowed = false //do we have a timer (eg blitz mode)?
illegal_cando = true //if i am multiswapping and i do an illegal, i cannot do another match as a punishment
#endregion

check_for_xplier = false //has a USER match happened (and not cascade)
increase_xplier = false //after a player match has happened, if an illegal move was triggered, this will become false and lose xplier
cur_time = 0 //time passed in gamemaker frames (cur_time = 60 -> 1 second)
flameon = false //are flame gems currently exploding? This is used to disable spawning when thats happening
color = c_red //debug for drawGUI
challenge_active = false //if a challenge has been completed, challengebonus is closing doors and stuff. let us know that

iam = Gamerule_local //who am i?
num_skin = 6 //number of skins, beginning from 0 to 6 (coal is on 7 but we dont spawn coals using this)
board_xsize = 8 //board size for collumns (width)
board_ysize = 8 //board size for rows (height)
gameover = false //Is the game over?
style = 0 //style points (unused)
matches = 0 //number of matches made
future_summoves = 0 //after an AHM execution, this becomes 1 so it wont redo AHM work for no reason. This gets reseted when gemactive = 1
summoves2 = 0 //number of possible moves
timegemcooldown = false //OBSOLETE

blazingchainup = false;
blazingshouldup = false //did we do a match to make the blaze go up?
blazingspeed = false //are we currently blazing weed?
blazingspeedchain = 0 //on 15, blazingspeed becomes true
blazingspeedtotalchain = 0; //counts consecutive matches
blazingcounter = 140 //timer between matches, after which blazing chain will be lost
alarm[3] = 1
for(var i=0;i<8;i++)
	{
		for(var j=0;j<8;j++)
		{
			gems_fallen[i][j] = -4 //gems on fallen state (seeing the future to see where the gems WILL be)
			gems_id_array[i][j] = -4 //gems on normal position
		}
	}
//above_ready = false; //are we ready to gemactive = 1 (checking gems above the board)?
ready = true; //are we ready to gemactive = 1?
	
doonce = 1 //do something only once
multinum = 0 //xplier gem possibly (obsolete)
xplier = 1 // multiplier for points
Gamestart = false //has the game started?
alarm[2] = 60 //gamestart

lightOn = false //is a star/lightning gem currently being triggered?
hypeOn = false //is a hypercube currently being triggered?
octanovaOn = false //is an octanova currently being triggered? used in online

cursor_x1 = 3 //default positions of cursors x1 (used in flame gem centering to see where to make the flame on 4 gem match etc)
cursor_x2 = 0 //-||- x2
cursor_y1 = 3 //-||- y1 
cursor_y2 = 0 //-||- y2

compliment_points = 0 //points used for complimentary reasons
points = 0 //points
combo = 0 //cascade count
bestcombo = 0 //best cascade so far
depth = -2
IsGemActive = false //Am I able to check for matches?
IsGemActive2 = false //Am I able to spawn fruits and generally anything else after the cascades have stopped?
moving = false //are gems doing swap animation?
swap_happened = false //when you do a swap, this goes true for just a step. Used in controls
var bo = instance_create_depth(Board_local.x - 32, (Board_local.y + 32) + 64*(rows-1),-99,stopper) //make board collision at bottom
bo.image_xscale = 64*8 //make it 512 of width (board width)
bo.image_yscale = 64 //make it fat enough to stop gems from penetrating it


check_summoves(false)
//gaps = array_create(8,7)
for(var i=7;i>=0;i--) gaps[i] = 8
check_gaps(Board_local,Gem_local)
