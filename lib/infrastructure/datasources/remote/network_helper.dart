import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../../domain/constants/app_const.dart';
import '../../../domain/core/resource/data_exception.dart';

class NetworkHelper {
  static final NetworkHelper _networkHelper = NetworkHelper._internal();
  NetworkHelper._internal();
  factory NetworkHelper() => _networkHelper;

  Dio? _dio;
  CancelToken? _cancelToken;
  static const int timeDuration = 20;

  Future<Dio?> get dio async {
    _dio ??= await _initDio();
    return _dio;
  }

  Future _initDio() async {
    var theDio = Dio(
      BaseOptions(
        baseUrl:  AppConst.baseUrl,
        connectTimeout: const Duration(seconds: timeDuration),
        receiveTimeout: const Duration(seconds: timeDuration),
      ),
    );
    _cancelToken = CancelToken();
    return theDio;
  }

  bool cancelAllNetworkCalls() {
    _cancelToken = null;
    _dio = null;
    return true;
  }

  Future<String> postRequest({required path, required body}) async {
    try {
      var restClient = await dio;

      Response<Map>? response = await restClient!.post(
        path,
        data: body,
        cancelToken: _cancelToken,
      );
      return json.encode(response.data);
    } on SocketException {
      throw DataError('No internet connection');
    } on FormatException {
      throw DataError('Invalid response format');
    } catch (e) {
      throw DataError(_handleError(e));
    }
  }

  Future<String> getRequest({required path}) async {
    try {
      var restClient = await dio;
      Response response = await restClient!.get(path, cancelToken: _cancelToken);
      return json.encode(response.data);
    } on SocketException {
      throw DataError('No internet connection');
    } on FormatException {
      throw DataError('Invalid response format');
    } catch (e) {
      throw DataError(_handleError(e));
    }
  }

  String _handleError(e) {
    String errorMessage = "Something went wrong";
    try {
      if (e.error is SocketException) {
        errorMessage = "Internet connection error. Please try again.";
      } else if (e is DioException) {
        switch (e.type) {
          case DioException.connectionError:
            errorMessage = "Internet connection error. Please try again";
            break;
          case DioException.connectionTimeout:
            errorMessage = "We can't connect to the server. Please try again.";
            break;
          default:
            errorMessage = "Something went wrong. Please try again";
            break;
        }
      }
      return errorMessage;
    } catch (e) {
      return errorMessage;
    }
  }

}
