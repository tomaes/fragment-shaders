void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord.xy / iResolution.y;
    float t = mod(iGlobalTime+19.0, 1000.0);  
    
    float ox = sin(t*0.5)+0.5;
    float oy = cos(t*0.5)+0.5;
    float at = atan(uv.x-0.5,uv.y+0.5)*0.4; 
      
    float d1 = distance(uv, vec2(0.25+ox,0.25));
    float d2 = distance(uv, vec2(0.75,   0.75+oy));
    float c = mod(sin(d1+d2),0.1)*(d1/d2);
    c += 0.2*mod(sin(d1+d2+0.05),0.1)*(d1/d2);
    
    fragColor = vec4(c+at,c*0.7,c*0.6, 1.0);
}