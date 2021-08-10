/// @description Stop spinning after spacebar
if acc > 0 
{
	acc -= 0.05
	rottoend += acc
	if rottoend >= 180 rottoend -=180
	alarm[3] = 1
}
else 
{
	acc = 0
	event_user(0)
}


