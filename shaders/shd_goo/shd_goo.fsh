//https://www.shadertoy.com/view/wXVSRd
uniform float u_time;
uniform vec2 u_resolution;

mat2 rotate2D(float r) {
    return mat2(
        cos(r), sin(r),
        -sin(r), cos(r)
    );
}

void main() {
    vec2 uv = (gl_FragCoord.xy - 0.5 * u_resolution.xy) / u_resolution.y;
    vec3 col = vec3(0.0);
    float t = u_time / 4.0;
    
    vec2 n = vec2(0.0);
    vec2 q;
    vec2 N = vec2(0.0);
    vec2 p = uv + sin(t * 0.1) / 10.0;
    float S = 10.0;
    mat2 m = rotate2D(1.0 - 0.0001);

    for (int jj = 0; jj < 30; jj++) {
        float j = float(jj) + 1.0; // emulate j++ starting from 0.0

        p *= m;
        n *= m;
        q = p * S + j + n + t;
        n += sin(q);
        N += cos(q) / S;
        S *= 1.5;
    }
    
    col = vec3(2.0, 4.0, 1.0) * pow((N.x + N.y + 0.2) + 0.005 / length(N), 2.1);
    
    gl_FragColor = vec4(col, 1.0);
}