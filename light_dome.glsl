void mainImage( out vec4 f, vec2 p )
{
  float t = iGlobalTime;
  float c = .1;

  vec2 uv = ( (p.xy - (iResolution.xy*.5)) / iResolution.y );

  if ( length(uv*.8) < .5+mod( t*.1+t*.02/atan(uv.x,uv.y)*.1,.2)*5. )
  
  for(float f = -.5; f < .5; f += .08)
    c += min( (.015 + sin((t+f*5.)*3.)*.005 ) / distance( vec2(uv.x+mod(uv.y*uv.x,.005),sin(uv.y+t)*.5) ,vec2( sin( uv.x*5.+f*5.+t )*.1,f) ), .4 );

  f = vec4( c*.85-uv.x*.1,c*.75,c*.75+uv.y*.15, 1. );    
}

-------------------------------------------------------------------
void mainImage( out vec4 f, vec2 p )
{
  vec2 uv = ( (p.xy - (iResolution.xy*.5)) / iResolution.y );

  float t = iGlobalTime;
  float c = sin(uv.y*1.5)*.5;

  for(float f = -.5; f < .5; f += .08)
    c += min( (.015 + sin((t+f*5.)*3.)*.005 ) / distance( vec2(uv.x+mod(uv.y*uv.x,.001),sin(uv.x*3.+uv.y*5.+t)*.5) ,vec2( sin( uv.x*5.+f*5.+t )*.1,f) ), .4 );

  c -= .05*mod(t+10./length(uv),1.25);    
  c += .02*(mod(t*.1+t*.005-atan(uv.x,uv.y)*.2,.4)*5.);

  f = vec4( c*.85-uv.x*.1,c*.75,c*.75+uv.y*.15, 1. );    
}
-----------------------------------------------------------------
void mainImage( out vec4 f, vec2 p )
{
  vec2 uv = ( (p.xy - (iResolution.xy*.5)) / iResolution.y );

  float t = iGlobalTime;
  float c = sin(uv.y*1.5)*.5;

  for(float f = -.5; f < .5; f += .08)
    c += min( (.015 + sin((t+f*5.)*3.)*.005 ) / distance( vec2(uv.x+mod(uv.y*uv.x,.001),sin(uv.x*3.+uv.y*5.+t)*.5) ,vec2( sin( uv.x*5.+f*5.+t )*.1,f) ), .4 );

  c -= .05*mod(t+10./length(uv),1.25);    
  //c += .02*(mod(t*.1+t*.005-atan(uv.x,uv.y)*.2,.4)*5.);
 
  if (uv.x < -.5 || uv.x > .5)
    c = mod(uv.x-uv.y,.5)*.5; //.4-c;
    
  f = vec4( c*.85-uv.x*.1,c*.75,c*.75+uv.y*.15, 1. );    
}
-----------------------------------------------------------------
// v2
void mainImage( out vec4 f, vec2 p )
{
  vec2 uv = ( (p.xy - (iResolution.xy*.5)) / iResolution.y );

  float t = iGlobalTime + 12.17;
  float c = sin(uv.y*1.5)*.5;

  for(float f = -.5; f < .5; f += .08)
  {
    c += min( (.015 + sin((t+f*2.)*3.)*.005 ) / distance( vec2(uv.x+mod(uv.y*uv.x,.001),sin(uv.x*2.+uv.y*5.+t)*.5) ,vec2( sin( uv.x*5.+f*5.+t )*.1,f) ), .4 );
    float tmp = (.015 + sin((t+f*2.)*3.)*.005 ) / (fract( distance( vec2(uv.x+mod(uv.y*uv.x,.001),sin(uv.x*2.+uv.y*5.+t)*.5) ,vec2( sin( uv.x*5.+f*5.+t )*.1,f) )) );

    if (tmp < .2+uv.y*.3)
      c += tmp;
}

    c -= .05*mod(t+10./length(uv),1.25);    
    //c += .02*(mod(t*.1+t*.005-atan(uv.x,uv.y)*.2,.4)*5.);
 
    /*
    if (uv.x < -.5 || uv.x > .5)
        c = mod(uv.x-uv.y,.25)*.5; //.4-c;
    */
    f = vec4( c*.85-uv.x*.1,c*.75,c*.75+uv.y*.15, 1. );    
}
-------------------------------------------------------------------------
// v2.5
void mainImage( out vec4 f, in vec2 p )
{
  vec2 uv = ( (p.xy - (iResolution.xy*.5)) / iResolution.y );

  float t = iGlobalTime+4.77; // + 6.77;
  float c = sin(uv.x*10.+t)*.3;

  for(float f = -.5; f < .5; f += .08)
  {
    c +=   min( (.015 + sin((t+f*2.)*3.)*.005 ) /             distance( vec2(uv.x+mod(uv.y*uv.x,.001),sin(uv.x*2.+uv.y*5.+t)*.5) ,vec2( sin( uv.x*5.+f*5.+t )*.1,f) ), .25 );
    float tmp = (.015 + sin((t+f*2.)*3.)*.005 ) / (fract( 20.*distance( vec2(uv.x+mod(uv.y*uv.x,.001),sin(uv.x*2.+uv.y*5.+t)*.5) ,vec2( sin( uv.x*5.+f*5.+t )*.1,f) )) );

    c += tmp * uv.y*.5;
  }

  c += .04*mod(t+10./length(uv-sin(t+uv.x+uv.y)*.1 ),1.25);    

  // if (uv.x < -.6 || uv.x > .6)
  //     c = .1-c;
    
  f = vec4( c*.83-uv.x*.1,c*.8,c*.75+uv.y*.15, 1. );    
}