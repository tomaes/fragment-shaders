// mario in wonderland (v1.1) by tomaes 20160818+19
bool brect(vec2 _uv, float _x,  float _y, 
                     float _bw, float _bh,
                     float _lstart, float _lend,
                     float _line)
{
    return ((_uv.x                > _x+_bw*_lstart && _uv.x           < _x+_bw*_lend) &&
            (_uv.y+_bh*(_line+1.) > _y             && _uv.y+_bh*_line < _y));
}        


vec4 mario(vec2 _uv, float _x, float _y, float _w, float _h)
{
    float bw = _w / 12.;
    float bh = _h / 16.;
    
    vec4 col    = vec4(.0);
    vec4 pal_r  = vec4( 1.,  .1,  .1,  1.);
    vec4 pal_g  = vec4(  .5, .5,  .1,  1.);
    vec4 pal_br = vec4( 1.,  .75, .2,  1.);
    
    // line 1,2 (hat)
    if (brect(_uv,_x,_y, bw, bh, 3., 8.,1.)) col = vec4(pal_r);
    if (brect(_uv,_x,_y, bw, bh, 2.,11.,2.)) col = vec4(pal_r);

    // line 3.. (face)
    if (brect(_uv,_x,_y, bw, bh, 2., 5.,3.)) col = vec4(pal_g);
    if (brect(_uv,_x,_y, bw, bh, 5., 7.,3.)) col = vec4(pal_br);
    if (brect(_uv,_x,_y, bw, bh, 7., 8.,3.)) col = vec4(pal_g);
    if (brect(_uv,_x,_y, bw, bh, 8., 9.,3.)) col = vec4(pal_br);
    
    // line 4.. (face)
    if (brect(_uv,_x,_y, bw, bh, 1., 2.,4.)) col = vec4(pal_g);
    if (brect(_uv,_x,_y, bw, bh, 2., 3.,4.)) col = vec4(pal_br);
    if (brect(_uv,_x,_y, bw, bh, 3., 4.,4.)) col = vec4(pal_g);
    if (brect(_uv,_x,_y, bw, bh, 4., 7.,4.)) col = vec4(pal_br);
    if (brect(_uv,_x,_y, bw, bh, 7., 8.,4.)) col = vec4(pal_g);
    if (brect(_uv,_x,_y, bw, bh, 8.,11.,4.)) col = vec4(pal_br);

    // line 5.. (face)
    if (brect(_uv,_x,_y, bw, bh, 1., 2.,5.)) col = vec4(pal_g);
    if (brect(_uv,_x,_y, bw, bh, 2., 3.,5.)) col = vec4(pal_br);
    if (brect(_uv,_x,_y, bw, bh, 3., 5.,5.)) col = vec4(pal_g);
    if (brect(_uv,_x,_y, bw, bh, 5., 8.,5.)) col = vec4(pal_br);
    if (brect(_uv,_x,_y, bw, bh, 8., 9.,5.)) col = vec4(pal_g);
    if (brect(_uv,_x,_y, bw, bh, 9.,12.,5.)) col = vec4(pal_br);

    // line 6.. (face)
    if (brect(_uv,_x,_y, bw, bh, 1., 3.,6.)) col = vec4(pal_g);
    if (brect(_uv,_x,_y, bw, bh, 3., 7.,6.)) col = vec4(pal_br);
    if (brect(_uv,_x,_y, bw, bh, 7.,11.,6.)) col = vec4(pal_g);
    
    // line 7.. (face)
    if (brect(_uv,_x,_y, bw, bh, 3.,10.,7.)) col = vec4(pal_br);
    
    // line 8.. (body)
    if (brect(_uv,_x,_y, bw, bh, 2.,4.,8.)) col = vec4(pal_g);
    if (brect(_uv,_x,_y, bw, bh, 4.,5.,8.)) col = vec4(pal_r);
    if (brect(_uv,_x,_y, bw, bh, 5.,8.,8.)) col = vec4(pal_g);
    
    // line 9.. (body)
    if (brect(_uv,_x,_y, bw, bh, 1., 4.,9.)) col = vec4(pal_g);
    if (brect(_uv,_x,_y, bw, bh, 4., 5.,9.)) col = vec4(pal_r);
    if (brect(_uv,_x,_y, bw, bh, 5., 7.,9.)) col = vec4(pal_g);
    if (brect(_uv,_x,_y, bw, bh, 7., 8.,9.)) col = vec4(pal_r);
    if (brect(_uv,_x,_y, bw, bh, 8.,11.,9.)) col = vec4(pal_g);

    // line 10.. (body)
    if (brect(_uv,_x,_y, bw, bh, 0., 4.,10.)) col = vec4(pal_g);
    if (brect(_uv,_x,_y, bw, bh, 4., 8.,10.)) col = vec4(pal_r);
    if (brect(_uv,_x,_y, bw, bh, 8.,12.,10.)) col = vec4(pal_g);
    
    // line 11.. (body)
    if (brect(_uv,_x,_y, bw, bh, 0., 2.,11.)) col = vec4(pal_br);
    if (brect(_uv,_x,_y, bw, bh, 2., 3.,11.)) col = vec4(pal_g);
    if (brect(_uv,_x,_y, bw, bh, 3., 4.,11.)) col = vec4(pal_r);
    if (brect(_uv,_x,_y, bw, bh, 4., 5.,11.)) col = vec4(pal_br);
    if (brect(_uv,_x,_y, bw, bh, 5., 7.,11.)) col = vec4(pal_r);
    if (brect(_uv,_x,_y, bw, bh, 7., 8.,11.)) col = vec4(pal_br);
    if (brect(_uv,_x,_y, bw, bh, 8., 9.,11.)) col = vec4(pal_r);
    if (brect(_uv,_x,_y, bw, bh, 9.,10.,11.)) col = vec4(pal_g);
    if (brect(_uv,_x,_y, bw, bh,10.,12.,11.)) col = vec4(pal_br);
    
    // line 12.. (body)
    if (brect(_uv,_x,_y, bw, bh, 0., 3.,12.)) col = vec4(pal_br);
    if (brect(_uv,_x,_y, bw, bh, 3., 9.,12.)) col = vec4(pal_r);
    if (brect(_uv,_x,_y, bw, bh, 9.,12.,12.)) col = vec4(pal_br);

    // line 13.. (body)
    if (brect(_uv,_x,_y, bw, bh, 0., 2.,13.)) col = vec4(pal_br);
    if (brect(_uv,_x,_y, bw, bh, 2.,10.,13.)) col = vec4(pal_r);
    if (brect(_uv,_x,_y, bw, bh,10.,12.,13.)) col = vec4(pal_br);
    
    // line 14.. (legs)
    if (brect(_uv,_x,_y, bw, bh, 2., 5.,14.)) col = vec4(pal_r);
    if (brect(_uv,_x,_y, bw, bh, 7.,10.,14.)) col = vec4(pal_r);

    // line 15.. (feet)
    if (brect(_uv,_x,_y, bw, bh, 1., 4.,15.)) col = vec4(pal_g);
    if (brect(_uv,_x,_y, bw, bh, 8.,11.,15.)) col = vec4(pal_g);

    // line 16.. (feet)
    if (brect(_uv,_x,_y, bw, bh, 0., 4.,16.)) col = vec4(pal_g);
    if (brect(_uv,_x,_y, bw, bh, 8.,12.,16.)) col = vec4(pal_g);

    return col+_uv.y*.01;
}

