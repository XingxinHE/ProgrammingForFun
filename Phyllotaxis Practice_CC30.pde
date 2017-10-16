//theta = n * 137.5 degree , r = c √ n,
//the top expression is the core part of this code
//however, in processing, we use Cartesian coordinate system
// so we have to change the theta and radius(r) into x and y location
//x=cos(theta)*r, y=sin(theta)*r
// since we have to create a sequence of dots, so the 'n' is the imcrementing factors



float n =0;
float c = 8;

void setup(){
  size(600,600);
  background(255);

  
}

void draw(){
  float a =n *radians(137.3);
  float r = c*sqrt(n);
  float x =r * cos(a)+width/2;
  float y = r*sin(a)+height/2;
  fill(0,0,0,abs(r-width/2));
  noStroke();
  ellipse(x,y,abs(r-width/2)/25,abs(r-width/2)/25);
  n++;
  
  
}
