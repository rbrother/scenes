/* Ballsky Generator */

#include <stdio.h>
#include <stdlib.h>
#include "math.h"

float t,x,y,z,radius,size;

void main()
{
  randomize();
  printf("#declare Flower = blob {\n");
  printf("  threshold 1.0\n");
  for(t=0;t<M_PI;t+=0.02)
  {
    radius = exp((M_PI-t) * 1.5 + 0.4) + 10.0;
    x = sin(t*8) * radius;
    y = sin(t*8 + 0.5*M_PI) * radius;
    z = -t*40.0;
    size = (M_PI-t)/M_PI*3.0 + 1.0;
    printf("  component FStr*%lf, FRad*%lf, <%lf,%lf,%lf>\n",size,size,x,y,z);
  }
  printf("}\n");
}
