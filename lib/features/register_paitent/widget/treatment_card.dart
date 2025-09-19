import 'package:amritha_ayurveda/core/configs/app_colors.dart';
import 'package:amritha_ayurveda/core/configs/app_text_styles.dart';
import 'package:amritha_ayurveda/features/register_paitent/widget/treatment_bottom_sheet.dart';
import 'package:flutter/material.dart';

class TreatmentCard extends StatelessWidget {
  final String title;
  final int maleCount;
  final int femaleCount;
  final VoidCallback? onRemove;
  final VoidCallback? onEdit;
  final VoidCallback? onAddTreatment;
  final int index;

  const TreatmentCard({
    super.key,
    required this.title,
    required this.maleCount,
    required this.femaleCount,
    this.onRemove,
    this.onEdit,
    this.onAddTreatment,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${index + 1}. ",
                    style: AppTextStyles.heading3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: AppTextStyles.heading3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Male",
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 17,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 12,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: AppColors.primary),
                              ),
                              child: Text(
                                "$maleCount",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                            const SizedBox(width: 25),
                            Text(
                              "Female",
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 17,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 12,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: AppColors.primary),
                              ),
                              child: Text(
                                "$femaleCount",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                            Spacer(),

                            if (onEdit != null)
                              GestureDetector(
                                onTap: onEdit,
                                child: const Icon(
                                  Icons.edit,
                                  color: Colors.green,
                                  size: 20,
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    spacing: 5,
                    children: [
                      if (onRemove != null)
                        GestureDetector(
                          onTap: onRemove,
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                            ),
                            padding: const EdgeInsets.all(4),
                            child: const Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 8),
      ],
    );
  }
}

Future<void> showTreatmentBottomSheet({
  required BuildContext context,
  required List<String> treatments,
  Function(String? treatment, int maleCount, int femaleCount)? onSave,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) {
      return TreatmentBottomSheet.treatmentBottomSheet(
        treatments: treatments,
        onSave: onSave,
      );
    },
  );
}
