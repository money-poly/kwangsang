import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

enum HttpMethod {
  get,
  post,
  put,
  patch,
  delete,
}

enum UrlType { dummy, dev }

class API {
  final String baseUrl = dotenv.env['BASE_URL']!;
  final String tempUrl = dotenv.env['TEMP_URL']!;

  Future<http.Response> req(String url, HttpMethod method,
      {body, UrlType type = UrlType.dummy}) async {
    final reqUrl =
        Uri.parse(type == UrlType.dev ? tempUrl + url : baseUrl + url);
    final header = {
      if (method != HttpMethod.get) 'Content-Type': 'application/json'
    };
    switch (method) {
      case HttpMethod.get:
        return await http.get(reqUrl, headers: header);
      case HttpMethod.post:
        return await http.post(reqUrl, headers: header, body: body);
      case HttpMethod.put:
        return await http.put(reqUrl, headers: header, body: body);
      case HttpMethod.patch:
        return await http.patch(reqUrl, headers: header, body: body);
      case HttpMethod.delete:
        return await http.delete(reqUrl, headers: header, body: body);
      default:
        throw Exception("Invalid http method");
    }
  }
}
