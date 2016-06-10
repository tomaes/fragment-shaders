float r(vec2 _uv, float _t)
{
    return mod((cos(_t+_uv.x*6./_uv.y*1.5))/length(_uv), mod(_t*_uv.y*.01+.4*(sin(_uv.x*8.))*(cos(_uv.y*8.)),.5)*abs(tan(_t+length(_uv))*_uv.y*6. ) );    
}

float rb(vec2 _uv, float _t)
{
    float v = .0;
    
    for(float f = 1.; f > .0; f -= .05)
        v += r(_uv*f,_t)*.05;
    
    return v;
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = (fragCoord.xy - iResolution.xy * .5) / iResolution.y;     
    float t = iGlobalTime;
    
    float c = r(uv,t) - r(uv*2.,t+5.);

    if (c > mod(-t*.1 + abs(sin(t*.1+uv.y*.5/uv.x*.2)),.2)*2. )
    	c -= .5*rb(uv,t);     
    
	fragColor = vec4(c+length(uv)*.35,c*.9,c+uv.y*.1, 1.);
}
