import 'package:amritha_ayurveda/core/configs/app_colors.dart';
import 'package:amritha_ayurveda/core/configs/app_text_styles.dart';
import 'package:flutter/material.dart';

class HomeCardWidget extends StatelessWidget {
  final int index;
  final String customerName;
  final String packageName;
  final String date;
  final String staff;
  final VoidCallback onTap;

  const HomeCardWidget({
    super.key,
    required this.index,
    required this.customerName,
    required this.packageName,
    required this.date,
    required this.staff,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("$index.", style: AppTextStyles.heading3),
            const SizedBox(width: 8),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(customerName, style: AppTextStyles.heading3),

                  const SizedBox(height: 4),

                  Text(
                    packageName,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 8),

                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        size: 16,
                        color: Colors.redAccent,
                      ),
                      const SizedBox(width: 4),
                      Text(date, style: AppTextStyles.bodyLarge),

                      const SizedBox(width: 16),

                      const Icon(Icons.person, size: 16, color: Colors.orange),
                      const SizedBox(width: 4),
                      Text(staff, style: AppTextStyles.bodyLarge),
                    ],
                  ),

                  const SizedBox(height: 12),

                  Divider(height: 20),

                  InkWell(
                    onTap: onTap,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "View Booking details",
                          style: AppTextStyles.heading3,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
