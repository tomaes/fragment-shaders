// bunt
float check( vec3 _pos)
{    
    return distance(_pos, vec3(1.5,.8,.5)) < 2. ? .1 : 2.;
}


void mainImage( out vec4 f, in vec2 fc )
{
    vec2 uv = (fc.xy-iResolution.xy*.5) / iResolution.y;
  
    float col = .1;
    float t = iGlobalTime * 2.5 + mod(length(uv),.45);
  
    uv -= sin(t*.5+uv.y)*mod(length(uv+sin(t*.5+atan(uv,vec2(.0,.0)))),.5);
    
    for(float r = -5.; r < 5.; r += .2)
    {
        col /= check( vec3(.6/cos(t*.5+.1/uv.x*5.),.0,r) / cos(t+25.*sin(sqrt(uv.x/uv.y))) );
        col *= check( vec3(.6/cos(t*.5+.1/uv.x*5.),.0,r) + cos(t+25.*sin(sqrt(uv.x/uv.y))) );
    }
    
    col /= mod(col+uv.x*uv.y,.5);
    
    f = vec4( col*1.5+length(uv)*.7,col*.1,col*.4 - uv.y*.2, 1.);
}
----------------------------------------------------------------------
// dunkel
float check( vec3 _pos)
{    
    return .5*distance(_pos, vec3(1.5,.8,.5));
}

float calc(float _t, vec2 _uv)
{
    float col = .1;
      
    for(float r = -5.; r < 5.; r += .7)
    {
        col /= .8*check( vec3(.06/cos(_t*.5+.1/_uv.x*5.),.0,r) * cos(_t+25.*sin(sqrt(_uv.x/_uv.y))) );
    }
    
    col /= mod(col+_uv.x+_uv.y,.7);   
    
    return col;
}

void mainImage( out vec4 f, in vec2 fc )
{
    vec2 uv = (fc.xy-iResolution.xy*.5) / iResolution.y;
    
    float t = (4.1+iGlobalTime) * 2.5 + mod(length(uv),.45);
    uv += 3.*sin(t*.5+uv.y)*mod(length(uv*sin(t*.5+atan(uv,vec2(.0)))),1.5);
  
    float c = .7 - length(uv)*.2;  
    
    for(float r = .2; r > -.1; r -= .02)
    {
        c += r*calc(t,uv) - .2*length(uv)*calc(t+.1+r,uv) + .15*calc(t+.1,uv);
    }
    
    f = vec4( c*.2*length(uv)*6.,c*.5-uv.y*.25, c*.4 - uv.y*.2, 1.);
}
------------------------------------------------------------------------

// "red eye syndrome"
float check( vec3 _pos)
{    
    return distance(_pos, vec3(.1,.1,.1)) < .7 ? .1 : 2.;
}

void mainImage( out vec4 f, in vec2 fc )
{
    vec2 uv = (fc.xy-iResolution.xy*.5) / iResolution.y;
  
    float t = iGlobalTime * 2.5 + mod(length(uv),.45);
    float col = mod(length(uv),.2+sin(t+uv.y*5.+uv.x*5.)*.1 )*3. - length(uv);
  
    uv -= sin(t*.5+uv.y)*mod(length(uv+sin(t*.5+atan(uv,vec2(.0,.0)))),.5);
    
    for(float r = -5.; r < 5.; r += .2)
    {
        col /= check( vec3(.6/cos(t*.5+.1/uv.x*5.),.0,r) / cos(t+25.*sin(sqrt(uv.x/uv.y))) );
        col *= check( vec3(.6/cos(t*.5+.1/uv.x*5.),.0,r) + cos(t+25.*sin(sqrt(uv.x/uv.y))) );
    }
    
    col /= mod(col+uv.x*uv.y,.5);
    
    f = vec4( col*.9+length(uv)*.7,col*.4,col*.4 - uv.y*.2, 1.);
}