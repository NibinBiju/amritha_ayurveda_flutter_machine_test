import 'package:amritha_ayurveda/domain/home_page/entity/booking_entity.dart';
import 'package:amritha_ayurveda/domain/home_page/usecase/booking_details_usecase.dart';
import 'package:amritha_ayurveda/get_servcie_locator.dart';
import 'package:flutter/material.dart';

class HomePageProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isLoadingMore = false;
  PatientBookingEntity? patientBookingEntity;
  String? message;

  List<PatientEntity> _allPatients = [];
  List<PatientEntity> visiblePatients = [];

  final int _perPage = 10;
  int _currentPage = 0;

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
        _allPatients = patientBookingEntity?.patients ?? [];
        _currentPage = 0;
        visiblePatients = _getPageItems();
        notifyListeners();
      },
    );
  }

  void loadMorePatients() {

    if (isLoadingMore) return;
    if (visiblePatients.length >= _allPatients.length) return;

    isLoadingMore = true;
    notifyListeners();

    Future.delayed(const Duration(milliseconds: 500), () {
      _currentPage++;
      visiblePatients = _allPatients
          .take((_currentPage + 1) * _perPage)
          .toList();
      isLoadingMore = false;
      notifyListeners();
    });
  }

  List<PatientEntity> _getPageItems() {
    return _allPatients.take((_currentPage + 1) * _perPage).toList();
  }
}
