import 'package:amritha_ayurveda/core/usecase/usecase.dart';
import 'package:amritha_ayurveda/domain/home_page/repository/home_page_repo.dart';
import 'package:amritha_ayurveda/get_servcie_locator.dart';
import 'package:dartz/dartz.dart';

class BookingDetailsUsecase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<HomePageRepository>().getBookings();
  }
}
