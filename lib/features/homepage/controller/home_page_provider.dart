import 'package:amritha_ayurveda/domain/home_page/entity/booking_entity.dart';
import 'package:amritha_ayurveda/domain/home_page/usecase/booking_details_usecase.dart';
import 'package:flutter/widgets.dart';
import 'package:amritha_ayurveda/get_servcie_locator.dart';

class HomePageProvider extends ChangeNotifier {
  bool isLoading = false;
  PatientBookingEntity? patientBookingEntity;
  String? message;

  void getPatientList() async {
    isLoading = true;
    notifyListeners();

    var returnedData = await sl<BookingDetailsUsecase>().call();

    returnedData.fold(
      (error) {
        isLoading = false;
        message = error;
        notifyListeners();
      },
      (success) {
        isLoading = false;
        message = null;
        patientBookingEntity = success;
        notifyListeners();
      },
    );
  }
}
