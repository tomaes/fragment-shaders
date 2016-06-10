// LSD Sierpinsky carpets, flying
void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
  	float _t = 10000.0 + mod(iGlobalTime*10.0, 1000.0);

    vec2 position = ( fragCoord.xy / iResolution.xy ) * (sin(_t*0.1 + fragCoord.x*0.005) * 50.0 + 200.0);

	float x = position.x + position.x * sin(_t*0.05)*0.15;
	float y = position.y - position.x * cos(_t*0.05)*0.15;
	
    float ax = x + _t + iMouse.x; 
    float ay = y + _t + iMouse.y;
	
	float col = sin(_t*0.1 + ay*0.06 );
    
      if (  (  int(mod(x,        3.0)) == 0)  && ( int(mod(ay,     3.0)) == 2) || // 0 2
            (  int(mod(x /  3.0, 3.0)) == 1)  && ( int(mod(ay/3.0, 3.0)) == 1) || // 1 1
            (  int(mod(ax/  9.0, 3.0)) == 0)  && ( int(mod(y/ 9.0, 3.0)) == 2) || // 0 2
            (  int(mod(ax/ 27.0, 3.0)) == 0)  && ( int(mod(y/27.0, 3.0)) == 2) || // 0 2
            (  int(mod(ax/ 81.0, 3.0)) == 0)  && ( int(mod(y/81.0 ,3.0)) == 2) || // 0 2
            (  int(mod(ax/243.0, 3.0)) == 1)  && ( int(mod(y/243.0,3.0)) == 1) )  // 1 1
      {
   		col =  abs(sin(ax*ay+x*y)) * y * x * 0.004;
   		col += sin(ax*ay*0.0001+_t*0.1);
      }
  
	fragColor = vec4( vec3(col*0.5, col*0.2, (x*col)*0.01 ), 1.0 );
}