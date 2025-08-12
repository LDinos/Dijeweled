// https://www.shadertoy.com/view/W3GSRc
uniform float u_time;
uniform vec2 u_resolution;

void main() {
    vec2 p = gl_FragCoord.xy;
    vec2 v = u_resolution.xy;

    // set position
    p = (p - v * 0.5) * 0.1 / v.y;

    // breathing effect
    p += p * sin(dot(p, p) * 20.0) * 0.01;

    // accumulate color
    vec4 c = vec4(0.0);

    for (int ii = 0; ii < 8; ii++) {
        float i = float(ii) + 0.5;

        // fractal formula and rotation
        p = abs(2.0 * fract(p - 0.5) - 1.0) * 
            mat2(
                cos(0.004 * (u_time) * i * i + 0.78),
                cos(0.004 * (u_time) * i * i + 0.78 * 7.0),
                cos(0.004 * (u_time) * i * i + 0.78 * 3.0),
                cos(0.004 * (u_time) * i * i + 0.78)
            );

        // coloration
        c += exp(-abs(p.y) * 9.0) * 
             (cos(vec4(2.0, 1.0, 0.3, 0.0) * i) * 0.3 + 0.1);
    }

    // palette
    c.gb *= 0.5;
	c.a = 1.0;

    gl_FragColor = c;
}