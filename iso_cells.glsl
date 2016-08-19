// v1.2
float iso(float _x, float _y, float _z)
{
    return 1.3/(_x*_x + _y*_y + _z*_z) > 5. ? 1. : .0;
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = (fragCoord.xy-iResolution.xy*.5) / iResolution.y;
    float t = iGlobalTime;
    
    uv.y += sin(t*1.5+uv.x*.1+uv.y*3.);
    uv.x /= (sin(t*2.5-uv.y*uv.y*2.1))*.8;
    
    float col = sin( length(uv)*.01 /uv.x*(.2/cos(length(uv)*20.) * 10./cos(t+uv.x*4.+uv.y*4.)));
    
    for(float z = 1.5; z > -.1; z -= .06)
    {
        col += iso(uv.x, uv.y, z) * z;       
        col -= iso(.5-uv.x+sin(t)*.2, uv.y, z)*.1;
    }
    
    if (uv.x < -.75 || uv.x > .75)
        col = .85;
    
    vec4 colf = vec4(col*.9,col*.2,length(.12*uv/col),1.);

    fragColor = .4*length(uv)*vec4(length(colf)) + colf*.5;
}