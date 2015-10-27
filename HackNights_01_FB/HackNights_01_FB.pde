String ACCESS_TOKEN = "CAACEdEose0cBACGP6BtSKfdA7KQPDTztGQqFkiHX5yZCf6kcKdwQUf201LTGIvGx0dtEzeV8yqr5QMZBqUadQhDKC79DQe3IcOPe5r3L9BZB43AZAH62ie4ARcthLZBAU28AIQslYM8sGv5BZAI4lK8WXFkTItnEZCZCFybbd2kEyaA3LHAQ8WANcjajCYNSOCf4v9HjazWmXwZDZD";
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