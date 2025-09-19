import 'package:amritha_ayurveda/core/configs/api_config.dart';
import 'package:amritha_ayurveda/core/services/dio_service.dart';
import 'package:amritha_ayurveda/core/services/secure_storage_service.dart';
import 'package:amritha_ayurveda/domain/register_form/entity/register_form_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class RegisterSource {
  Future<Either> postPatientRegister({
    required PatientRegisterModel appointMent,
  });
}

class RegisterSourceImpl extends RegisterSource {
  final _storage = StorageService();
  @override
  Future<Either> postPatientRegister({
    required PatientRegisterModel appointMent,
  }) async {
    print(appointMent.toJson());

    try {
      final String _token = await _storage.getUserToken() ?? "";
      final response = await DioService().post(
        ApiConfig.patientPostApiEndPoint,
        data: appointMent.toJson(),
        options: Options(
          headers: {
            "Authorization": "Bearer $_token",
            "Content-Type": "application/x-www-form-urlencoded",
          },
          contentType: Headers.formUrlEncodedContentType,
        ),
      );

      final message = response?.data['message'].toString();
      if (response?.statusCode == 200 && response?.data["status"] == true) {
        return Right(message ?? "Successful!");
      } else {
        return Left(message ?? "Failed");
      }
    } catch (e) {
      return Left(e);
    }
  }
}
