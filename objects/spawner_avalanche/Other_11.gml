/// @description Insert description here
var x1,y1,G,mskin,gemtype, boardtype;
gemtype = Gem_2
boardtype = Board_2
if !global.online {gemtype = Gem_local; boardtype = Board_local}
for(i=0;i<3;i++)
{
	for(j=0;j<8;j++)
	{
		x1 = boardtype.x + 64*j
		y1 = boardtype.y - 64*(i+1)
		mskin = gem_array[i][j]
		G = instance_create_depth(x1, y1,-1,gemtype)
		
			with(G) 
			{
				set_skin(other.gem_array[other.i,other.j])
				if global.online scr_add_gemid(Gamerule_2)
			}
		
	}
}