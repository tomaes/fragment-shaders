float hoop(vec2 _uv)
{
    return ( (   mod(5./sqrt(_uv.x*10./_uv.y*20.),.1) < .05) && (length(_uv) > .08 && length(_uv) < .1) ) ? 
            1.-mod(length(_uv),.005)*120. : .0;
}

float rb(vec2 _uv, float _t)
{
    float c = -.5 + sin(_t*10.)*.1;
    
    for(float f = 2.6; f > .0; f -= .04)
    {
        _uv.x += sin(f*4.+_t) * .03 + sin(_t*2.+f*300.)*.001;
        _uv.y += cos(f*4.+_t) * .03 + cos(_t*5.+f*300.)*.001;
        
        c += hoop(_uv * f) * .3;
        c += length(_uv) * .02;
    }
    
    return c+.09/length(_uv) + mod(length(_uv),.03)*4.;
}


void mainImage( out vec4 col, in vec2 fc )
{
    vec2 uv = (fc.xy-iResolution.xy*.5) / iResolution.y;

    float t = iGlobalTime + 4.7;
    
    col = vec4( rb(uv,t), rb(uv,t+.03), rb(uv,t+.06), 1. );
}