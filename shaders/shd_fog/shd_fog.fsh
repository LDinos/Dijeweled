//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
uniform float u_time;

vec3 hsv2rgb(vec3 c) {
    vec3 rgb = clamp(abs(mod(c.x * 6.0 + vec3(0,4,2), 6.0) - 3.0) - 1.0, 0.0, 1.0);
    return c.z * mix(vec3(1.0), rgb, c.y);
}

void main() {
    vec2 uv = v_vTexcoord * 4.0;
    float wave = sin(uv.y + sin(uv.x * 2.0 + u_time)) + cos(uv.x + u_time * 0.5);
    float intensity = 0.5 + 0.5 * sin(wave + u_time);

    float hue = mod(uv.y * 0.1 + u_time * 0.05, 1.0);
    vec3 color = hsv2rgb(vec3(hue, 1.0, intensity));
    gl_FragColor = vec4(color, 1.0);
}
