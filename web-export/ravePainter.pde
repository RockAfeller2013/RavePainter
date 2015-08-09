Maxim maxim;
AudioPlayer player1;
AudioPlayer player2;
AudioPlayer player3;
AudioPlayer player4;

void setup()
{
  size(600, 600);
  maxim = new Maxim(this);
  player1 = maxim.loadFile("loop1.aif");
  player1.setLooping(true);
  player2 = maxim.loadFile("loop2.aif");
  player2.setLooping(true);
  player3 = maxim.loadFile("loop3.aif");
  player3.setLooping(true);
  player4 = maxim.loadFile("loop4.aif");
  player4.setLooping(true);
  background(0);
  rectMode(CENTER);
}

void mouseDragged()
{
  // start drum sounds
  player1.play();
  player2.play();
  player3.play();
  player4.play();
   


  // compute paint parameters
  float speed = dist(pmouseX, pmouseY, mouseX, mouseY);
  float alpha = map(speed, 0, 20, 0, 5);
  float lineWidth = map(speed, 0, 10, 8, 0.1);
  lineWidth = constrain(lineWidth, 0, 10);

  // fade out previous paints
  noStroke();
  fill(0, alpha);
  rect(width/2, height/2, width, height);

  // paint
  stroke(0,255,0);
  strokeWeight(lineWidth);
  brush5(pmouseX, pmouseY, mouseX, mouseY, lineWidth);

  // distance of current point from corners
  float dTopLeft = dist(mouseX,mouseY,0,0);
  float dTopRight = dist(mouseX,mouseY,width,0);
  float dBottomLeft = dist(mouseX,mouseY,0,height);
  float dBottomRight = dist(mouseX,mouseY,width,height);
  
  float vLoop1 = map(constrain(dTopLeft,0,width),0,width,0,1);
  float vLoop2 = map(constrain(dTopRight,0,width),0,width,0,1);
  float vLoop3 = map(constrain(dBottomLeft,0,width),0,width,0,1);
  float vLoop4 = map(constrain(dBottomRight,0,width),0,width,0,1);
  
  // compute drum cutoff
  reso = map(speed,0,20,5,11);
  player1.setFilter(map(1-vLoop1,0,1,0,20000), reso);
  player2.setFilter(map(1-vLoop2,0,1,0,20000), reso);
  player3.setFilter(map(1-vLoop3,0,1,0,20000), reso);
  player4.setFilter(map(1-vLoop4,0,1,0,20000), reso);
}

void mouseReleased()
{

}
//The MIT License (MIT) - See Licence.txt for details

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies


void brush1(int x,int y, int px, int py, int lineWidth) {
  strokeWeight(lineWidth);
  ellipse(x,y,px,py); 
  
  return;
}


void brush2(int x,int y, int px, int py, int lineWidth) {
  strokeWeight(lineWidth);
  pushMatrix();
  translate(x,y);
  rotate(random(px));
  rect(0+random(50),0+random(50),10,10); 
  popMatrix();
  return;
}

void brush3(int x,int y, int px, int py, int lineWidth) {
  strokeWeight(lineWidth);
  pushMatrix();
  translate(x,y);
  rotate(random(px));
  line(0+random(50),0+random(50),0,0);
  rotate(random(px));
  line(0+random(50),0+random(50),0,0);
  rotate(random(px));
  line(0+random(50),0+random(50),0,0);
  popMatrix();

  return;
}

void brush4(int x,int y, int px, int py, int lineWidth) {
  strokeWeight(lineWidth);
  line(px,py,x,y);
  line(px,py,x,y);
  line(width/2+((width/2)-px),py,width/2+((width/2)-x),y);
  line(px,height/2+((height/2)-py),x,height/2+((height/2)-y));
  line(width/2+((width/2)-px),height/2+((height/2)-py),width/2+((width/2)-x),height/2+((height/2)-y));
  return;
}

void brush5(int x,int y, int px, int py, int lineWidth) {
  strokeWeight(lineWidth);
  line(px,py,x,y);
  line(width/2+((width/2)-px),py,width/2+((width/2)-x),y);
  line(px,height/2+((height/2)-py),x,height/2+((height/2)-y));
  line(width/2+((width/2)-px),height/2+((height/2)-py),width/2+((width/2)-x),height/2+((height/2)-y));
  line(width/2+((width/2)-py),width/2-((width/2)-px),width/2+((width/2)-y),width/2-((width/2)-x));
  line(height/2-((height/2)-py),width/2-((width/2)-px),height/2-((height/2)-y),width/2-((width/2)-x));
  line(width/2+((width/2)-py),height/2+((height/2)-px),width/2+((width/2)-y),height/2+((height/2)-x));
  line(width/2-((width/2)-py),height/2+((height/2)-px),width/2-((width/2)-y),height/2+((height/2)-x));
  return;
}

void brush9(int x,int y, int px, int py, int lineWidth) {
  strokeWeight(lineWidth);
  line(px,py,x,y);
  line(width/2+((width/2)-px),py,width/2+((width/2)-x),y);
  line(px,height/2+((height/2)-py),x,height/2+((height/2)-y));
  line(width/2+((width/2)-px),height/2+((height/2)-py),width/2+((width/2)-x),height/2+((height/2)-y));
  line(width/2+((width/2)-py),width/2-((width/2)-px),width/2+((width/2)-y),width/2-((width/2)-x));
  line(height/2-((height/2)-py),width/2-((width/2)-px),height/2-((height/2)-y),width/2-((width/2)-x));
  line(width/2+((width/2)-py),height/2+((height/2)-px),width/2+((width/2)-y),height/2+((height/2)-x));
  line(width/2-((width/2)-py),height/2+((height/2)-px),width/2-((width/2)-y),height/2+((height/2)-x));
  return;
}

void brush6(int x,int y, int px, int py, int lineWidth) {
  strokeWeight(lineWidth);
  px=px+random(50);
  py=py+random(50);
  ellipse(x,y,px,py);
  ellipse(width/2+((width/2)-x),y,px,py);
  ellipse(x,height/2+((height/2)-y),px,py);
  ellipse(width/2+((width/2)-x),height/2+((height/2)-y),px,py);
  ellipse(width/2+((width/2)-y),width/2-((width/2)-x),px,py);
  ellipse(height/2-((height/2)-y),width/2-((width/2)-x),px,py);
  ellipse(width/2+((width/2)-y),height/2+((height/2)-x),px,py);
  ellipse(width/2-((width/2)-y),height/2+((height/2)-x),px,py);  
  return;
}

void brush7(int x,int y, int px, int py, int lineWidth) {
  strokeWeight(lineWidth);
  line(px,py,x,y);
  line(width/2+((width/2)-px),py,width/2+((width/2)-x),y);
  return;
}

