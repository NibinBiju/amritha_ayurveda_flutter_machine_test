import 'dart:io';
import 'package:amritha_ayurveda/core/configs/api_config.dart';
import 'package:dio/dio.dart';

class DioService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiConfig.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      headers: {'Accept': 'application/json'},
    ),
  );

  Future<Response?> get(String url, {Map<String, dynamic>? queryParams}) async {
    try {
      final response = await _dio.get(url, queryParameters: queryParams);
      return response;
    } catch (e) {
      print('GET error: $e');
      return null;
    }
  }

  Future<Response?> post(String url, {dynamic data, Options? options}) async {
    try {
      final response = await _dio.post(url, options: options, data: data);
      return response;
    } catch (e) {
      print('POST error: $e');
      return null;
    }
  }

  Future<Response?> put(String url, {dynamic data}) async {
    try {
      final response = await _dio.put(url, data: data);
      return response;
    } catch (e) {
      print('PUT error: $e');
      return null;
    }
  }

  Future<Response?> delete(String url) async {
    try {
      final response = await _dio.delete(url);
      return response;
    } catch (e) {
      print('DELETE error: $e');
      return null;
    }
  }

  Future<Response?> postMultipart({
    required String url,
    required Map<String, dynamic> fields,
    File? imageFile,
    File? videoFile,
    String imageFieldKey = 'image',
    String videoFieldKey = 'video',
  }) async {
    try {
      final formData = FormData();

      fields.forEach((key, value) {
        formData.fields.add(MapEntry(key, value.toString()));
      });

      if (imageFile != null && await imageFile.exists()) {
        formData.files.add(
          MapEntry(
            imageFieldKey,
            await MultipartFile.fromFile(
              imageFile.path,
              filename: imageFile.path.split('/').last,
            ),
          ),
        );
      }

      if (videoFile != null && await videoFile.exists()) {
        formData.files.add(
          MapEntry(
            videoFieldKey,
            await MultipartFile.fromFile(
              videoFile.path,
              filename: videoFile.path.split('/').last,
            ),
          ),
        );
      }

      final response = await _dio.post(
        url,
        data: formData,
        options: Options(contentType: 'multipart/form-data'),
      );

      return response;
    } catch (e) {
      print('Multipart POST error: $e');
      return null;
    }
  }
}
