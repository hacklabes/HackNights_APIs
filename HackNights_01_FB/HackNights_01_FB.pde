String ACCESS_TOKEN = "CAACEdEose0cBAISZAymOk7W5Pnc0UNOTAMfgZADaZAhzz7ZCnJR9ib3KbZCNMGB7gsWMZB0834cvNkGEfUXEtrv1PBNZAIy8SYxxwpjZBh3ZASXyzGbZBLEq1IIsVOdd4Gf12PS3pkCKPVNV6sjieNzC2t5YxsTsjV3o8G7Byw9tmEbA3cw8X14mmDmCGNZBUJ8XpA7aLMPhPpWPQZDZD";
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