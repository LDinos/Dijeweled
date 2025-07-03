//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
uniform float u_time;

void main() {
	float time = u_time * 0.5;
    vec2 uv = v_vTexcoord * 15.0;
    float wave = sin(uv.x + time) + cos(uv.y + time);
    float grid = abs(fract(uv.x) - 0.5) + abs(fract(uv.y) - 0.5);
    float intensity = 0.6 + 0.7 * sin(wave + grid);
	float blue = (sin(time*1.) + 1.) * (intensity/2.);
    float red = (sin(time*0.5) + 2.) * (intensity/4.);
    float green = (sin(time*0.35) + 1.) * (intensity/2.);
    gl_FragColor = vec4(red, green, blue, 1.0);
}
