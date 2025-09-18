import 'package:amritha_ayurveda/data/auth/model/login_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either> userLogin({required LoginModel loginModel});
}
