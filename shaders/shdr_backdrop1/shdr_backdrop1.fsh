//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
//varying vec4 v_vColour;
varying vec2 fragCoord;

uniform vec3 iResolution;
uniform float iTime;

void main()
{
	vec2 r = iResolution.xy;
	float t = iTime/6.0;
    vec3 c;
	float l,z=t;
	for(int i=0;i<3;i++) 
    {
		vec2 uv,p=fragCoord.xy/r;
		uv=p;
		p-=.5;
		p.x*=r.x/r.y;
		z+=.08;
		l=length(p/2.0)/2.0;
		uv+=p/l*(cos(z)+1.)*abs(sin(l*9.-z*2.));
		c[i]=.01/length(abs(mod(uv,1.)-.5));
	}
	gl_FragColor= vec4(c/l/3.0,t);
}
