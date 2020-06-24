Gamerule_1.spawnallowed = false
pipe_x = 1280/2
spawn_move = false
texttowrite = 0
iwannalose = true
rottoend = 0
audio_play_sound(bombalarm,0,0)
ended = false
k = 1
audio_play_sound(siren,0,1)
maxacc = 8 //max accelleration
alreadydone = false
acc2 = 0
sp = 0
acc = 0
rot = 0
dest = rot
danger = clamp(Gamerule_1.bomb_danger,1,3)
instance_create_depth(0,512,-9,obj_fade)
with(obj_fade) alarm[1] = -1
hook = false
x = room_width/2
y = 512 - sprite_height
ytoreach = 720/2 + 512
instance_create(x,y+72,wheel_butt)
alarm[9] = 10 //tick
alarm[0] = 45

