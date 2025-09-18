import 'package:amritha_ayurveda/data/auth/model/login_model.dart';
import 'package:amritha_ayurveda/data/auth/source/auth_source.dart';
import 'package:amritha_ayurveda/domain/auth/repository/auth_repo.dart';
import 'package:amritha_ayurveda/get_servcie_locator.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> userLogin({required LoginModel loginModel}) {
    var returnedData = sl<AuthSource>().userLogin(loginModel: loginModel);

    return returnedData;
  }
}
