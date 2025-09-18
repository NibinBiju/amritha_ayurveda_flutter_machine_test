
import 'package:amritha_ayurveda/common/helper/custom_button.dart';
import 'package:amritha_ayurveda/common/helper/custom_textfield.dart';
import 'package:flutter/material.dart';

class HomeSearchWidget extends StatelessWidget {
  const HomeSearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: SizedBox(
                height: 55,
                child: CustomTextField(
                  prefixIcon: Icons.search,
                  labelText: 'Search',
                ),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: SizedBox(
                height: 55,
                child: CustomButton(title: "Search"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}