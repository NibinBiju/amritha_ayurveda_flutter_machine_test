import 'package:amritha_ayurveda/domain/register_form/entity/register_treatment_entity.dart';
import 'package:flutter/material.dart';

class TreatmentAddProvider extends ChangeNotifier {
  List<RegisterTreatmentEntity> treatment = [];

  void addTreatMent({required RegisterTreatmentEntity treatMentEntity}) {
    treatment.add(treatMentEntity);
    notifyListeners();
  }

  void removeItem(int index) {
    treatment.removeAt(index);
    notifyListeners();
  }
}
