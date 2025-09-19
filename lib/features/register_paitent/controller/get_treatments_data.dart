import 'package:amritha_ayurveda/core/configs/api_config.dart';
import 'package:amritha_ayurveda/core/services/dio_service.dart';
import 'package:amritha_ayurveda/core/services/secure_storage_service.dart';
import 'package:amritha_ayurveda/data/register_form/model/treatment_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GetTreatMentDataProvider extends ChangeNotifier {
  TreatmentResponse? treatmentModel;
  final _storage = StorageService();

  void getTreatMentFormData() async {
    final String _token = await _storage.getUserToken() ?? "";
    try {
      final response = await DioService().get(
        ApiConfig.treatMentListApiEndPoint,
        options: Options(headers: {"Authorization": "Bearer $_token"}),
      );

      if (response?.statusCode == 200 && response?.data["status"] == true) {
        print("Get treatment response:${response?.data}");
        treatmentModel = TreatmentResponse.fromJson(response?.data);
        notifyListeners();
      } else {
        print('Error while get treatment');
      }
    } catch (e) {
      print(e);
    }
  }
}
