


void setup() {
  size(800, 400);
  smooth();
  
  PFont tFont = createFont("Arial Black", 50);
  
  background(255);
  PGraphics result  = txtFxBackdropText("Backdrop Text", tFont, color(0, 255, 0), color(255, 255, 0), 7);
  image(result, width/2 -result.width/2, height/2 - result.height/2);
  save("examples/backdrop.png");
  
  background(255);
  result = txtFxShadow("Shadow Text", tFont, color(255,0,0), color(0,0,255));
  image(result, width/2 -result.width/2, height/2 - result.height/2);
  save("examples/shadow.png");
  
  background(255);
  result = txtFxShadow("Shadow Text", tFont, color(255,0,0), color(0,0,255));
  image(result, width/2 -result.width/2, height/2 - result.height/2);
  save("examples/shadow.png");
  
  background(0);
  result = txtFxBackdropText("Using fonts", tFont, color(0, 255, 0), color(255, 255, 255), 7);
  image(result, width/2 -result.width/2, height/2 - result.height/2);
  saveFrame("examples/tmp001.png");
  
  background(0);
  result = txtFxBackdropText("with FX", tFont, color(255, 255, 255),color(0,0,255),3, color(0, 255, 255), 12, color(0,255,0),5);
  image(result, width/2 -result.width/2, height/2 - result.height/2);
  saveFrame("examples/tmp002.png");
}