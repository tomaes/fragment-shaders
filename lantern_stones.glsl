// lantern stones
float r(vec2 _uv, float _t)
{
    return min(.30/length(_uv), mod(_t*length(_uv)*.001+.4*sin(_uv.x*8.)*cos(_uv.y*8.),.5)* abs(sin(_t-length(_uv))*5. ) );    
}

float rb(vec2 _uv, float _t)
{
    float v = .0;
    
    if (mod(_uv.y+_uv.x+_t*.1,.1) > abs(sin(_uv.x/_uv.y)*.05))
    for(float f = 1.; f > .0; f -= .05)
    {
        v += r(_uv*f,_t)*.05;
    }
    
    return v;
}


void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
	//vec2 uv = fragCoord.xy / iResolution.xy;
    vec2 uv = (fragCoord.xy - iResolution.xy * .5) / iResolution.y; 
    
    float c = 1.;
    float t = iGlobalTime + .64;
    
    c = r(uv,t);
   
    if (c > mod(-t*.1 + tan(t*.1+uv.y*.5/uv.x*.2),.2)*2. )
    	c -= .5*rb(uv,t);     
    
	fragColor = vec4(c,c*.9,c-uv.x,1.);
}