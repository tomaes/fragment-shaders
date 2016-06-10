// Close Encounters Shader / tomaes.32x.de
// v20160429

float r(vec2 _p, float _t, float _s)
{
    float rs  = sin(_t+_p.y*(10.+_s))+sin(_t+_p.y*(20.+_s))+sqrt(sin(_t+_p.x*(20.+_s))+tan(_p.y*20.));
          rs /= sin(_t+_p.y*(12.+_s))+sin(_t+_p.y*(30.+_s))+sqrt(sin(_t+_p.x*(30.+_s))+tan(_p.y*20.));

    return rs;
}

vec4 rr(vec2 _p, float _t, float _s)
{
    _p = _p*acos( tan(_p.y+_p.x+_t*.5)/_p+_p*.5);
    
    vec4 f = vec4(.0,.0,.0,1.);
    
    f  = vec4(r(_p.xy+mod(_p.x,.01),_t,-20.+mod(_t*5.,50.) ),.1,.0, 1.);
    f *= vec4(r(_p.yx+mod(_p.y,.01),_t,-20.+mod(_t*5.,50.) ),.1,.0, 1.);

    f += .1*vec4(r(_p.xy+mod(_p.x,.05),_t,-20.+mod(_t*5.,50.)*_s ),.1,.0, 1.).xxyx;
    f += .1*vec4(r(_p.yx+mod(_p.y,.05),_t,-20.+mod(_t*5.,50.)*_s ),.1,.0, 1.).xxyx;

    if (mod(_t,.5)<.25)
        f += ((mod(_p.x,.2) < 0.01+sin(_t*.5+_p.x*5.+_p.y*5.)*.005) ? .8 : .0);    	

    return f;    
}

void mainImage( out vec4 c, vec2 p )
{    
    p = p / iResolution.y;
    float t = iGlobalTime + 5.58; // + 3.5

    c = vec4(0.,0.,0.,1.);
    float b = mod(.5 * sin(t + p.y/mod(p.y,.1) *5.),min(p.y*p.x,.03)  );
    
    c  = rr( p, t, 1. );

    // blue swipes
    c += abs(b * sin(p.x + t*5.)) * 10.;    
    
    // bright "scan" lines
    if (mod(t+p.y,.5) < 0.03)
        c = vec4( length(c) );
    
    //if (p.x < .1 || p.x > 1.7) c = vec4(1.);
}
