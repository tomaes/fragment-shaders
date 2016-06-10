// schmold
void mainImage( out vec4 fragColor, in vec2 fragCoord )
{

  vec3 col;
  float time = iGlobalTime*0.4;    
  vec2 pos = fragCoord.xy + vec2( sin(time)*2000.0,fragCoord.x);// + iMouse.xy*100.0;

  vec2 dim = fragCoord.xy / iResolution.xy * (6000.0 * (sin(time+pos.y*0.01)) + 1000.0);


  float g_size = dim.x / (30.0 + sin(time*0.01+pos.x*0.01)*1.0 + atan(time*0.01,pos.x+pos.y));
  float f_size = dim.x / (sin(time*3.0+pos.y*0.1+pos.x*0.1+atan(pos.y,pos.x*0.8)*100.0 +atan(dim.x-pos.x,dim.y-pos.y)*40.0  )*70.0);

  if (( mod(pos.x + time*10.0, g_size) < f_size) && ( mod(pos.y, g_size) < f_size)) 
    col = vec3(0.8, 0.4, mod(pos.x*0.02, 0.04));
  else
    col = vec3(pos.y*0.001, pos.x*0.0002, 0.1);

  fragColor = vec4( col, 1.0 );
}