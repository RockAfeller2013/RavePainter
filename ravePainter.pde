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
