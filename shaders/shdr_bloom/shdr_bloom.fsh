//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float blurSize;
uniform float intensity;

void main()
{
   vec4 sum = vec4(0);
   int j;
   int i;

   // take nine samples, with the distance blurSize between them
   sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x - 4.0*blurSize, v_vTexcoord.y)) * 0.05;
   sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x - 3.0*blurSize, v_vTexcoord.y)) * 0.09;
   sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x - 2.0*blurSize, v_vTexcoord.y)) * 0.12;
   sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x - blurSize, v_vTexcoord.y)) * 0.15;
   sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y)) * 0.16;
   sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x + blurSize, v_vTexcoord.y)) * 0.15;
   sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x + 2.0*blurSize, v_vTexcoord.y)) * 0.12;
   sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x + 3.0*blurSize, v_vTexcoord.y)) * 0.09;
   sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x + 4.0*blurSize, v_vTexcoord.y)) * 0.05;

   // take nine samples, with the distance blurSize between them
   sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y - 4.0*blurSize)) * 0.05;
   sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y - 3.0*blurSize)) * 0.09;
   sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y - 2.0*blurSize)) * 0.12;
   sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y - blurSize)) * 0.15;
   sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y)) * 0.16;
   sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y + blurSize)) * 0.15;
   sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y + 2.0*blurSize)) * 0.12;
   sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y + 3.0*blurSize)) * 0.09;
   sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y + 4.0*blurSize)) * 0.05;

   //increase blur with intensity!
   gl_FragColor = sum * intensity + texture2D(gm_BaseTexture, v_vTexcoord);
}

