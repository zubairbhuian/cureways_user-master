import 'dart:io';
import 'package:cureways_user/utils/style.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'endpoints.dart';

class Server {
  static String? bearerToken;

  static initClass({String? token}) {
    bearerToken = token!;
  }

  getRequest({String? endPoint}) async {
    HttpClient client = HttpClient();
    try {
      client.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);

      var res = await http.get(Uri.parse(Endpoints.server! + endPoint!),
          headers: _getHttpHeaders());

      if (kDebugMode) {
        kLogger.d("URL => ${Endpoints.server! + endPoint}");
        kLogger.d("HEADER => $_getHttpHeaders()");
        kLogger.i("RESPONSE => $res");
      }
      return res;
    } catch (error) {
      kLogger.e(error);
      return null;
    } finally {
      client.close();
    }
  }

  getRequestWithoutToken({String? endPoint}) async {
    HttpClient client = HttpClient();
    try {
      client.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      var res = await http.get(Uri.parse(Endpoints.server + endPoint!),
          headers: getAuthHeaders());

      if (kDebugMode) {
        kLogger.d("URL => ${Endpoints.server + endPoint}");
        kLogger.i("RESPONSE => $res");
      }
      return res;
    } catch (error) {
      kLogger.e(error);
      return null;
    } finally {
      client.close();
    }
  }

  getRequestWithCategoryWiseProductParam(categoryId, storeId) async {
    HttpClient client = HttpClient();
    try {
      client.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      return await http.get(
          Uri.parse(
              "https://xyz.asthaall.com/api/v1/category/product/$categoryId?store_id=$storeId"),
          headers: _getHttpHeaders());
    } catch (error) {
      return null;
    } finally {
      client.close();
    }
  }

  getRequestWithCategoryWiseProductParamYellowMart(categoryId, storeId) async {
    HttpClient client = HttpClient();
    try {
      client.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      return await http.get(
          Uri.parse(
              "https://xyz.asthaall.com/api/v1/category/product/$categoryId?store_id=$storeId"),
          headers: _getHttpHeaders());
    } catch (error) {
      return null;
    } finally {
      client.close();
    }
  }

  getRequestWithLatLngParam({var lat, var lng}) async {
    HttpClient client = HttpClient();
    try {
      client.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      return await http.get(
          Uri.parse(
              "https://xyz.asthaall.com/api/v1/config/get-zone-id?lat=$lat&lng=$lng"),
          headers: getAuthHeaders());
    } catch (error) {
      return null;
    } finally {
      client.close();
    }
  }

  getRequestSettings(endPoint) async {
    HttpClient client = HttpClient();
    try {
      return await http.get(Uri.parse(Endpoints.server + endPoint!),
          headers: getAuthHeaders());
    } catch (error) {
      return null;
    } finally {
      client.close();
    }
  }

  getRequestWithParam({String? endPoint, var categoryId}) async {
    HttpClient client = HttpClient();
    try {
      client.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      return await http.get(
          Uri.parse("${Endpoints.server}category/$categoryId/show"),
          headers: _getHttpHeaders());
    } catch (error) {
      return null;
    } finally {
      client.close();
    }
  }

  getRequestWithParamCuisine({String? endPoint, var cuisineId}) async {
    HttpClient client = HttpClient();
    try {
      client.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      return await http.get(
          Uri.parse("${Endpoints.server!}cuisine/$cuisineId/show"),
          headers: _getHttpHeaders());
    } catch (error) {
      return null;
    } finally {
      client.close();
    }
  }

  getRequestWithParamOrders({String? endPoint, var orderId}) async {
    HttpClient client = HttpClient();
    try {
      client.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      return await http.get(
          Uri.parse("${Endpoints.server!}orders/$orderId/show"),
          headers: _getHttpHeaders());
    } catch (error) {
      return null;
    } finally {
      client.close();
    }
  }

  getRequestWithParamMenuItems({String? endPoint, var menuItemId}) async {
    HttpClient client = HttpClient();
    try {
      client.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      return await http.get(
          Uri.parse(
              "${Endpoints.server!}restaurant-menuItem/menuItem/$menuItemId/show"),
          headers: _getHttpHeaders());
    } catch (error) {
      return null;
    } finally {
      client.close();
    }
  }

  postRequest({String? endPoint, String? body}) async {
    print(Endpoints.server! + endPoint!);
    print(body);
    HttpClient client = HttpClient();
    try {
      client.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      return await http.post(Uri.parse(Endpoints.server! + endPoint),
          headers: getAuthHeaders(), body: body);
    } catch (error) {
      //  return null;
    } finally {
      client.close();
    }
  }

  postR({String? endPoint, String? body}) async {
    print(endPoint!);
    print(body);
    HttpClient client = HttpClient();
    try {
      client.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      return await http.post(Uri.parse(endPoint),
          headers: getAuthHeaders(), body: body);
    } catch (error) {
      //  return null;
    } finally {
      client.close();
    }
  }

  postRequestWithToken({String? endPoint, String? body}) async {
    HttpClient client = HttpClient();
    try {
      client.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);

      var res = await http.post(Uri.parse(Endpoints.server! + endPoint!),
          headers: _getHttpHeaders(), body: body);
      if (kDebugMode) {
        kLogger.d("URL => ${Endpoints.server! + endPoint}");
        kLogger.d("BODY => $body");
        kLogger.d(_getHttpHeaders());
        kLogger.i(res);
      }
      return res;
    } catch (error) {
      kLogger.e(error);
      return null;
    } finally {
      client.close();
    }
  }

  putRequest({String? endPoint, String? body}) async {
    HttpClient client = HttpClient();
    try {
      client.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      return await http.put(Uri.parse(Endpoints.server! + endPoint!),
          headers: _getHttpHeaders(), body: body);
    } catch (error) {
      return null;
    } finally {
      client.close();
    }
  }

  multipartRequest({String? endPoint, body, String? filepath, type}) async {
    Map<String, String> headers = {
      'Authorization': bearerToken!,
      'Content-Type': 'multipart/form-data',
    };
    HttpClient client = HttpClient();
    try {
      http.MultipartRequest request;
      if (type) {
        request = http.MultipartRequest(
            'POST', Uri.parse(Endpoints.server! + endPoint!))
          ..fields.addAll(body)
          ..headers.addAll(headers)
          ..files.add(await http.MultipartFile.fromPath('image', filepath!));
      } else {
        request = http.MultipartRequest(
            'POST', Uri.parse(Endpoints.server! + endPoint!))
          ..fields.addAll(body)
          ..headers.addAll(headers);
      }
      return await request.send();
    } catch (error) {
      return null;
    } finally {
      client.close();
    }
  }

  getRequestParam({String? endPoint, body}) async {
    HttpClient client = HttpClient();
    var uri =
        Uri.https(Endpoints.apiUrl!, Endpoints.apiEndPoint! + endPoint!, body);
    try {
      return await http.get(uri, headers: getAuthHeaders());
    } catch (error) {
      return null;
    } finally {
      client.close();
    }
  }

  getRequestParamWithToken({String? endPoint, body}) async {
    HttpClient client = HttpClient();
    var uri =
        Uri.https(Endpoints.apiUrl!, Endpoints.apiEndPoint! + endPoint!, body);
    try {
      return await http.get(uri, headers: _getHttpHeaders());
    } catch (error) {
      return null;
    } finally {
      client.close();
    }
  }

  deleteRequest({String? endPoint}) async {
    HttpClient client = HttpClient();
    try {
      client.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      return await http.delete(Uri.parse(Endpoints.server! + endPoint!),
          headers: _getHttpHeaders());
    } catch (error) {
      return null;
    } finally {
      client.close();
    }
  }

  static Map<String, String> _getHttpHeaders() {
    Map<String, String> headers = <String, String>{};
    headers['Authorization'] = bearerToken!;
    headers['content-type'] = 'application/json';
    return headers;
  }

  static Map<String, String> getAuthHeaders() {
    Map<String, String> headers = <String, String>{};
    headers['content-type'] = 'application/json';
    return headers;
  }

  customGetRequest({String? endPoint, String? token}) async {
    HttpClient client = HttpClient();
    try {
      return await http.get(
        Uri.parse(Endpoints.server! + endPoint!),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': token!
        },
      );
    } catch (error) {
      return null;
    } finally {
      client.close();
    }
  }
}
