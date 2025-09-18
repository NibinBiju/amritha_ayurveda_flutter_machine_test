import 'package:amritha_ayurveda/core/configs/api_config.dart';
import 'package:amritha_ayurveda/core/services/dio_service.dart';
import 'package:amritha_ayurveda/core/services/secure_storage_service.dart';
import 'package:amritha_ayurveda/data/auth/model/login_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class AuthSource {
  Future<Either> userLogin({required LoginModel loginModel});
}

class AuthSourceImpl extends AuthSource {
  final storage = StorageService();

  @override
  Future<Either> userLogin({required LoginModel loginModel}) async {
    print(loginModel.toJson());
    try {
      final response = await DioService().post(
        ApiConfig.loginApiEndPoint,
        data: loginModel.toJson(),
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );
      final token = response?.data['user_id'].toString();
      final message = response?.data['message'].toString();
      if (response?.statusCode == 200 && response?.data["status"] == true) {
        storage.saveUserId(token!);
        return Right(message);
      } else {
        return Left(message);
      }
    } catch (e) {
      return Left(e);
    }
  }
}
