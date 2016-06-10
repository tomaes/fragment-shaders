float render(vec2 _uv, float _t)
{
   _uv.y += cos(_t*.1)*.7;    
   return (sqrt( (sin(_uv.x*2.+_t)*cos(_uv.y*2.+_t))*(_uv.x+_uv.y) ));
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord.xy / iResolution.y;
    float t = 200.+iGlobalTime * 10.5;
       
    float c = .5*render(uv, t*t*sqrt(uv.x*.02+uv.y*.001)*.003) + 
              .5*render(uv, t*t*sqrt(uv.x*.01+uv.y*.01 )*.002);

    c = (c < .55) ? .5-c : c;
    
    fragColor = vec4(c*1.25,c*1.25,c,1.0);
}