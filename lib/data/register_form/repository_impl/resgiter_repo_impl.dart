import 'package:amritha_ayurveda/data/register_form/source/register_source.dart';
import 'package:amritha_ayurveda/domain/register_form/entity/register_form_entity.dart';
import 'package:amritha_ayurveda/domain/register_form/repository/register_repository.dart';
import 'package:amritha_ayurveda/get_servcie_locator.dart';
import 'package:dartz/dartz.dart';

class ResgiterRepoImpl extends RegisterRepository {
  @override
  Future<Either> postPatientRegister({
    required PatientRegisterModel appointMent,
  }) async {
    var returnedData = await sl<RegisterSource>().postPatientRegister(
      appointMent: appointMent,
    );

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(data);
      },
    );
  }
}
