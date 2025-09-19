import 'package:amritha_ayurveda/common/helper/custom_dropdown_button.dart';
import 'package:amritha_ayurveda/data/register_form/model/treatment_model.dart';
import 'package:amritha_ayurveda/domain/register_form/entity/register_treatment_entity.dart';
import 'package:amritha_ayurveda/features/register_paitent/controller/get_treatments_data.dart';
import 'package:amritha_ayurveda/features/register_paitent/controller/treatment_add_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TreatmentBottomSheet extends StatefulWidget {
  final List<TreatmentResponse> treatments;
  final Function(String? treatment, int maleCount, int femaleCount)? onSave;

  const TreatmentBottomSheet.treatmentBottomSheet({
    super.key,
    required this.treatments,
    this.onSave,
  });

  @override
  State<TreatmentBottomSheet> createState() => _TreatmentBottomSheetState();
}

class _TreatmentBottomSheetState extends State<TreatmentBottomSheet> {
  TreatmentModel? selectedTreatment;
  String? selectedTreatmentName;
  final TextEditingController _treatnameController = TextEditingController();

  int maleCount = 0;
  int femaleCount = 0;

  @override
  Widget build(BuildContext context) {
    var treatmentProvider = Provider.of<TreatmentAddProvider>(context);
    var treatmentgetProvider = Provider.of<GetTreatMentDataProvider>(context);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Dropdown
          const Text(
            "Choose Treatment",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade300),
              color: Colors.grey.shade100,
            ),
            child: CommonDropdownButton<TreatmentModel>(
              controller: _treatnameController,
              label: 'Select Treatments',
              items: treatmentgetProvider.treatmentModel?.treatments ?? [],
              getLabel: (treatment) => treatment.name,
              getValue: (treatment) => treatment.id,
              value: selectedTreatment,
              onChanged: (value) {
                setState(() {
                  selectedTreatmentName = _treatnameController.text.trim();
                });
              },
            ),
          ),
          const SizedBox(height: 20),

          /// Add Patients
          const Text(
            "Add Patients",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),

          _buildCounterRow("Male", maleCount, (val) {
            setState(() => maleCount = val);
          }),
          const SizedBox(height: 12),
          _buildCounterRow("Female", femaleCount, (val) {
            setState(() => femaleCount = val);
          }),

          const SizedBox(height: 20),

          /// Save Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade800,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              onPressed: () {
                treatmentProvider.addTreatMent(
                  treatMentEntity: RegisterTreatmentEntity(
                    treatMentName: selectedTreatmentName ?? "",
                    maleCount: maleCount,
                    femaleCount: femaleCount,
                    treatmentId: int.parse(selectedTreatmentName ?? '0'),
                  ),
                );
                Navigator.pop(context);
              },
              child: const Text(
                "Save",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCounterRow(String label, int count, Function(int) onChanged) {
    return Row(
      children: [
        /// Label box
        Container(
          width: 80,
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey.shade100,
          ),
          child: Center(child: Text(label)),
        ),
        const SizedBox(width: 10),

        /// Minus button
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.green.shade800,
          child: IconButton(
            icon: const Icon(Icons.remove, color: Colors.white, size: 18),
            onPressed: () {
              if (count > 0) onChanged(count - 1);
            },
          ),
        ),
        const SizedBox(width: 10),

        /// Count display
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(
            child: Text("$count", style: const TextStyle(fontSize: 16)),
          ),
        ),
        const SizedBox(width: 10),

        /// Plus button
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.green.shade800,
          child: IconButton(
            icon: const Icon(Icons.add, color: Colors.white, size: 18),
            onPressed: () {
              onChanged(count + 1);
            },
          ),
        ),
      ],
    );
  }
}
