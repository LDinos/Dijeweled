///@param i
///@param j
///@param Matchless
///@param Chal_bonus
///@param Xplier
///@param multiswap_allowed
///@param Bomb
///@param Doom
///@param Skull
///@param Lock
///@param Ice
///@param Coal
///@param Time
///@param Difficulty
///@param Status
///@param Hypercube
var i = argument0
var j = argument1
ini_write_string("Info",string(i) + ":" + string(j)+"-Matchless Moves",argument2)
ini_write_string("Info",string(i) + ":" + string(j)+"-Challenge Bonus",argument3)
ini_write_string("Info",string(i) + ":" + string(j)+"-Multiplier",argument4)
ini_write_string("Info",string(i) + ":" + string(j)+"-multiswap_allowed",argument5)
ini_write_string("Info",string(i) + ":" + string(j)+"-Hypercubes",argument15)
ini_write_string("Info",string(i) + ":" + string(j)+"-Bombs",argument6)
ini_write_string("Info",string(i) + ":" + string(j)+"-Dooms",argument7)
ini_write_string("Info",string(i) + ":" + string(j)+"-Skulls",argument8)
ini_write_string("Info",string(i) + ":" + string(j)+"-Locks",argument9)
ini_write_string("Info",string(i) + ":" + string(j)+"-Ice",argument10)
ini_write_string("Info",string(i) + ":" + string(j)+"-Coals",argument11)
ini_write_string("Info",string(i) + ":" + string(j)+"-Time",argument12)
ini_write_real("Info",string(i) + ":" + string(j)+"-Difficulty",argument13) //1-10
if !ini_key_exists("Info",string(i) + ":" + string(j)+"-Status") ini_write_real("Info",string(i) + ":" + string(j)+"-Status",argument14) //0 unlocked, 1 locked, 2 completed