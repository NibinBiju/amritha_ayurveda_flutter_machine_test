import 'package:amritha_ayurveda/core/usecase/usecase.dart';
import 'package:amritha_ayurveda/domain/register_form/entity/register_form_entity.dart';
import 'package:amritha_ayurveda/domain/register_form/repository/register_repository.dart';
import 'package:amritha_ayurveda/get_servcie_locator.dart';
import 'package:dartz/dartz.dart';

class PatientRegisterUsecase extends UseCase<Either, PatientRegisterModel> {
  @override
  Future<Either> call({PatientRegisterModel? params}) async {
    return await sl<RegisterRepository>().postPatientRegister(
      appointMent: params!,
    );
  }
}
