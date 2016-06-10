float r( vec2 _uv, float _t)
{
    return 1./length(_uv- (sin(_t+_uv.x)*.5+cos(_t+_uv.y)*.5)   )*.2;
}


void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = (fragCoord.xy-iResolution.xy*.5) / iResolution.y;
    
    float t = iGlobalTime;
    
    fragColor = vec4(0);
    
    for(float f = .0; f < 10.; f += .7)
        fragColor += (uv.x*uv.y)*vec4( r(uv,t+f) );
}
------------------------------------------------------------------------------
float r( vec2 _uv, float _t)
{
    return 1./length(_uv- (sin(_t+_uv.x)*.5+cos(_t+_uv.y)*.5)   )*.2;
}


void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = (fragCoord.xy-iResolution.xy*.5) / iResolution.y;
    
    float t = iGlobalTime;
    
    float c = .0;
    
    for(float f = .0; f < 10.; f += .5)
        c += sin(f*f+length(uv)) * .55 * ( r(uv,t+f) );
    
    fragColor = vec4(c,c*.7,c*.4, 1.);
}
------------------------------------------------------------------------------
float r( vec2 _uv, float _t)
{
    float v = 1./length(_uv-(sin(_t+_uv.x)*.15/cos(_t+_uv.y)*.5)   )*.2;
    
    // "flicker" + bg
    v = v - .4*min(v,fract(_t*5.));
    v = fract(v*_uv.x*2./_uv.y*2.) + v;
    
    return v;
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
    vec2 uv = (fragCoord.xy-iResolution.xy*.5) / iResolution.y;
    
    float t = iGlobalTime + 3.35;   
    float c = .0;
    
    for(float f = .0; f < 10.; f += .5)
        c += sin(f*f+length(uv)) * cos( (.5+uv.x*uv.y) * rb(uv,(t+f)*.5 ) );
    
    fragColor = vec4(c-length(uv)*.6,c*.7,c*.4+uv.x*.1, 1.);
}