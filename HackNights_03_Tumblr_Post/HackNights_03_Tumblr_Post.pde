import com.tumblr.jumblr.JumblrClient;
import com.tumblr.jumblr.types.*;
import processing.video.*;

String BLOG_NAME = "hacknights.tumblr.com";

String CONSUMER_KEY = "9teag9CWnFjG0BqcAE6m9emlMUpXWeR5shfClEfeLCRMtgOEie";
String CONSUMER_SECRET = "78GcqfS77o4nZvbiFlR48AhtUIYsNZIM6RUWJHWFQFRSCp6hyq";
String OAUTH_TOKEN = "N8JTTpDztIkD7hiOZKH5N4izoUVZVhfKokNaSiXHUedw9sA5QR";
String OAUTH_TOKEN_SECRET = "4xdYmvYgSwqwRVL9z2XX1fageojhUeOGEAVJh68F1Xp0xv4bus";

int PERIOD = 5000;

Capture myCamera;
JumblrClient myClient;

long lastPost = PERIOD;

void postPhoto() {
  final File file = new File(dataPath(""), "out.jpg");
  myCamera.save(file.toString());
  try {
    PhotoPost mPP = myClient.newPost(BLOG_NAME, PhotoPost.class);
    mPP.setData(file);
    mPP.save();
  }
  catch(Exception e) {
    println(e);
  }
}

void setup() {
  size(800, 600);

  myClient = new JumblrClient(CONSUMER_KEY, CONSUMER_SECRET, OAUTH_TOKEN, OAUTH_TOKEN_SECRET);

  myCamera = new Capture(this, 640, 480);
  myCamera.start();
}

void draw() { 
  if (myCamera.available() == true) {
    myCamera.read();
  }
  background(0);
  pushMatrix();
  scale(max((float)width/myCamera.width, (float)height/myCamera.height));
  image(myCamera, 0, 0);
  popMatrix();

  if (millis()-lastPost > PERIOD) {
    postPhoto();
    lastPost = millis();
  }
}