String responseText = "";

void setup() {
  size(1000, 700);
  String[] response = loadStrings("https://processing.org");
  for(int i=0; i<response.length; i++){
    responseText += response[i]+"\n";
  }
}

void draw() {
  background(0);
  fill(255);
  textSize(14);
  text(responseText, 0, 0);
}