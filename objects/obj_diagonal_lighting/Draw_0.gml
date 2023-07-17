if( !surface_exists(mysurf) ){
mysurf = surface_create(512, 512);
}		
surface_set_target(mysurf);	
draw_clear_alpha(c_black, 0)
draw_set_blend_mode(bm_add)
//offset x and y temporarily so draw_self draws on the surface correctly
x -= MyBoard.x - 32
y -= MyBoard.y - 32
draw_self()
//undo the temporary offset
x += MyBoard.x - 32
y += MyBoard.y - 32
draw_sprite_ext(lightningglow,image_index,x - (MyBoard.x - 32),y - (MyBoard.y - 32),2,0.6,image_angle,color,glowalpha)

surface_reset_target();
draw_surface(mysurf, MyBoard.x - 32, MyBoard.y - 32);
draw_set_blend_mode(bm_normal)
