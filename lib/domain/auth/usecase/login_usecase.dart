import 'package:amritha_ayurveda/core/usecase/usecase.dart';
import 'package:amritha_ayurveda/data/auth/model/login_model.dart';
import 'package:amritha_ayurveda/domain/auth/repository/auth_repo.dart';
import 'package:amritha_ayurveda/get_servcie_locator.dart';
import 'package:dartz/dartz.dart';

class LoginUsecase extends UseCase<Either, LoginModel> {
  @override
  Future<Either> call({LoginModel? params}) async {
    return await sl<AuthRepository>().userLogin(loginModel: params!);
  }
}
