import processing.pdf.*;

final int HELEN_COUNT = 2330;
final int VERTICAL_MARGIN = 50;
final int HORIZONTAL_MARGIN = 50;
final int PRINT_WIDTH = 2550;
final int PRINT_HEIGHT = 3300;

JSONArray entries;
//JSONObject constants;
ArrayList<HelenFace> faces;
//PGraphicsPDF pg;

//boolean recording = false;

void setup() {
  size(800, 900);
  //pg = (PGraphicsPDF) createGraphics(PRINT_WIDTH, PRINT_HEIGHT, PDF, "helen.pdf");
  //recording = false;
  noLoop();

  background(255);
    
  entries = loadJSONArray("data.json");
  //constants = loadJSONObject("constants.json");
  
  faces = new ArrayList<HelenFace>();
  JSONObject entry;
  HelenFace face;
  
  for (int i = 0; i < entries.size(); i++) {
    entry = entries.getJSONObject(i);
    face = new HelenFace(entry);
    faces.add(face);
    println("Instantiated face "+i);
  }
}

void draw() {
  
  //if(recording) {
  //  beginRecord(pg);
  //}
  
  drawFaces();
  
  //if(recording) {
  //  endRecord();
  //  recording = false;
  //  noLoop();
  //}
}

void drawFaces() {
   noFill();

  HelenFace face;
  int w = width - HORIZONTAL_MARGIN*2;
  int h = height - VERTICAL_MARGIN*2;

  pushMatrix();
    translate(HORIZONTAL_MARGIN, VERTICAL_MARGIN);
   
    stroke(0, 0, 0, 10);
    //drawLines(w, h);
    stroke(0, 0, 0, 50);
    //drawPoints(w, h);
    noStroke();
    fill(0, 0, 0, 1);
    drawEllipses(w, h, 5);
  popMatrix();

}

void drawLines(int w, int h) {
  for(int i = 0; i < faces.size(); i++) {
    faces.get(i).drawLines(w, h);
  }  
}

void drawPoints(int w, int h) {
  for(int i = 0; i < faces.size(); i++) {
    faces.get(i).drawPoints(w, h);
  }  
}

void drawEllipses(int w, int h, float r) {
  for(int i = 0; i < faces.size(); i++) {
    faces.get(i).drawEllipses(w, h, r);
  }    
}

void keyPressed() {
 if(key == 's') {
  String fn = "saved/helen-"+year()+month()+day()+hour()+minute()+second()+".png";
  save(fn);
  println("saved "+fn);
 } else if (key == 'p') {
   //recording = true;
   //loop();
 }
}