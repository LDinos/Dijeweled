/// @description Light flickers
if r1 == 1
{
	r1 = 0
	r2 = 1
	r3 = 0
}
else if r2 == 1
{
	r1 = 0
	r2 = 0
	r3 = 1
}
else
{
	r1 = 1
	r2 = 0
	r3 = 0
}
alarm[1] = 30