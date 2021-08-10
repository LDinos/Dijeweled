//@param gem_list
//@param cc_or_ccw?
///ALWAYS USED WITH(obj_twist_collider)
var gems = argument0
var cc = argument1
for(var i = 0; i<4;i++)
{
	gem[i] = gems[i]
	gemxxdef[i] = gems[i].x
	gemyydef[i] = gems[i].y
}
if cc == 1
{
	gemxx[0] = gems[0].x + 64 //first gem going right
	gemyy[0] = gems[0].y
	gemxx[1] = gems[1].x	  //second gem going down
	gemyy[1] = gems[1].y  +64
	gemxx[2] = gems[2].x - 64 //third gem going left
	gemyy[2] = gems[2].y
	gemxx[3] = gems[3].x	  //fourth gem going up
	gemyy[3] = gems[3].y - 64
}
else
{
	gemxx[0] = gems[0].x      //first gem going down
	gemyy[0] = gems[0].y + 64
	gemxx[1] = gems[1].x - 64 //second gem going left
	gemyy[1] = gems[1].y
	gemxx[2] = gems[2].x      //third gem going up
	gemyy[2] = gems[2].y - 64
	gemxx[3] = gems[3].x + 64  //fourth gem going right
	gemyy[3] = gems[3].y 
}