// underwater tennis court
vec3 lookUp( vec2 _uv, float _t )
{
    _uv += _uv * (sin(_t*0.4)*0.3);
    
    // "melt" effect
    _uv += (sin((_uv.x*10.05/_uv.y)*(0.15+sin(_t)*0.04) + _t * 0.8)*0.15);
    
    float o1 = 0.01;
    float dist = distance(_uv,vec2(0.5,0.5));
    
    vec3 black = vec3(0.0,0.0,0.0);
    vec3 white = vec3(1.0,1.0,1.0);
    vec3 green = vec3(0.2,1.0,0.4);
    vec3 blue  = vec3(0.2,0.6,1.0);
    vec3 c = green;
    
    if (_uv.x > 0.1 && _uv.x < 0.9)
        c = blue;

    if (_uv.x > (0.1+o1) && _uv.x < (0.9-o1))
        c = white;

    // surface
    if (_uv.x > (0.1+o1*2.0) && _uv.x < (0.9-o1*2.0))
        c = blue;
    
    // side lines
    if ((_uv.x > 0.2 && _uv.x < 0.2+o1) ||
        (_uv.x > 0.8 && _uv.x < 0.8+o1)) 
        c = white;
 
    // t-line: vertical
    if ((_uv.x > 0.5  && _uv.x < 0.5+o1) &&
        (_uv.y > 0.05 && _uv.y < 0.95))
        c = white;
        
    // net cord
    if ((_uv.y > 0.49 && _uv.y < 0.51) &&
        (_uv.x > 0.12 && _uv.x < 0.88))
        c = black;
    
    // t-lines: down
    if ((_uv.y > 0.05 && _uv.y < 0.06) &&
        (_uv.x > 0.2 && _uv.x < 0.8))
        c = white;

    // t-lines: up
    if ((_uv.y > 0.95 && _uv.y < 0.96) &&
        (_uv.x > 0.2 && _uv.x < 0.8))
        c = white;
    
    return vec3( c.r-dist, c.g-dist*0.3, c.b); 
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = (fragCoord.xy / iResolution.xy);

    vec3 col = vec3(0.0,0.0,0.0);
    
    float t = iGlobalTime + 900.0 + abs(sin(iGlobalTime*0.5+(uv.y*uv.x)*0.5))*(0.2*uv.x/uv.y);

    
    if (uv.y > 0.1 && uv.y < 0.9) 
    for(float f = 0.1; f < 100.0; f += 10.0)
    {    
        // ball transition
        if ( distance(vec2(uv.x,uv.y*0.7+0.15), vec2(0.5,0.5)) < cos(t+f*0.01) )
            col += 0.13 * lookUp( uv, t - (1.0/f)*2.0 );
        else
        {
            col += 0.03 * lookUp( uv, t - (1.0/f)*1.0 );
            
            if (((col.r + col.g + col.b)/3.0) > 0.05)
                col = 1.3-col;//vec3(0.0,0.0,0.0);
            else
                col = vec3(1.0,1.0,1.0-min(f*0.04, 0.69));

        }
    }
    
   
    fragColor = vec4( col, 1.0 );          
}