import 'package:amritha_ayurveda/domain/register_form/entity/register_form_entity.dart';
import 'package:dartz/dartz.dart';

abstract class RegisterRepository {
  Future<Either> postPatientRegister({
    required PatientRegisterModel appointMent,
  });
}
