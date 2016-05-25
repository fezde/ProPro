/************************************************************************************************************************************
 * Draws a text with a simple, blurred shadow
 ************************************************************************************************************************************/
PGraphics txtFxShadow(String text, PFont textFont, color colorText, color colorShadow) {
  PGraphics result;

  PVector textPosition = new PVector(40, 200);
  float rad = 3; 
  float distance = 5;

  float textSize = textFont.getSize();

  result = createGraphics(10, 10);
  result.beginDraw();
  result.textFont(textFont);
  result.textAlign(LEFT);
  result.textSize(textSize);
  result.endDraw();

  int resultWidth = round(result.textWidth(text) + 2*rad + 2*distance);
  int resultHeight = round((result.textAscent() + result.textDescent()) + 2*rad + distance );
  textPosition = new PVector(2, resultHeight - (textDescent() + 3*rad + 3*distance));

  result =createGraphics(resultWidth, resultHeight);
  result.beginDraw();
  //result.background(125);
  result.textFont(textFont);
  result.textAlign(LEFT);
  result.textSize(textSize);

  result.fill(colorShadow);
  result.text(text, textPosition.x + distance, textPosition.y + distance);
  result.filter(BLUR, rad);

  result.fill(colorText);
  result.text(text, textPosition.x, textPosition.y );

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

  int resultWidth = round(result.textWidth(text) + 2*backdropDistance + 2*backDropOutlineWidth + 2);
  int resultHeight = round((result.textAscent() + result.textDescent()) + 2*backdropDistance + 2*backDropOutlineWidth +2);

  textPosition = new PVector((float)resultWidth/2, resultHeight - (backdropDistance + backDropOutlineWidth +1 ) - result.textDescent());

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

/************************************************************************************************************************************
 * Draws a text with a simple 2px outline
 ************************************************************************************************************************************/
PGraphics txtFxOutlineText(String text, PFont textFont, 
  color textColor,
  color outline) {

  PGraphics result;
  PVector textPosition = new PVector(40, 200);
  float rad = 2; 
  float stepsForOutlineCreation = 50;
  float textSize = textFont.getSize();

  result = createGraphics(10, 10);
  result.beginDraw();
  result.textFont(textFont);
  result.textAlign(CENTER);
  result.textSize(textSize);

  int resultWidth = round(result.textWidth(text) + 2*rad + 2);
  int resultHeight = round((result.textAscent() + result.textDescent()) + 2*rad +2);

  textPosition = new PVector((float)resultWidth/2, resultHeight - (rad +1 ) - result.textDescent());

  result =createGraphics(resultWidth, resultHeight);
  result.beginDraw();
  result.background(125);
  result.textFont(textFont);
  result.textAlign(CENTER);
  result.textSize(textSize);



  // Text Outline
  result.fill(outline);
  
  for (float i=0; i<stepsForOutlineCreation; i++) {
    float winkel = (i/stepsForOutlineCreation) * TWO_PI;
    result.text(text, textPosition.x + sin(winkel)*rad, textPosition.y + cos(winkel)*rad);
  }
  result.filter(BLUR, 0.7);

  // Text
  result.fill(textColor);
  result.text(text, textPosition.x, textPosition.y);

  result.endDraw();

  return result;
}