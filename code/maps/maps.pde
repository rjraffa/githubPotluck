/*
 * Maps
 * Moving through space with Final Fantasy
 *
 * CC Fall 2012
 * by Ryan Raffa
 * 10/05/12
 */
 
PVector mapPos;
PVector characterPos;

PImage mainMap;
PImage walkRightA;
PImage walkRightB;
PImage walkLeftA;
PImage walkLeftB;
PImage walkUpA;
PImage walkUpB;
PImage walkDownA;
PImage walkDownB;
PImage standing;

void setup() {
 
  size(200,200);
  background(255);
  
  mainMap = loadImage("ff_map.jpg");
  walkRightA = loadImage("ff_character_walkRightA.png");
  walkRightB = loadImage("ff_character_walkRightB.png");
  walkLeftA = loadImage("ff_character_walkLeftA.png");
  walkLeftB = loadImage("ff_character_walkLeftB.png");
  walkUpA = loadImage("ff_character_walkUpA.png");
  walkUpB = loadImage("ff_character_walkUpB.png");
  walkDownA = loadImage("ff_character_walkDownA.png");
  walkDownB = loadImage("ff_character_walkDownB.png");
  standing = loadImage("ff_character_standing.png");

  mapPos = new PVector(mainMap.width/2, mainMap.height/2);
  characterPos = new PVector(width/2, height/2);
  
}

void draw() {

  imageMode(CENTER);
  image(mainMap, mapPos.x, mapPos.y);
  
  
  if (keyPressed == true) {
      if (key == CODED) {
        if (keyCode == UP) {
          if(millis()%500 <= 250) { image(walkUpA,characterPos.x, characterPos.y); }
          else { image(walkUpB,characterPos.x, characterPos.y); }
          
          if (mapPos.y < 223 && characterPos.y == 100) {
            mapPos.y++;
          } else if (characterPos.y > standing.height/2){
            characterPos.y--;
          }
          
          println("mapPos.y: " + mapPos.y);
          println("characterPos.y: " + characterPos.y);
          
        }
        if (keyCode == DOWN) {
          if(millis()%500 <= 250) { image(walkDownA,characterPos.x, characterPos.y); }
          else { image(walkDownB,characterPos.x, characterPos.y); }
          
          if (mapPos.y > -22 && characterPos.y == 100) {
            mapPos.y--;
          } else if (characterPos.y < height - standing.height/2){
            characterPos.y++;
          }

          println("mapPos.y: "+ mapPos.y);
          println("characterPos.y: "+ characterPos.y);
        } 

        if (keyCode == RIGHT) {
          if(millis()%500 <= 250) { image(walkRightA,characterPos.x, characterPos.y); }
          else { image(walkRightB,characterPos.x, characterPos.y); }
          
          if (mapPos.x > -108 && characterPos.x == 100) {
            mapPos.x--;
          } else if (characterPos.x < width-standing.width/2){
            characterPos.x++;
          }

          println("mapPos.x: "+ mapPos.x);
          println("characterPos.x: "+ characterPos.x);
        } 

        if (keyCode == LEFT) {
          if(millis()%500 <= 250) { image(walkLeftA,characterPos.x, characterPos.y); }
          else { image(walkLeftB,characterPos.x, characterPos.y); }

          if (mapPos.x < 312 && characterPos.x == 100) {
            mapPos.x++;
          } else if (characterPos.x > standing.width/2){
            characterPos.x--;
          }

          println("mapPos.x: "+ mapPos.x);
          println("characterPos.x: "+ characterPos.x);
        } 
      }
  }
  else {
    image(standing, characterPos.x, characterPos.y);
  }
  
}
