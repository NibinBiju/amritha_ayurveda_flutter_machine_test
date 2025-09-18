import 'package:amritha_ayurveda/core/configs/api_config.dart';
import 'package:amritha_ayurveda/core/services/dio_service.dart';
import 'package:amritha_ayurveda/core/services/secure_storage_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class HomePageSource {
  Future<Either> getBookings();
}

class HomePageSourceImpl extends HomePageSource {
  final _storage = StorageService();

  @override
  Future<Either> getBookings() async {
    final String token = await _storage.getUserToken() ?? "";
    print("Token: $token");
    try {
      final response = await DioService().get(
        ApiConfig.patientListApiEndPoint,
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      final message = response?.data['message'].toString();
      print(response?.data);

      if (response?.statusCode == 200 && response?.data["status"] == true) {
        return Right(response?.data);
      } else {
        return Left(message);
      }
    } catch (e) {
      return Left(e);
    }
  }
}
