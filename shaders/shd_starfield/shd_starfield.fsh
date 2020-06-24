uniform float iGlobalTime; 
uniform vec3 iResolution; 
varying vec2 fragCoord; 
/*
	Shader Sundays! (7/52) 
	"Starfield from Art of Code"
	
	Had relatives visiting this week so couldn't spend too much time on this one. 
	Instead I decided to follow along one of @Bigwings excellent shader tutorials and get 
	something cool going in under an hour. This is basically a one for one version of his 
	shader, except I added a cool nebula cloud that I repurposed from a previous shader.
	Lots of details could be added to this to make it better, like random nebula variation,
	physically accurate star color pattern and nicer star clustering. But alas, maybe for
	the next star pattern. Cheers!

	Part1:
	https://www.youtube.com/watch?v=rvDo9LvfoVE&feature=emb_title

	Part2:
	https://www.youtube.com/watch?v=dhuigO4A7RY&feature=emb_title
	
	Checkout his patreon! 
	https://www.patreon.com/TheArtOfCode
*/
#define INV_GAMMA  0.454545
#define M_PI acos(-1.0)
#define M_TAU M_PI*2.0

vec2 
rotate(vec2 a, float b)
{
    float c = cos(b);
    float s = sin(b);
    return vec2(
        a.x * c - a.y * s,
        a.x * s + a.y * c
    );
}

float
makeStar(vec2 uv, float flare)
{
    float d = length(uv);
    float star = .06/d;
    float m = star;


    float rays = max(1.0 - abs(uv.x*uv.y * 1000.0), 0.0);
    m +=rays * flare;

    uv = rotate(uv, M_PI/ 4.0);
        rays = max(1.0 - abs(uv.x*uv.y * 1000.0), 0.0);
        m +=rays*flare *0.3;

    m *= smoothstep(1.0, .2, d);

    return m;
}

float
hash21(vec2 p)
{
    p = fract(p*vec2(123.34, 456.21));
    p += dot(p, p+45.32);
    return fract(p.x*p.y);
}

vec2 
random2D(vec2 val){
    val = vec2(dot(val, vec2(127.1, 311.7)),
               dot(val, vec2(242.51, 184.2)));
    
    float scale = 182364.0;
    return 1.0 -  2.0 * fract(sin(val) * scale);
}

float 
noise(vec2 p){
    const float K1 = 0.366025404; // (sqrt(3)-1)/2;
    const float K2 = 0.211324865; // (3-sqrt(3))/6;

    vec2 i = floor( p + (p.x + p.y) * K1);

    vec2 a = p - i + (i.x + i.y)*K2;
    vec2 o = step(a.yx, a.xy);
    vec2 b = a - o + K2;
    vec2 c = a - 1.0 + 2.0*K2;

    vec3 h = max( 0.5 - vec3(dot(a,a), dot(b,b), dot(c,c)), 0.0);

    vec3 n = h*h*h*h*vec3(dot(a, random2D(i)), dot(b, random2D(i + o)), dot(c, random2D(i+1.0)));

    return dot(n, vec3(100.0));
}
float 
simplex(vec2 p, int octaves){
    mat2 m = mat2(1.6, 1.2, -1.2, 1.6);

    float f = 0.0;
    float scale = 1.0;
    for(int i = 0; i < octaves; i++){
        scale /= 2.0;
        f += scale*noise(p);
        p *= m;
    }

    return 0.5 + 0.5*f;
}

vec3
StarLayer(vec2 uv)
{
    vec3 col = vec3(0.0);
    vec2 id = floor(uv);
    vec2 gv = fract(uv) - 0.5;

    for(int y = -1; y <= 1; ++y)
    for(int x = -1; x <= 1; ++x)
    {
        vec2 offset = vec2(x, y);
        float n = hash21(id + offset);
        float size = fract(n*345.45);

        float star = makeStar(gv - offset - vec2(n, fract(n*34.0) ) + .5, smoothstep(.9, 1.0, size)* 0.6);
        vec3 color = sin(vec3(1.2, .3, .2)*fract(n*2345.2) * 123.2)*.5 + 0.5;
        color = color * vec3(1.0, 0.25, 1.0 + size);
        star *= sin(iGlobalTime*3.0 + n*M_TAU)*.5 +1.;
        col += star*size*color;
    }

    return col;
}

vec3
gas_halo_outer(vec2 uv, float size, int density)
{
    float halo_mask = 0.0;
    vec3 col = vec3(0.0);
    vec3 color =  vec3(0.1, 0.3, 1.8);
    for(int i = 0; i < density; ++i){
        float offset = hash21(vec2(i));
        float r = size + (size / 2.0) * cos(atan(uv.y + offset * 0.2, uv.x)* (3.0 ) + radians(offset * 360.0));
        halo_mask = smoothstep(r, r + 0.35, length(uv));
        col += color * (1.0 - halo_mask - simplex(uv, 5)) *  1.0 / float(density);
    }
    return clamp(col, 0.0, 1.0);
}

#define NUM_LAYERS 8.0
void main()
{
    vec2 uv  = ((fragCoord) - 0.5*iResolution.xy)/iResolution.y;

    vec3 col = vec3(0.0);
    float t = iGlobalTime*.04;
    
    for(float i = 0.0;i < 1.0; i += 1.0/NUM_LAYERS)
    {
        float depth = fract(i +t);

        float scale = mix(5.0, 0.5, depth);

        float fade = depth*smoothstep(1., .9, depth);

        float size = 1.6;

        col += StarLayer(uv*scale + i*453.2)*fade;
        scale = mix(10.0, 0.5, fract(i + 1.0*t));
        col += gas_halo_outer(uv*scale + i*400.2, size, 10)*fade;
    }
    gl_FragColor = vec4(col, 1.0);
}