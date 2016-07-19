// piano roll
void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord.xy / iResolution.xy;
    
    float t = iGlobalTime + 10.0;
    vec3  c = vec3(1.0,1.0,1.0);
    float tw = 1.0/12.0;
    
    uv.x += t*0.1;
    
    if (uv.y > 0.88 && uv.y < 1.0)
        c = 1.0-c;

    // split keys at the bottom
    if (uv.y < 0.15)
        uv.x += sin(uv.x*t*0.01)*0.2;
    if (uv.y < 0.2)
        uv.x += cos(uv.x*t*0.01)*0.02;
    
    uv.y += 0.08;
    
    // white keys + separation
    if (uv.y > 0.2 && uv.y < 0.95)
    {
        c = vec3(1.0-uv.y*0.01,0.95,0.92);
        
        if (mod(uv.x, tw) < 0.002)
            c = vec3(0.0,0.0,0.0);
    }
    
    // white keys shading
    if (uv.y > 0.2 && uv.y < 0.95)
    {        
        if (mod(uv.x+0.08,tw) < 0.06)
            c = vec3(1.0,1.0,0.99);
    }

    float p = mod(uv.x-0.05, tw*7.0);
    
    // black keys
    if ( uv.y > 0.55 && uv.y < 0.95 )
    {
        if (
            (p > 0.02  && p < 0.05)  // c#
         || (p > 0.10  && p < 0.13)  // d#
         || (p > 0.27  && p < 0.30)  // f#           
         || (p > 0.35  && p < 0.38)  // g#           
         || (p > 0.435 && p < 0.465) // a#           
            )
            c = vec3(uv.y * 0.2, uv.y * 0.15, 0.0);
    }
    
    // black keys shading
    if ( uv.y > 0.55 && uv.y < 0.95 )
    {
        if (
            (p > 0.02  && p < 0.028)  // c#
         || (p > 0.10  && p < 0.108)  // d#
         || (p > 0.27  && p < 0.278)  // f#           
         || (p > 0.35  && p < 0.358)  // g#           
         || (p > 0.435 && p < 0.442)  // a#           
            )
            c = vec3(0.5,0.5,0.5);
    }
        
    fragColor = vec4(c, 1.0);
}