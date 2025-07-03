//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
uniform float u_time;

vec3 palette_fire(float t) {
    vec3 color1 = vec3(0.2, 0.0, 0.0); // deep red
    vec3 color2 = vec3(0.8, 0.2, 0.0); // orange-red
    vec3 color3 = vec3(1.0, 0.6, 0.0); // bright orange
    vec3 color4 = vec3(1.0, 1.0, 0.0); // yellow

    if (t < 0.33) {
        return mix(color1, color2, t / 0.33);
    } else if (t < 0.66) {
        return mix(color2, color3, (t - 0.33) / 0.33);
    } else {
        return mix(color3, color4, (t - 0.66) / 0.34);
    }
}

void main() {
    vec2 uv = v_vTexcoord * 12.0;

    // Layered sine wave blobs
    float val = sin(uv.x + u_time)
              + sin(uv.y + u_time * 1.2)
              + sin(uv.x + uv.y + u_time * 0.7)
              + cos(length(uv) + u_time * 0.5);

    val = (val + 4.0) / 9.2; // Normalize to [0,1]

    // Soft feathering: emphasize blob cores but smooth the edges
    float feather = smoothstep(0.2, 0.6, val); // wider fade range

    // Optional: boost smoothness by remapping
    float t = smoothstep(0.0, 1.0, feather);

    vec3 color = palette_fire(t);
    gl_FragColor = vec4(color, 1.0);
}

