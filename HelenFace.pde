class HelenFace {

 //final int[] LEFT_EYEBROW_RANGE = { 174,194 };
 //final int[] RIGHT_EYEBROW_RANGE = { 154, 174 };
 //final int[] NOSE_RANGE = { 41, 58 };
 //final int[] CHIN_RANGE = { 0, 41 };
 //final int[] RIGHT_EYE_RANGE = { 114, 134 };
 //final int[] LEFT_EYE_RANGE = { 134, 154 };
 //final int[] MOUTH_OUTLINE_RANGE = { 58, 86 };
 //final int[] MOUTH_LIPLINE_RANGE = { 86, 114 };  
  
  float rect_width;
  float rect_height;
  float aspect;
  ArrayList<PVector> annotations;
  ArrayList<PVector> normalized;

  HelenFace(JSONObject data) {
    JSONArray json_annotations = data.getJSONArray("annotations");
    JSONArray json_rect_dimensions = data.getJSONArray("rect_dimensions");
    
    // get dimensions
    rect_width = json_rect_dimensions.getInt(0);
    aspect = json_rect_dimensions.getInt(1);
    
    float[] xvals = new float[json_annotations.size()];
    float[] yvals = new float[json_annotations.size()];
    
    // get annotations
    annotations = new ArrayList<PVector>();
    for(int i = 0; i < json_annotations.size(); i++) {
      JSONArray json_point = json_annotations.getJSONArray(i);
      xvals[i] = json_point.getFloat(0);
      yvals[i] = json_point.getFloat(1);
      annotations.add(new PVector(xvals[i], yvals[i]));
    }
    
    // calc source face dimensions
    aspect = rect_width / rect_height;
    
    //normalized = normalizeAnnotations(annotations);
  }
  
  public void drawPoints(int w, int h) {
    PVector p;
    for(int i = 0; i < annotations.size(); i++) {
      p = annotations.get(i);
      point(p.x*w, p.y*h);
    }
  }
  
  public void drawLines(int w, int h) {
    PVector p;
    beginShape();
    for(int i = 0; i < annotations.size(); i++) {
      p = annotations.get(i);
      vertex(p.x*w, p.y*h);
    }
    endShape();
  }
  
  public void drawEllipses(int w, int h, float r) {
    PVector p;
    for(int i = 0; i < annotations.size(); i++) {
      p = annotations.get(i);
      ellipse(p.x*w, p.y*h, r, r);
    }    
  }
  
  //private ArrayList<PVector> normalizeAnnotations(ArrayList<PVector> annotations) {
  //  ArrayList<PVector> norm = new ArrayList<PVector>();
      
  //  // use the approach outlined here http://www.fundza.com/vectors/normalize/index.html
  //  // but use the total size of the image for magnitude vector

  //  for(int i = 0; i < annotations.size(); i++) {
  //    int x = map(float(annotations.get(i)).x, 0.0, float(this.img_width), 0.1, 1.0);
  //  }

  //  return norm;
  //}
}