// fields o' doom
void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord.xy / iResolution.xy;
    float t = iGlobalTime+201.0;
    float c = mod(t+(uv.x*uv.y+t*0.005)*1337.0, 15.5-sin(t*0.2/uv.y*(0.01+t*0.00001)));
    c *= 0.1*sin(uv.y)*mod(t+(uv.x*uv.y+t*0.005)*137.0, 5.5-sin(t*0.2/uv.y*(0.01+t*0.00001)));
    c *= 0.4*sin(uv.y)*mod(t+(uv.x/uv.y+t*0.005)*137.0, 5.5-sin(t*0.2/uv.y*(0.01+t*0.00001)));
    
    float o = sin(uv.x*3.14159)*0.06 + mod(uv.x,0.02) - 0.005; // border bending + saw pattern

    if (uv.y+o > 0.07 && uv.y-o < 0.93)
        fragColor = vec4( 1.0-sin(uv.y+t)-c, c+uv.x, 0.1 ,1.0);
    else
        fragColor = vec4(0.0,0.0,0.0,1.0);
}