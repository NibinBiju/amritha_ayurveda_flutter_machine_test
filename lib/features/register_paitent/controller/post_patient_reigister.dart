import 'package:amritha_ayurveda/domain/register_form/entity/register_form_entity.dart';
import 'package:amritha_ayurveda/domain/register_form/usecase/patient_register_usecase.dart';
import 'package:amritha_ayurveda/get_servcie_locator.dart';
import 'package:flutter/material.dart';

class PostPatientReigisterProvider extends ChangeNotifier {
  bool isLoading = false;

  Future<void> onPostPatientRegister({
    required PatientRegisterModel appointMent,
    required BuildContext context,
  }) async {
    isLoading = true;
    notifyListeners();

    final returnedData = await sl<PatientRegisterUsecase>().call(
      params: appointMent,
    );

    isLoading = false;
    notifyListeners();

    returnedData.fold(
      (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.toString()),
            backgroundColor: Colors.white,
            behavior: SnackBarBehavior.floating,
          ),
        );
      },
      (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Patient registered successfully!"),
            backgroundColor: Colors.white,
            behavior: SnackBarBehavior.floating,
          ),
        );
      },
    );
  }
}
