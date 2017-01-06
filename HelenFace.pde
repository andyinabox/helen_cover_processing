class HelenFace {

 final int[] LEFT_EYEBROW_RANGE = { 174,194 };
 final int[] RIGHT_EYEBROW_RANGE = { 154, 174 };
 final int[] NOSE_RANGE = { 41, 58 };
 final int[] CHIN_RANGE = { 0, 41 };
 final int[] RIGHT_EYE_RANGE = { 114, 134 };
 final int[] LEFT_EYE_RANGE = { 134, 154 };
 final int[] MOUTH_OUTLINE_RANGE = { 58, 86 };
 final int[] MOUTH_LIPLINE_RANGE = { 86, 114 };  
  
  int[] dims;
  ArrayList<PVector> annotations;
  ArrayList<PVector> normalized;

  HelenFace(JSONObject data) {
    JSONArray json_annotations = data.getJSONArray("annotations");
    JSONArray json_helen_img_size = data.getJSONArray("helen_img_size");
    
    // get dimensions
    dims = new int[2];
    dims[0] = json_helen_img_size.getInt(0);
    dims[1] = json_helen_img_size.getInt(1);
    
    // get annotations
    annotations = new ArrayList<PVector>(json_annotations.size());
    for(int i = 0; i < json_annotations.size(); i++) {
      JSONArray json_point = json_annotations.getJSONArray(i);
      append(annotations, new PVector(json_point.getFloat(0), json_point.getFloat(1)));
    }
    
    normalized = normalizeAnnotations(annotations);
  }
  
  
  private ArrayList<PVector> normalizeAnnotations(ArrayList<PVector> annotations) {
    ArrayList<PVector> norm = new ArrayList<PVector>(annotations.size());
      
    // use the approach outlined here http://www.fundza.com/vectors/normalize/index.html
    // but use the total size of the image for magnitude vector

    return norm;
  }
}