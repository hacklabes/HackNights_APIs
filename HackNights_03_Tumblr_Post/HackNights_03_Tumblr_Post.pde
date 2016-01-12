import com.tumblr.jumblr.JumblrClient;
import com.tumblr.jumblr.types.*;
import processing.video.*;

String BLOG_NAME = "hacknights.tumblr.com";

String CONSUMER_KEY = "HfOsHk4cVf4erHSRyP2OJvNJQkq9oqqOSVV4fCnXSYxsrupr81";
String CONSUMER_SECRET = "TcRolbWNwklL8JLmP1xQcoDysU7wb6rUB2aaBn27LhNFG1EdP8";
String OAUTH_TOKEN = "yPPP06TdYeOXfXg5G43tpiVttE0iG8vPRDQdV0LCrS7YVVHpDt";
String OAUTH_TOKEN_SECRET = "JN6AiB5Tpe4x8qgLfoyqIM9vRx0zqo18pmdMX2YrbdilTwgPTk";

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