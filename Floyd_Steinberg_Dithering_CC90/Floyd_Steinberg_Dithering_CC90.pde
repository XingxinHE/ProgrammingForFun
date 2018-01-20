PImage morris;

void setup() {
  size(1320, 998);
  morris = loadImage("001.png");
  image(morris, 0, 0);
  morris.filter(GRAY);
  
}

int index(int x, int y) {
  return x + y * morris.width;
}

void draw() {
  morris.loadPixels();
  for (int y = 0; y < morris.height-1; y++) {
    for (int x = 1; x < morris.width-1; x++) {
      color pix = morris.pixels[index(x, y)];
      float oldR = red(pix);
      float oldG = green(pix);
      float oldB = blue(pix);
      int factor = 1;
      int newR = round(factor * oldR / 255) * (255/factor);
      int newG = round(factor * oldG / 255) * (255/factor);
      int newB = round(factor * oldB / 255) * (255/factor);
      morris.pixels[index(x, y)] = color(newR, newG, newB);

      float errR = oldR - newR;
      float errG = oldG - newG;
      float errB = oldB - newB;


      int index = index(x+1, y  );
      color c = morris.pixels[index];
      float r = red(c);
      float g = green(c);
      float b = blue(c);
      r = r + errR * 7/16.0;
      g = g + errG * 7/16.0;
      b = b + errB * 7/16.0;
      morris.pixels[index] = color(r, g, b);

      index = index(x-1, y+1  );
      c = morris.pixels[index];
      r = red(c);
      g = green(c);
      b = blue(c);
      r = r + errR * 3/16.0;
      g = g + errG * 3/16.0;
      b = b + errB * 3/16.0;
      morris.pixels[index] = color(r, g, b);

      index = index(x, y+1);
      c = morris.pixels[index];
      r = red(c);
      g = green(c);
      b = blue(c);
      r = r + errR * 5/16.0;
      g = g + errG * 5/16.0;
      b = b + errB * 5/16.0;
      morris.pixels[index] = color(r, g, b);


      index = index(x+1, y+1);
      c = morris.pixels[index];
      r = red(c);
      g = green(c);
      b = blue(c);
      r = r + errR * 1/16.0;
      g = g + errG * 1/16.0;
      b = b + errB * 1/16.0;
      morris.pixels[index] = color(r, g, b);
    }
  }
  morris.updatePixels();
  image(morris, 660, 0);
}
