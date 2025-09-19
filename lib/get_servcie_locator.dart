import 'package:amritha_ayurveda/data/auth/repository_impl/repository_impl.dart';
import 'package:amritha_ayurveda/data/auth/source/auth_source.dart';
import 'package:amritha_ayurveda/data/home_page/repository_impl/home_/home_repository_impl.dart';
import 'package:amritha_ayurveda/data/home_page/source/home_page_source.dart';
import 'package:amritha_ayurveda/data/register_form/repository_impl/resgiter_repo_impl.dart';
import 'package:amritha_ayurveda/data/register_form/source/register_source.dart';
import 'package:amritha_ayurveda/domain/auth/repository/auth_repo.dart';
import 'package:amritha_ayurveda/domain/auth/usecase/login_usecase.dart';
import 'package:amritha_ayurveda/domain/home_page/repository/home_page_repo.dart';
import 'package:amritha_ayurveda/domain/home_page/usecase/booking_details_usecase.dart';
import 'package:amritha_ayurveda/domain/register_form/repository/register_repository.dart';
import 'package:amritha_ayurveda/domain/register_form/usecase/patient_register_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependecies() async {
  //auth
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<AuthSource>(AuthSourceImpl());
  sl.registerSingleton<LoginUsecase>(LoginUsecase());

  //homepage
  sl.registerSingleton<HomePageSource>(HomePageSourceImpl());
  sl.registerSingleton<HomePageRepository>(HomePageRepositoryImpl());
  sl.registerSingleton<BookingDetailsUsecase>(BookingDetailsUsecase());

  //patient register
  sl.registerSingleton<RegisterRepository>(ResgiterRepoImpl());
  sl.registerSingleton<RegisterSource>(RegisterSourceImpl());
  sl.registerSingleton<PatientRegisterUsecase>(PatientRegisterUsecase());
}
