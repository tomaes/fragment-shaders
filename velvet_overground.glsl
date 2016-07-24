void mainImage( out vec4 c, in vec2 fc )
{
    float t = iGlobalTime;
    vec2 uv = fc.xy / iResolution.y;

    uv *= 1.5 - sin(t + sqrt(uv.y+uv.x))*.15;
    uv.y -= .25;
    
    c = vec4(.3 + mod(tan(uv.x*5.+t)*.1 + cos(uv.y*5.+t)*.1,.1), .0, .2, 1. );
    c *= length(uv.y+.6);
    
    for(float f =.0; f < 3.; f +=.08)
    {
        float o = sin(t+f*8.)*.3;
        
        if (distance(vec2(f,.5+sin(t*2.5+uv.x*5.8)*.2 ),uv)  > .14+o && 
            distance(vec2(f,.5+sin(t*1.9+uv.x*6.0)*.2 ),uv)  < .17+o) 
            c *= .2*vec4(uv.x*uv.y, uv.x, .1-uv.x, 1.) - mod( sqrt(uv.x+uv.y),7.5)*.8;

        if (distance(vec2(f,.5+sin(t*2.5+uv.x*5.8)*.2 ),uv)  > .38-uv.x*.1 &&
            distance(vec2(f,.5+sin(t*2.5+uv.x*5.8)*.2 ),uv)  < .40-uv.x*.1)          
            c.g -= uv.y;
    }    
}