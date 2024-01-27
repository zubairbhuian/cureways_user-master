import 'dart:io';
import 'package:cureways_user/data/network/models/base/base_model.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService({required this.dio});

  Future<BaseModel> _makeRequest(String url, dynamic data, HttpMethod method,
      {String contentType = 'application/json',dynamic queryParameters}) async {
    try {
      late Response response;
      if (method == HttpMethod.get) {
        response = await dio.get(
          url,
          data: data,
          queryParameters: queryParameters,
          options: Options(contentType: contentType),
        );
      } else if (method == HttpMethod.post) {
        response = await dio.post(
          url,
          data: data,
          options: Options(contentType: contentType, receiveDataWhenStatusError: true),
          queryParameters: queryParameters
        );
      } else if (method == HttpMethod.put) {
        response = await dio.put(
          url,
          data: data,
          options: Options(contentType: contentType),
           queryParameters: queryParameters
        );
      } else if (method == HttpMethod.delete) {
        response = await dio.delete(
          url,
          options: Options(contentType: contentType),
          queryParameters: queryParameters
        );
      }

      return BaseModel(
        statusCode: response.statusCode,
        data: response.data,
        message: response.statusMessage ?? "",
      );
    } on DioException catch (e) {
      /// Log Error
      // MyLogger.logger.e(e.toString());

      if (e.error is SocketException) {
        return BaseModel(
          message: 'No Internet Connection',
        );
      }
      return BaseModel(message: e.message.toString());
    } catch (err) {
      /// Log Error
      // MyLogger.logger.e(err.toString());

      if (err is SocketException) {
        return BaseModel(
          message: 'No Internet Connection',
        );
      }
      return BaseModel(message: err.toString());
    }
  }

  Future<BaseModel> makePostRequest(
    String url,
    Map<String, dynamic> data,
    {Map<String, dynamic>? queryParameters}
  ) async {
    return _makeRequest(url, data, HttpMethod.post,queryParameters: queryParameters);
  }

  Future<BaseModel> makePostRequestWithFormData(
    String url,
    FormData data,
    {Map<String, dynamic>? queryParameters}
  ) async {
    return _makeRequest(
      url,
      data,
      HttpMethod.post,
      contentType: "multipart/form-data",
      queryParameters: queryParameters
    );
  }

  Future<BaseModel> makeGetRequest(String url,{Map<String, dynamic>? queryParameters,Map<String, dynamic>? data}) async {
    return _makeRequest(url,data, HttpMethod.get,queryParameters:queryParameters );
  }

  Future<BaseModel> makePutRequest(
      String url, Map<String, dynamic> data) async {
    return _makeRequest(url, data, HttpMethod.put);
  }

  Future<BaseModel> makeDeleteRequest(String url,
      {Map<String, dynamic>? queryParameters}) async {
    return _makeRequest(url, queryParameters, HttpMethod.delete);
  }
}

enum HttpMethod {
  get,
  post,
  put,
  delete,
}
