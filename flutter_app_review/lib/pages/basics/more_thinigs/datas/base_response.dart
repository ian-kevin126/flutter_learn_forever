
import 'dart:convert';

class Response{
  String reason;
  int error_code;
  Result result;

  static Response parse(String data, var parseDataFunction) {
    var map = jsonDecode(data);
    Response response = Response();
    response.reason = map['reason'];
    response.error_code = map['error_code'];
    response.result = Result.fromMap(map['result'], parseDataFunction);
    return response;
  }
}

class Result{
  String stat;
  dynamic data;

  static Result fromMap(Map<String, dynamic> map, var parseDataFunction){
    Result result = Result();
    result.stat = map['stat'];
    result.data = parseDataFunction(map['data']);
    return result;
  }
}



