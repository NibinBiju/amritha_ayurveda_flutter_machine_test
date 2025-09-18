import 'package:amritha_ayurveda/data/auth/repository_impl/repository_impl.dart';
import 'package:amritha_ayurveda/data/auth/source/auth_source.dart';
import 'package:amritha_ayurveda/domain/auth/repository/auth_repo.dart';
import 'package:amritha_ayurveda/domain/auth/usecase/login_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependecies() async {
  //auth
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<AuthSource>(AuthSourceImpl());
  sl.registerSingleton<LoginUsecase>(LoginUsecase());
}
