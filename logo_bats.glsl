#define COORDS 39
#define OFFX .2

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord.xy / iResolution.y;
    
    float t = iGlobalTime;
    
    float c[COORDS];
    // "l"
    c[0] = .5; c[1] = .6; c[2] = .045;
    c[3] = .5; c[4] = .5; c[5] = .045;
    c[6] = .5; c[7] = .4; c[8] = .045;
    c[9] = .6; c[10]= .4; c[11]= .045;
    // "o"
    c[12] = .825; c[13] = .6+sin(t)*.1; c[14]=.15 + sin(t*5.)*.1;
    // "g"
    c[15] = 1.2; c[16] = .65;c[17] = .045;
    c[18] = 1.1; c[19] = .6; c[20] = .045;
    c[21] = 1.1; c[22] = .5; c[23] = .045;
    c[24] = 1.1; c[25] = .4; c[26] = .045;
    c[27] = 1.2; c[28] = .4; c[29] = .045;
    c[30] = 1.3; c[31] = .4; c[32] = .045;
    c[33] = 1.3; c[34] = .5; c[35] = .045;    
    // "o" (2)
    c[36] = 1.55; c[37] = .6-sin(t)*.1; c[38]=.15 + cos(t*5.)*.1;
    
    float col = .5;

    for( int p = 0; p < COORDS; p += 3)
    {        
        if (distance( vec2(c[p]-OFFX,c[p+1]), uv ) < c[p+2])
            col = .5 + sin( t + float(p) ) * .5;
        
        if ((distance( vec2(c[p]-OFFX+.02,c[p+1]), uv ) < c[p+2]) &&
            (distance( vec2(c[p]-OFFX+.01,c[p+1]), uv)  > c[p+2]*.2))
            col += .3 + sin( t + float(p) ) * .5;
                
        // "bats"
        if (  ((abs(uv.x-c[p]+OFFX-.01)) < sin(uv.y*15.+t*5.)*.05) &&
              ((abs(uv.x-c[p]+OFFX-.01)) > sin(uv.y*14.+t*5.)*.05)  )
            col *= .5/col;     
    }
    
    // 3d background
    if (uv.x > .1 && uv.x < 1.67)
        col *= mod(col+.0001/sin(uv.x-uv.y),mod(t*.1+cos(uv.x*.5+uv.y*.5),.35))*10.;
    
    fragColor = vec4(col*uv.x*.4, col*.5, col*.4, 1.);
}