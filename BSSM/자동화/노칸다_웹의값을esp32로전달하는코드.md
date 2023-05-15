#include <WiFi.h>
#include <WebServer.h>

const char* ssid = "bssm_free";
const char* password = "bssm_free";
WebServer server(80);

void setup() {
  Serial.begin(115200);
  pinMode(16,OUTPUT);
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(1000);
    Serial.println("Connecting to WiFi...");
  }
  Serial.println("WiFi connected");
  
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP());
  server.on("/action", []() {
    String param1 = server.arg("param1");
    String param2 = server.arg("param2");
    Serial.println(param1);
    Serial.println(param2);
    bool a = LOW;
    if ( param1 == "TRUE" ) {
      a = HIGH;
    }
    digitalWrite(16,a);
    // 요청 처리 코드 작성
    server.send(200, "text/plain", "OK");
  });

  server.begin();
  Serial.println("HTTP server started");
}

void loop() {
  server.handleClient();
}
