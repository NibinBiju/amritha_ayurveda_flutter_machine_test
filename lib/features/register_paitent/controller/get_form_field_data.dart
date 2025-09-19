import 'package:amritha_ayurveda/core/configs/api_config.dart';
import 'package:amritha_ayurveda/core/services/dio_service.dart';
import 'package:amritha_ayurveda/core/services/secure_storage_service.dart';
import 'package:amritha_ayurveda/data/register_form/model/branch_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GetFormFieldDataProvider extends ChangeNotifier {
  BranchModel? branchModel;
  final _storage = StorageService();

  void getBranchFormData() async {
    final String _token = await _storage.getUserToken() ?? "";
    try {
      final response = await DioService().get(
        ApiConfig.branchListApiEndPoint,
        options: Options(headers: {"Authorization": "Bearer $_token"}),
      );
      final message = response?.data['message'].toString();

      if (response?.statusCode == 200 && response?.data["status"] == true) {
        branchModel = branchModelFromJson(response?.data);
      } else {
        print(message);
      }
    } catch (e) {
      print(e);
    }
  }
}