float yoff(float _x, float _t)
{
    return sin( 3.14159 * _x + _t*2.) + sin(_x*15. + _t*2.)*.06;
}


void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord.xy / iResolution.xy;

    float t = mod(iGlobalTime+1.5, 100.);
    
    float j = 1.6-.8+sin(t)*.25;
    
    vec4 c = vec4(.0);
    
    // background
    vec4 b = vec4(.4-uv.y*.1,
                  .2+ sin(.5+uv.x*20.+t)/sqrt( sin(t*2.+uv.x*100.)+cos(uv.y*100.)), 
                  .89-uv.y*.22 - mod(uv.x-uv.y,.05)*2., 
                  1.);
    
    // render main mario
    vec4 m  = mario(uv,.392 ,j,      .15, abs(.45+sin(t*5.+uv.x*5.)*.1 )) * .2;
         m += mario(uv,.400 ,j+.008, .15, abs(.45+sin(t*5.+uv.x*5.)*.1 ));
    
    // mini marios on hill
    for(float fx = .0; fx < 1.1; fx += .1)
    {
       m += (mario( uv, fx, .2+yoff(uv.x,t)+abs(sin(t+fx*10.)*.1), .04,.15)) * .6;
    }

    // mario cut-out/dissolve
    if (length(m) > .2) // 1.5+sin(t*5.+uv.x*5.)
        c = m;
    else
        c = b;
    
    // calc jump for board
    j = j - .54 - abs(.65+sin(t*5.+(uv.x)*5.)*.2 );
    
    // board
    if (uv.x  > .35 && uv.x < .58 && 
        uv.y  > .57+j && uv.y < .65+j)
        c = vec4(1.,.8,.7, 1.)- mod(uv.x,.1)*2.;

    // hill platforms
    if (uv.y > (yoff(uv.x,t)+.01) && uv.y < (yoff(uv.x,t)+.05) && mod(uv.x,.1) < .05 )
    {
        c = vec4(.9,.6,.2, 1.);
    }
    
    // hill
    if (uv.y < yoff(uv.x,t) && 
        mod(uv.x*.01+uv.y+yoff(uv.x,t),.1) < .09)
    {
        c = vec4(.7, .3+uv.y, .1, 1.);
    }
        
    // columns: left
    if (uv.x < .07)
        c *= (.1-uv.x)*10.;

    // columns: right
    if (uv.x > .93)
        c *= 1.-(1.-uv.x)*10.;
        
    fragColor = vec4(c);
}