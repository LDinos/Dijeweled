//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
uniform float u_time;

vec3 hsv2rgb(vec3 c) {
    vec3 rgb = clamp(abs(mod(c.x * 6.0 + vec3(0, 4, 2), 6.0) - 3.0) - 1.0, 0.0, 1.0);
    return c.z * mix(vec3(1.0), rgb, c.y);
}

void main() {
    vec2 uv = v_vTexcoord * 5.0;
    float time = u_time * 0.2;
    // Plasma base pattern (combined sine waves)
    float val = sin(uv.x + time)
              + sin(uv.y + time * 1.2)
              + sin(uv.x + uv.y + time * 0.7)
              + cos(length(uv) + time * 0.5);

    val /= 4.0;

    // Shift hue over time, based on plasma distortion
    float hue = mod(val * 0.5 + time * 0.05, 1.0);

    // Lower value and clamp for more saturated color
    float value = 0.6 + 0.3 * val;  // range ~0.3–0.9
    float saturation = 1.0;

    vec3 color = hsv2rgb(vec3(hue, saturation, clamp(value, 0.0, 1.0)));
    gl_FragColor = vec4(color, 1.0);
}