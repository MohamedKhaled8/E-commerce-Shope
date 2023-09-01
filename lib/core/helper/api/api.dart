import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
// ignore_for_file: empty_catches, duplicate_ignore


class ApiService {
  Future<dynamic> get({
    required String url,
    bool file = false,
    String? token,
  }) async {
    http.Response? data;

    // debugPrint('url: $url  $token');
    try {
      data = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'multipart/form-data',
          'Locale':'EN',
        },
      );
      // debugPrint('${data.statusCode} data: ${data.body}');
      if (data.contentLength! > 0 && data.statusCode == 200 ||
          data.statusCode == 201) {
        if (file) {
          return data.bodyBytes;
        } else {
          return json.decode(data.body);
        }
      } else {
        return {
          'error': 'Api Format Error',
          'body': data.body,
          'statusCode': '${data.statusCode}',
          'message': data.body.isEmpty
              ? "No Content Error"
              : jsonDecode(data.body)['message'] ?? 'Try again',
        };
      }
      // ignore: empty_catches
    } catch (e) {}
  }

  Future<dynamic> post({
    required String url,
    required dynamic body,
    bool file = false,
    String? token,
  }) async {
    http.Response? data;
    // debugPrint('url: $url $body  $token');
    try {
      data = await http.post(Uri.parse(url),
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'multipart/form-data',
               'Locale':'EN',
          },
          body: body);
      // debugPrint('${data.statusCode} data: ${data.body}');

      if (data.statusCode == 200 ||
          data.statusCode == 201 ||
          jsonDecode(data.body)['code'] != null) {
        if (file) {
          return data.body;
        } else {
          return json.decode(data.body);
        }
      } else {
        return {
          'error': 'Api Format Error',
          'body': data.body,
          'statusCode': '${data.statusCode}',
          'message': jsonDecode(data.body)['message'] ?? 'Try again',
        };
      }
      // ignore: empty_catches
    } catch (e) {}
  }

  Future<dynamic> patch({
    required String url,
    Map<String, String>? headers,
    required String token,
    Map<String, dynamic>? body,
  }) async {
    http.Response? data;
    try {
      data = await http.patch(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
             'Locale':'EN',
        },
        body: body,
      );

      if (data.statusCode == 200 ||
          data.statusCode == 201 ||  jsonDecode(data.body)['code'] != null&& data.body.isNotEmpty) {
        return json.decode(data.body);
      } else {
        return {
          'error': 'Api Format Error',
          'body': 'Null Body',
          'statusCode': '${data.statusCode}',
          'message': jsonDecode(data.body)['message'] ?? 'Try again',
        };
      }
    } catch (e) {}
  }

  Future<dynamic> put({
    required String url,
    required dynamic body,
    bool file = false,
    String? token,
  }) async {
    http.Response? data;
    // debugPrint('url: $url $body  $token');
    try {
      data = await http.put(Uri.parse(url),
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'multipart/form-data',
               'Locale':'EN',
          },
          body: body);
      // debugPrint('${data.statusCode} data: ${data.body}');

      if (data.statusCode == 200 ||
          data.statusCode == 201 ||
          jsonDecode(data.body)['code'] != null) {
        if (file) {
          return data.body;
        } else {
          return json.decode(data.body);
        }
      } else {
        return {
          'error': 'Api Format Error',
          'body': 'Null Body',
          'statusCode': '${data.statusCode}',
          'message': jsonDecode(data.body)['message'] ?? 'Try again',
        };
      }
      // ignore: empty_catches
    } catch (e) {}
  }

  Future<dynamic> delete({
    required String url,
    Map<String, String>? headers,
    required String token,
  }) async {
    // debugPrint('url: $url  $token');

    http.Response? data;
    try {
      data = await http.delete(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'multipart/form-data',
             'Locale':'EN',
        },
      );
      // debugPrint('${data.statusCode} data: ${data.body}');
      if (data.statusCode == 200 || data.statusCode == 201) {
        return json.decode(data.body);
      } else {
        return {
          'error': 'Api Format Error',
          'body': 'Null Body',
          'statusCode': '${data.statusCode}',
          'message': jsonDecode(data.body)['message'] ?? 'Try again',
        };
      }
      // ignore: empty_catches
    } catch (e) {}
  }

  Future<dynamic> multiPartR({
    required String url,
    required Map<String, dynamic> body,
    String? token,
  }) async {
    // debugPrint('url: $url $body  $token');

    List valueList = [];
    bool listField = false;
    var request = http.MultipartRequest('POST', Uri.parse(url));

    try {
      request.headers.addAll({
        'Authorization': 'Bearer $token',
        'Accept': 'multipart/form-data',
           'Locale':'EN',
      });

      body.forEach((key, value) async {
        if (value.runtimeType == List<dynamic>) {
          valueList = value;
          listField = true;
        } else if (value.runtimeType == List<String>) {
          valueList = value;
          listField = true;
        } else if (value.runtimeType == List<int>) {
          valueList = value;
          listField = true;
        } else {
          listField = false;
        }

        if (valueList.isNotEmpty && listField) {
          for (int index = 0; index < valueList.length; index++) {
            if (valueList[index].runtimeType == String &&
                    GetUtils.isImage(valueList[index]) ||
                value.toLowerCase().endsWith(".m4a") ||
                GetUtils.isAudio(valueList[index])) {
              request.files.add(await http.MultipartFile.fromPath(
                  '$key[${index.toString()}]', valueList[index]));
            } else {
              request.fields
                  .addAll({'$key[${index.toString()}]': valueList[index]});
            }
          }
        } else {
          if (!listField) {
            if (value.runtimeType == String && GetUtils.isImage(value) ||
                GetUtils.isAudio(value) ||
                value.toLowerCase().endsWith(".m4a")) {
              request.files.add(await http.MultipartFile.fromPath(key, value));
            } else {
              if (value.isNotEmpty) {
                request.fields[key] = value;
              }
            }
          }
        }
      });

      var response = await request.send();

      final data = await http.Response.fromStream(response);
      // debugPrint('${data.statusCode} data: ${data.body}');
      if (data.statusCode == 200 ||
          data.statusCode == 201 ||
          jsonDecode(data.body)['code'] != null) {
        return json.decode(data.body);
      } else {
        return {
          'error': 'Api Format Error',
          'body': 'Null Body',
          'statusCode': '${data.statusCode}',
          'message': jsonDecode(data.body)['message'] ?? 'Try again',
        };
      }
      // ignore: empty_catches
    } catch (e) {}
  }
}