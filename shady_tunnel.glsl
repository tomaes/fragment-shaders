// shady tunnel
void mainImage( out vec4 f, vec2 p )
{
    float t = iGlobalTime + atan( p.x, p.y );
    p  = p / iResolution.xy + vec2( .2,.2);
    f  = .3/vec4( (fract(p.x*.5)/sin(p.y*1.)*.3)/length(p*mod(t+tan( sin(p.x*.8/p.y) *.6+sin(p.y*2.)),1.))-.5*p.y);
    f -= .3/vec4( (fract(p.x*.2)/sin(p.y*8.)*.3)/length(p*mod(t+tan( sin(p.x*.75/p.y)*.6+sin(p.y*2.)),1.))-.1*p.y);
}

