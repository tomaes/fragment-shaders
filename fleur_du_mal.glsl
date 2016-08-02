
// "red star"
void mainImage( out vec4 f, in vec2 fc )
{
    float t = iGlobalTime;
    vec2 uv = (fc.xy-iResolution.xy*.5) / iResolution.y+sin(t)*.4;

    uv.x += sin(t*.5)*.4;
    uv.y += cos(t*.5)*.4;
            
    f = vec4( mod(atan(uv.x,uv.y),fract(t-length(uv)))*length(uv-tan(t*2.+uv.x/uv.y))*4.,
             .1/sqrt(length(uv)),
             .0,
             1.);
}

----------------------------------------------------------------------------
// "neat and red"
void mainImage( out vec4 f, in vec2 fc )
{
    float t = iGlobalTime;
    vec2 uv = (fc.xy-iResolution.xy*.5) / iResolution.y+sin(t)*.4;

    uv.x += sin(t*2.5)*.2;
    uv.y += cos(t*2.5)*.2;
            
    f = vec4( mod(sin(t+(uv.x/uv.y)*length(uv))+atan(uv.x,uv.y),fract(t-length(uv)))*(10.+sin(t-length(uv))*17.)/length(uv-tan(t*2.+uv.x*10./uv.y))*4.,
             (abs(sin(t*.5)*.1)) /sqrt(length(uv)),
             sqrt(length(uv))*.75 - .05/fract(mod(uv.x,.16)*2. + mod(uv.y,.16)*2.),
             1.);
    
    f *= vec4(length(f)*.1-length(uv));
}
-----------------------------------------------------------------------------
// "ice cold"
vec4 r(vec2 _uv, float _t)
{
     
    vec4 f = vec4( mod(sin(_t+(_uv.x/_uv.y)*length(_uv))+atan(_uv.x,_uv.y),fract(_t-length(_uv)))*(10.+sin(_t-length(_uv))*17.)/length(_uv-tan(_t*2.+_uv.x*10./_uv.y))*4.,
                  (abs(sin(_t*.5)*.1)) /sqrt(length(_uv)),
                   sqrt(length(_uv))*.75 - .05/fract(mod(_uv.x,.16)*2. + mod(_uv.y,.16)*2.),
                   1.);
    
    f *= vec4(length(f)*.1-length(_uv));
    
    return f;
}


void mainImage( out vec4 ff, in vec2 fc )
{
    float t = iGlobalTime;
    vec2 uv = (fc.xy-iResolution.xy*.5) / iResolution.y+sin(t)*.4;

    uv.x += sin(t*2.5)*.2;
    uv.y += cos(t*2.5)*.2;
            
    ff = r(uv,t) / r(uv,t+.1);
}

------------------------------------------------------------------------------
// "windmill"
vec4 r(vec2 _uv, float _t)
{
     
    vec4 f = vec4( mod(sin(_t+(_uv.x/_uv.y)*length(_uv))+atan(_uv.x,_uv.y),fract(_t-length(_uv)))*(10.+sin(_t-length(_uv))*17.)/length(_uv-tan(_t*2.+_uv.x*10./_uv.y))*4.,
                  (abs(sin(_t*.5)*.1)) /sqrt(length(_uv)),
                   sqrt(length(_uv))*.75 - .05/fract(mod(_uv.x,.16)*2. + mod(_uv.y,.16)*2.),
                   1.);
    
    f *= vec4(length(f)*.1-length(_uv));
    
    return f;
}

void mainImage( out vec4 ff, in vec2 fc )
{
    float t = iGlobalTime; // + 11.44
    vec2 uv = (fc.xy-iResolution.xy*.5) / iResolution.y+sin(t)*.4;

    uv.x += sin(t*2.5)*.2;
    uv.y += cos(t*2.5)*.2;

    ff = vec4(.6, .2, .1, 1.);
    
    if (length(uv+sin(t*10.-length(uv*7.)) ) < 1.95)
        ff += vec4(.8) * min(mod(t+sin(atan(uv.x,uv.y)+2.),.5),.2);
    
    if (length(uv) < .9-sin(t+atan(uv.x,uv.y)*5. ) )    
        ff = r(uv,t) * r(uv,t+.01) + r(uv,t-.4)*.5;
    
    ff = ff-uv.y;
}
------------------------------------------------------------------------------
// final
vec4 r(vec2 _uv, float _t)
{
     
    vec4 f = vec4( mod(sin(_t+(_uv.x/_uv.y)*length(_uv))+atan(_uv.x,_uv.y),fract(_t-length(_uv)))*(10.+sin(_t-length(_uv))*17.)/length(_uv-tan(_t*2.+_uv.x*10./_uv.y))*4.,
                  (abs(sin(_t*.5)*.1)) /sqrt(length(_uv)),
                   sqrt(length(_uv))*.75,
                   1.);
    
    f *= vec4(length(f)*.1-length(_uv));
    
    return f;
}

void mainImage( out vec4 ff, in vec2 fc )
{
    float t = iGlobalTime; // + 11.44
    vec2 uv = (fc.xy-iResolution.xy*.5) / iResolution.y+sin(t)*.4;

    uv.x += sin(t*2.5)*.2;
    uv.y += cos(t*2.5)*.2;

    ff = vec4(.6, .2, .1, 1.);
    
    if (length(uv+sin(t*10.-length(uv*7.)) ) < 1.95)
        ff += vec4(1.5) * min(mod(t+sin(atan(uv.x,uv.y)+2.),.5),.4);
    
    if (length(uv) < .9-sin(t+atan(uv.x,uv.y)*200. ) )    
        ff *= r(uv,t) + r(uv,t+.01) + r(uv,t-.4)*.5;    
}