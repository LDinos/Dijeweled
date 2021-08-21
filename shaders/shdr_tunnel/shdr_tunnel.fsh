/*-----------------------------------------------------------------------------
Tunnel distortion fragment shader
-------------------------------------------------------------------------------
_______________________________________________________________________________
INFO:
-------------------------------------------------------------------------------
Distorts a surface so it looks like the inside of a tunnel.

	+-----SAMPLES TAKEN-----+
	|  / / /  | | |  \ \ \  | By picking samples closer to the center in the
	|  -------------------  | top and bottom section the result of those
	|  | | |  | | |  | | |  | sections will be stretched.
	|  -------------------  | 
	|  \ \ \  | | |  / / /  |
	+-----------------------+
	
	+---------RESULT--------+
	| \ \ \   | | |   / / / | -> top section:    A) stretch x by a lot        &   B) squash y by a lot
	|  -------------------  |									         
	|  | | |  | | |  | | |  | -> middle section: C) stretch x just slightly   &   B) stretch y just slightly
	|  -------------------  |									         
	| / / /   | | |   \ \ \ | -> bottom section: A) stretch x by a lot        &   B) squash by y a lot
	+-----------------------+
	
Simple bonus effect: a gradient light overlaying the tunnel to add some sense
of depth to the tunnel.

_______________________________________________________________________________
UNIFORMS:
-------------------------------------------------------------------------------
Tunnel deformation:
vec3	deform			0 < x < 1:	deform the x axis
						0 < y < 1:	deform the y axis
						0 < z < 1:	scale the tunnel
						w:			the maximum distortion possible with deform.x & deform.z
									needs to be calculated outside for better performance by the formula:
									deform.w = -sqrt(0.25 - power(-deform_x * 0.5, 2.0)) * deform.z + deform.z * 0.5;
								
Bonus: simple gradient overlay light effect:
float	light_size		0 < light_size < 1
						width of the bright core
float	gradient_size	0 < gradient_size < 1
						width of the gradient from dark to bright and back to dark
float	light_pos		0 < light_pos < 1
						position of the bright center on the y axis
float	overlay_str		0 < overlay_str < 1 (or more to exaggerate)
						strength of the effect
	
_______________________________________________________________________________
EXAMPLE:
-------------------------------------------------------------------------------

Create event:
---------------------------------------
sprite			= spr_tunnel_distortion_bg_01;
tunnel_offset_x	= 0;
tunnel_offset_y	= 0;
srf_tunnel		= -1;

shader			= shd_tunnel_distortion;
u_deform		= shader_get_uniform(shader, "deform");
u_light_size	= shader_get_uniform(shader, "light_size");
u_gradient_size	= shader_get_uniform(shader, "gradient_size");
u_light_pos		= shader_get_uniform(shader, "light_pos");
u_overlay_str	= shader_get_uniform(shader, "overlay_str");

	
Draw event:
---------------------------------------
// set up values:
var deform_x		= 0.8;
var deform_y		= 0.9;
var deform_size		= 0.6;
var max_distortion	= -sqrt(0.25 - power(-deform_x * 0.5, 2.0)) * deform_size + deform_size * 0.5;

// create tunnel surface:
if (!surface_exists(srf_tunnel))
	srf_tunnel = surface_create(room_width, room_height);

// draw tunnel sprite to tunnel surface:
surface_set_target(srf_tunnel);
draw_sprite_tiled_ext(sprite, 0, round(tunnel_offset_x), round(tunnel_offset_y), 2, 2, c_white, 1);
surface_reset_target();

// draw tunnel surface to screen:
gpu_set_tex_filter(true);
shader_set(shader);
	shader_set_uniform_f(u_deform, deform_x, deform_y, deform_size, max_distortion);	
	shader_set_uniform_f(u_light_size	, 0.1);	
	shader_set_uniform_f(u_gradient_size, 0.2);	
	shader_set_uniform_f(u_light_pos	, 0.75);	
	shader_set_uniform_f(u_overlay_str	, 0.6);	
	draw_surface(srf_tunnel, 0, 0);
shader_reset();
gpu_set_tex_filter(false);

*/
varying vec2	v_vTexcoord;

uniform vec4	deform;
uniform float	light_size;
uniform float	gradient_size;
uniform float	light_pos;
uniform float	overlay_str;

#define DEFORM_SIZE deform.z
#define MAX_DISTORTION deform.w


void main() {	
	// DEFINITON & DECLARATION:
	//--------------------------------------------------------------------
	float	distortion, deform_y_fixed;
	vec2	sample_shift, dist;
	vec4	base_col;
	
	dist				= 0.5 - v_vTexcoord; // distance from fragment to center in UVs: left or top of the center will be positive
	
	distortion			= -sqrt(0.25 - pow(v_vTexcoord.y * deform.x - deform.x * 0.5, 2.0)) * DEFORM_SIZE + DEFORM_SIZE * 0.5;
		
	
	// A) STRETCH X-AXIS:
	//--------------------------------------------------------------------
	// apply distorion to the x component so it's:
	// positive on the left, 0 at the center and negative on the right
	sample_shift.x		= distortion * dist.x * 2.0;
	
	
	// B/C) SQUASH & STRETCH Y-AXIS:
	//--------------------------------------------------------------------	
	// B) vertically squash top and bottom sections and vertically stretch middle section:
	deform_y_fixed		= (MAX_DISTORTION - distortion) * deform.y;	// top & bottom: = 0 | centre: = max_distortion * deform.y
	sample_shift.y		=  deform_y_fixed * dist.y;					// top & bottom: = deform_y_fixed * (+-)0.5 | centre: = 0;
	// C) horizontally stretch middle section to compensate B):
	sample_shift.x		+= deform_y_fixed * dist.x;					// left & right: += deform_y_fixed * (+-)0.5 | centre: += 0;
	
	
	// BASE COLOUR:
	//--------------------------------------------------------------------
	base_col			= texture2D(gm_BaseTexture, sample_shift + v_vTexcoord);
	
	
	//OVERLAY COLOUR:
	//--------------------------------------------------------------------
	float gradient1, gradient2, grey;
	vec3 blend_col;
	gradient1			= smoothstep(light_pos - 0.5 * light_size - gradient_size, light_pos - 0.5 * light_size, v_vTexcoord.y); // gradient above light_pos
	gradient2			= smoothstep(light_pos + 0.5 * light_size + gradient_size, light_pos + 0.5 * light_size, v_vTexcoord.y); // gradient below light_pos
	gradient1			= mix(gradient1, gradient2, step(light_pos, v_vTexcoord.y)); // stitch both gradients together
	gradient1			= gradient1 * 0.7 + 0.3; // turn black to dark grey
	
	
	// overlay:
	grey				= dot(base_col.rgb, vec3(0.299, 0.587, 0.114)); // get base colour value
	blend_col			= grey > 0.5 ? 1.0 - (1.0 - 2.0 * (gradient1 - 0.5)) * (1.0 - base_col.rgb) : 2.0 * gradient1 * base_col.rgb; // calculate overlay colour
	base_col.rgb		= mix(base_col.rgb, blend_col, overlay_str); // apply overlay strength
	
	
	// OUTPUT:
	//--------------------------------------------------------------------
	gl_FragColor		= base_col;
	
	
	
	// squared version:
	//vec2 dist				= 0.5 - v_vTexcoord;
	//float sample_x_shift	= dist.y * dist.y * dist.x * 4.0 * deform;
	//gl_FragColor			= texture2D(gm_BaseTexture, vec2(v_vTexcoord.x + sample_x_shift, v_vTexcoord.y));
}
