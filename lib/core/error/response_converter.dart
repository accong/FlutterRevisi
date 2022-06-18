class ResponseConverter {
  String? message;
  int? code;

  ResponseConverter({
    this.message,
    this.code
  });

  void createResponse(dynamic jsonString) {
    Map jsonMap = jsonString;
    initCode(jsonMap);
    initMessage(jsonMap);
  }

  void initCode(Map mapJson) {
    int? temp = 0;
    if (mapJson.containsKey("code")) {
      temp = mapJson["code"];
    } else if (mapJson.containsKey("error_code")) {
      temp = mapJson["error_code"];
    }
    code = temp;
  }

  void initMessage(Map mapJson) {
    String tempMessage = "";
    if (mapJson.containsKey("messages")) {
      tempMessage = messageExtract(mapJson, "messages");
    } else if (mapJson.containsKey("message")) {
      tempMessage = messageExtract(mapJson, "message");
    }
    message = tempMessage;
  }

  String messageExtract(Map mapJson, String key) {
    String tempMessage = "";
    dynamic tempString = mapJson[key];
    try {
      List<dynamic> list = tempString;
      for (int i = 0; i < list.length; i++) {
        tempMessage += list[i].toString() + " ";
      }
    } catch (e) {
      tempMessage = tempString.toString();
    }
    return tempMessage;
  }
}
