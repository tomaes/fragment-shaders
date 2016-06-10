// chocolate factory
float render(vec2 _uv, float _t)
{
   return (sqrt( (sin(_uv.x*2.0+_t)  *
                  cos(_uv.y*1.0+_t)) * 
                 (_uv.x+_uv.y) ));
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
	vec2 uv = fragCoord.xy / iResolution.y;
    float t = 200.0+iGlobalTime * 10.5;  

    t += 1.94 / sqrt(sin(uv.x*20.0)+cos(uv.y*20.0));  
    t -= sin(t*0.0001*uv.x*50.0)*39.0 / sqrt(sin(uv.x*20.0)+cos(uv.y*20.0));
    
    float c = 0.5*render(uv, t*t*sqrt(uv.x*0.02+uv.y*0.001)*0.003) + 
        	  0.5*render(uv, t*t*sqrt(uv.x*0.01+uv.y*0.010)*0.002);
        
    if (c < 0.55)
        c -= abs(0.5-c);
        
	fragColor = vec4(c*1.25+uv.y*0.2,c*1.25,c,1.0);
}