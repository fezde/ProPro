/************************************************************************************************************************************
 * Draws a text with a simple, blurred shadow
 ************************************************************************************************************************************/
PGraphics txtFxShadow(String text, PFont textFont, color colorText, color colorShadow){
  PGraphics result;
  
  PVector textPosition = new PVector(40, 200);
  float rad = 0; 
  
  float textSize = textFont.getSize();

  result = createGraphics(10, 10);
  result.beginDraw();
  result.textFont(textFont);
  result.textAlign(CENTER);
  result.textSize(textSize);

  int resultWidth = round(result.textWidth(text))+20;
  int resultHeight = round((result.textAscent() + result.textDescent()) ) +1;
  textPosition = new PVector((float)resultWidth/2,  result.textAscent()-5 );
  
  result =createGraphics(resultWidth, resultHeight);
  result.beginDraw();
  //result.background(125);
  result.textFont(textFont);
  result.textAlign(CENTER);
  result.textSize(textSize);
  
  result.fill(colorShadow);
  result.text(text, textPosition.x + 5, textPosition.y + 5);
  result.filter(BLUR,3);
  
  result.fill(colorText);
  result.text(text, textPosition.x , textPosition.y );
  
  result.endDraw();

  return result;
}
  

/************************************************************************************************************************************
 * Draws a text with a backdrop and black outlines around the text and the backdrop
 ************************************************************************************************************************************/
PGraphics txtFxBackdropText(String text, PFont textFont, 
  color textColor, 
  color backdropColor, float backdropDistance) {

  return txtFxBackdropText(text, textFont, textColor, color(0, 0, 0), 2, backdropColor, backdropDistance, color(0, 0, 0), 2);
}

/************************************************************************************************************************************
 * Draws a text with a backdrop and outlines around the text and the backdrop
************************************************************************************************************************************/
PGraphics txtFxBackdropText(String text, PFont textFont, 
  color textFill, 
  color textOutlineFill, float textOutlineWidth, 
  color backdropFill, float backdropDistance, 
  color backdropOutlineFill, float backDropOutlineWidth) {

  PGraphics result;
  PVector textPosition = new PVector(40, 200);
  float rad = 0; 
  float stepsForOutlineCreation = 50;
  float textSize = textFont.getSize();

  result = createGraphics(10, 10);
  result.beginDraw();
  result.textFont(textFont);
  result.textAlign(CENTER);
  result.textSize(textSize);

  int resultWidth = round(result.textWidth(text) + 2*backdropDistance + 2*backDropOutlineWidth + 2)+1;
  int resultHeight = round((result.textAscent() + result.textDescent()) + backdropDistance + backDropOutlineWidth ) +1;
  textPosition = new PVector((float)resultWidth/2, resultHeight - (2* backdropDistance + 2*backDropOutlineWidth  -5));

  result =createGraphics(resultWidth, resultHeight);
  result.beginDraw();
  //result.background(125);
  result.textFont(textFont);
  result.textAlign(CENTER);
  result.textSize(textSize);

  // Backdrop Outline
  result.fill(backdropOutlineFill);
  rad = backdropDistance + backDropOutlineWidth;
  for (float i=0; i<stepsForOutlineCreation; i++) {
    float winkel = (i/stepsForOutlineCreation) * TWO_PI;
    result.text(text, textPosition.x + sin(winkel)*rad, textPosition.y + cos(winkel)*rad);
  }

  // Backdrop
  result.fill(backdropFill);
  rad = backdropDistance;
  for (float i=0; i<stepsForOutlineCreation; i++) {
    float winkel = (i/stepsForOutlineCreation) * TWO_PI;
    result.text(text, textPosition.x + sin(winkel)*rad, textPosition.y + cos(winkel)*rad);
  }

  // Text Outline
  result.fill(textOutlineFill);
  rad = textOutlineWidth;
  for (float i=0; i<stepsForOutlineCreation; i++) {
    float winkel = (i/stepsForOutlineCreation) * TWO_PI;
    result.text(text, textPosition.x + sin(winkel)*rad, textPosition.y + cos(winkel)*rad);
  }
  result.filter(BLUR, 0.7);

  // Text
  result.fill(textFill);
  result.text(text, textPosition.x, textPosition.y);

  result.endDraw();

  return result;
}