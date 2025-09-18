import 'package:amritha_ayurveda/data/home_page/model/booking_model.dart';
import 'package:amritha_ayurveda/data/home_page/source/home_page_source.dart';
import 'package:amritha_ayurveda/domain/home_page/repository/home_page_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:amritha_ayurveda/get_servcie_locator.dart';

class HomePageRepositoryImpl extends HomePageRepository {
  @override
  Future<Either> getBookings() async {
    var returnedData = await sl<HomePageSource>().getBookings();

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(PatientBookingModel.fromJson(data).toEntity());
      },
    );
  }
}
