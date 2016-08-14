// v1.1
float iso(float _x, float _y, float _z)
{
    return 1.3/(_x*_x + _y*_y + _z*_z) > 5. ? 1. : .0;
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = (fragCoord.xy-iResolution.xy*.5) / iResolution.y;
    float t = iGlobalTime + .62;
    
    uv.y += sin(t*1.5+uv.x*.1+uv.y*3.);
    uv.x /= (sin(t*2.5-uv.y*uv.y*2.1))*.8;
    
    float col = sin( length(uv)*.02 /uv.x*(.2/cos(length(uv)*20.) * 10./cos(t+uv.x*4.+uv.y*4.)));
    
    for(float z = 1.; z > .1; z -= .04)
    {
        col += iso(uv.x, uv.y, z) * z;       
        col -= iso(.5-uv.x+sin(t)*.2, uv.y, z)*.1;
    }
    
    if (uv.x < -.95 || uv.x > .95)
        col = .65;

    fragColor = vec4(col*.9,col*.35,length(uv*col),1.);
}