// chokoscape

#define OFF 260.0

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord.xy / iResolution.y;
    //float t = OFF + iGlobalTime/(uv.y*sin(iGlobalTime+uv.x*uv.x));
    float t = OFF+1.5*iGlobalTime;
    float c = 1.0;
 
    float x = uv.x*0.15+(uv.y+uv.x*0.17)*0.15;
    float y = uv.y*0.15+sin(uv.x*uv.y+t*0.14)-uv.y;
    
    x += t*0.5 + t*0.1*sin(uv.x*uv.y*0.1+1.0/t*uv.x);
    y *= t*0.1 + t*0.1*cos(uv.x*uv.y+1.0/t*uv.x);
        
    c = (sin(x*40.0)*cos(y*15.0)) - cos(x*0.5);
    c += 0.5 * 1.0/y;
    c += (sin(x*200.0)*cos(y*5.0)) * cos(y*t*0.05);
    
    c = 0.5-c;

    if (uv.y > 0.95 || uv.y < 0.05)
        c = 0.1;
    
    fragColor = vec4( c*2.0,c*1.5,c*1.5 ,1.0);
}