final int HELEN_COUNT = 2330;

JSONArray entries;
JSONObject constants;
HelenFace[] faces;

void setup() {
  faces = new HelenFace[HELEN_COUNT];
  
  entries = loadJSONArray("data.json");
  constants = loadJSONObject("constants.json");
  
  for (int i = 0; i < entries.size(); i++) {
    faces[i] = new HelenFace(entries.getJSONObject(i));
    println("Instantiated face "+i);
  }
}

void draw() {
  
}