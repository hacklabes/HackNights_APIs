String ACCESS_TOKEN = "CAACEdEose0cBAGcbZAgSeDnYdYWsvtwKJryoadFoy3tbId36ZCWxNPjMGqWb0sZCSbZAcXGZCqobVBzi6EZA4rUZBjODwfZBzFQiwzmD4X46JwSllkhw01ZAcsC2BvblAr2qdUcbMDmvx7BS0Nc2OGzpB6bSfvcuGzVZANEIgjg1OgW6jaqwcDrBvPCDbEVTceMoD2HTZB4bxjw2wZDZD";
String USER_ID = "680143124";

JSONArray responseData;

void setup() {
  size(500, 500);

  String request = "https://graph.facebook.com/v2.0/";
  request += USER_ID;
  request += "/friends?fields=name&limit=5000&offset=0";
  request += "&access_token="+ACCESS_TOKEN;

  responseData = loadJSONObject(request).getJSONArray("data");
}


void draw() {
  background(200);
  textSize(24);
  fill(0);

  for (int i=0; i<responseData.size()&&i<(frameCount/60); i++) {
    String name = responseData.getJSONObject(i).getString("name"); 
    println(name);
    text(name, 10, 24*(i+1));
  }
}