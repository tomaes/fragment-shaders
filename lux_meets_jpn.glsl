// LUX meets JPN

// flag of Japan
vec3 jpn(vec2 _uv)
{   
    float off = atan(_uv.x,_uv.y)*0.1 > 0.1 ? 1.0: 2.0-_uv.y;
    vec3 col = vec3(2.2-off,1.1-off,0.8-off);
	
    if ( distance( vec2(_uv.x,0.15+_uv.y*0.7),vec2(0.5,0.5)) < 0.15 )
    	col = vec3(1.0,0.2,0.2+_uv.x*0.4 );
    
    return col;
}

// flag of Luxembourg
vec3 lux(vec2 _uv)
{
    if (mod(_uv.y, 1.0) < 0.3333)
    {
        return vec3(0.0,0.6,1.0); //blue
    } 
    else
	if (mod(_uv.y, 1.0) < 0.6666)
    {
        return vec3(1.0,1.0-_uv.x*0.1,1.0); //white
    }
    else
    {
        return vec3(1.0,0.0,_uv.x*0.3); //red
    }
}


void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord.xy / iResolution.xy;
    float t = 3000.0+iGlobalTime;
    
    uv.y += sin(t+uv.x*sin(uv.x*6.0+t)*uv.y*sin(t)*10.0)*0.5;   
    uv.y += sin(t*0.1+uv.x*5.0)*0.2;
    
    if ( ((uv.y/uv.x)*0.3+(uv.y+uv.x)*0.7) > (sin(t)) ) 
    {    
    	fragColor = vec4(jpn(uv),1.0) - vec4(lux(uv),1.0)*mod(t+uv.y,1.0)*0.8; 
    }
    else
    	fragColor = vec4(lux(uv),1.0) - vec4(jpn(uv),1.0)*0.15;
    
    // band
    if ( (uv.y*uv.x+0.05) > (sin(t)) && (uv.y*uv.x) < (sin(t)) 
       && (mod(uv.x+t*0.4,0.1) < 0.08)
       ) 
    	fragColor =  vec4(1.0,1.0,1.0,1.0);//vec4(0.5,0.9,uv.x*0.5,1.0);    
}