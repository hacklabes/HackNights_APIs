String API_KEY = "SVYcV0UUSSgF5CsuYkiNc7KSfEaRqsYuwEgtr3GYG0Owqb5lsw";
String TAG = "selfie";

int PERIOD = 1000;

String url;

long lastRequest = 0;
PImage lastSelfie;
String lastDate;

void getLatestPhoto() {
  JSONArray response = loadJSONObject(url).getJSONArray("response");
  for (int i=0; i<response.size(); i++) {
    JSONObject post = response.getJSONObject(i);
    if (post.getString("type").equals("photo")) {
      JSONObject original_size = post.getJSONArray("photos").getJSONObject(0).getJSONObject("original_size");
      lastSelfie = loadImage(original_size.getString("url"));
      lastDate = post.getString("date");
      break;
    }
  }
}

void setup() {
  size(800, 600);
  background(255);

  url = "http://api.tumblr.com/v2/tagged?";
  url += "tag="+TAG;
  url += "&api_key="+API_KEY; 

  getLatestPhoto();
}

void draw() { 
  background(0);
  lastSelfie.resize(0, height);
  imageMode(CENTER);
  image(lastSelfie, width/2, height/2);
  fill(0);
  rect(0, height-24, width, 24);
  textSize(20);
  fill(255);
  text(lastDate, width/3, height-6);

  if (millis()-lastRequest > PERIOD) {
    lastRequest = millis();
    getLatestPhoto();
  }
}