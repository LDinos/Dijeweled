//
// Simple passthrough fragment shader
//
uniform vec2 u_resolution;
uniform float u_time;
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec2 coord = 6.0 * gl_FragCoord.xy / u_resolution;
	float t = u_time;
	for (int n = 1; n < 32; n++){
	float i = float(n);
	coord += vec2(0.7 / i * sin(i * coord.y + t + 0.3 * i) + 0.7, 0.9 / i * sin(coord.x + t+ 0.3 * i));
	}

	vec3 color = vec3(0.5 * sin(coord.x) + 0.5, 0.5 * sin(coord.y) + 0.5, sin(coord.x + coord.y));

	gl_FragColor = vec4(color.xy/1.2, 0.7, 1.0);// * texture2D( gm_BaseTexture, v_vTexcoord );
    //gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
}
