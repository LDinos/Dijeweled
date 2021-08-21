//
// Simple passthrough fragment shader
//
// credit: https://www.shadertoy.com/view/4tGXzt
// credit: https://www.shadertoy.com/view/4lyyzt
#define BEATMOVE 1
varying vec2 v_vTexcoord;
//varying vec4 v_vColour;
varying vec2 fragCoord;

uniform float     iTime;
uniform vec3      iResolution;

const float FREQ_RANGE = 64.0;
const float PI = 3.1415;
const float RADIUS = 0.6;
const float BRIGHTNESS = 0.2;
const float SPEED = 0.2;

//convert HSV to RGB
vec3 hsv2rgb(vec3 c){
    vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

float luma(vec3 color) {
  return dot(color, vec3(0.0, 0.0, 0.0));
}

float getfrequency(float x) {
	return 0.2;//texture2D(gm_BaseTexture, vec2(floor(x * FREQ_RANGE + 1.0) / FREQ_RANGE, 0.25)).x + 0.06;
}

float getfrequency_smooth(float x) {
	float index = floor(x * FREQ_RANGE) / FREQ_RANGE;
    float next = floor(x * FREQ_RANGE + 1.0) / FREQ_RANGE;
	return mix(getfrequency(index), getfrequency(next), smoothstep(0.1, 1.0, fract(x * FREQ_RANGE)));
}

float getfrequency_blend(float x) {
    return mix(getfrequency(x), getfrequency_smooth(x), 0.5);
}

vec3 doHalo(vec2 fragment, float radius) {
	float dist = length(fragment);
	float ring = 2.0 / abs(dist - radius);
	
	float b = dist < radius ? BRIGHTNESS * 0.3 : BRIGHTNESS;
	
	vec3 col = vec3(0.0);
	
	float angle = atan(fragment.x, fragment.y);
	col += hsv2rgb( vec3( ( angle + iTime * 0.9 ) / (PI * 2.0), 1.0, 1.0 ) ) * ring * b;
	
	float frequency = max(getfrequency_blend(abs(angle / PI)) - 0.001, 0.0);
	col *= frequency;
	
	// Black halo
	col *= smoothstep(radius * 0.5, radius, dist);
	
	return col;
}

vec3 doLine(vec2 fragment, float radius, float x) {
	vec3 col = hsv2rgb(vec3(x * 0.4 + iTime * 0.9, 1.0, 1.0));
	
	float freq = abs(fragment.x * 0.01);
	
	col *= (1.0 / abs(fragment.y)) * BRIGHTNESS * getfrequency(freq);	
	col = col * smoothstep(radius, radius * 0.01, abs(fragment.x));
	
	return col;
}


void main() {
    vec2 fragPos = fragCoord / iResolution.xy;
	fragPos = (fragPos - 1.0
             ) *1.0;
    fragPos.x *= iResolution.x / iResolution.y;
	fragPos.y -= 0.43;
	
	vec3 color = vec3(0.0, 0.0, 0.0);
	color += doHalo(fragPos, RADIUS);

    float c = cos(iTime * SPEED);
    float s = sin(iTime * SPEED);
    vec2 rot = mat2(c,s,-s,c) * fragPos;
	color += doLine(rot, RADIUS, rot.x);
	
	color += max(luma(color) - 1.0, 0.0);
    
	gl_FragColor = vec4(color, 1.0);
}