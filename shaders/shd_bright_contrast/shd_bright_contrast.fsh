varying vec2 v_texcoord;

uniform float time;
uniform vec2 mouse_pos;
uniform vec2 resolution;
uniform float brightness_amount;
uniform float contrast_amount;

void main()
{ 
    vec4 colour = texture2D(gm_BaseTexture,v_texcoord);
    gl_FragColor = vec4( (colour.rgb+brightness_amount) * (1.0+contrast_amount)/1.0, colour.a);
}
