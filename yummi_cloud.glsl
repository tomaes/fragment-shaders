// yummi cloud
float render(vec2 _uv, float _t)
{
   return (sin( (sin(_uv.x*10.+_t)  *
                 cos(_uv.y*50.+_t)) * 
                 (_uv.x*_uv.y) ));
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
	vec2 uv = fragCoord.xy / iResolution.y * 1.25;
    float t = (iGlobalTime+1.8) * 10.5;  

    float b = .5+sin( sqrt(uv.x*5.+uv.x*5.)+t*.1)*.005;
        
    float c = b*render(vec2(uv.x+sin((t*.2*b)*.5),uv.y*b), 30.*sin(1./uv.y)*0.03) 
        	+ b*render(vec2(uv.y+sin((t*.2*b)*.5),uv.y*b), 10.*sin(1./uv.y)*0.02);

    if (c < sin(uv.x*5.+t*.1)) c *= (1.-c);
    
	fragColor  = vec4(c*1.25+uv.y*0.2,c*1.25,c,1.0);
    fragColor += vec4(vec3(length(uv.y*.22-c)),1.0) / .5*tan(5.*sin(1.4*sin(uv.x*5.+t*.05)*.04*sin(uv.y+mod(uv.y+t*.02,.1)*10.5 ))*3.5   );
}