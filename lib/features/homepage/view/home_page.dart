import 'package:amritha_ayurveda/common/helper/custom_button.dart';
import 'package:amritha_ayurveda/core/configs/app_colors.dart';
import 'package:amritha_ayurveda/core/configs/app_images.dart';
import 'package:amritha_ayurveda/core/configs/app_text_styles.dart';
import 'package:amritha_ayurveda/features/homepage/controller/home_page_provider.dart';
import 'package:amritha_ayurveda/features/homepage/widgets/home_card_widget.dart';
import 'package:amritha_ayurveda/features/homepage/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<HomePageProvider>(context, listen: false).getPatientList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var homeProvider = Provider.of<HomePageProvider>(context);
    return Scaffold(
      floatingActionButton: CustomButton(
        title: "Register",
        height: 60,
        width: 120,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          homeProvider.getPatientList();
        },
        color: AppColors.primary,
        child: CustomScrollView(
          slivers: [
            SliverAppBar.medium(
              backgroundColor: AppColors.background,
              stretch: true,
              expandedHeight: 80,
              leading: Icon(Icons.arrow_back, color: AppColors.black),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Image.asset(AppImages.notificationIcon),
                ),
              ],
            ),
            HomeSearchWidget(),
            SortingWidget(),
            SliverToBoxAdapter(
              child: homeProvider.isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    )
                  : Column(
                      children: List.generate(
                        homeProvider.patientBookingEntity?.patients.length ?? 0,
                        (index) => HomeCardWidget(
                          index: index + 1,
                          customerName:
                              homeProvider
                                  .patientBookingEntity
                                  ?.patients[index]
                                  .name ??
                              "",
                          packageName:
                              homeProvider
                                  .patientBookingEntity
                                  ?.patients[index]
                                  .branch
                                  ?.name ??
                              "",
                          date:
                              homeProvider
                                  .patientBookingEntity
                                  ?.patients[index]
                                  .dateNdTime
                                  .toString() ??
                              "",
                          staff: "Jithesh",
                          onTap: () {
                            // Navigate to booking details
                          },
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class SortingWidget extends StatelessWidget {
  const SortingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Sort by:', style: AppTextStyles.heading3),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColors.grey.shade300,
                    borderRadius: BorderRadius.circular(23),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.keyboard_arrow_down_sharp),
                      SizedBox(width: 80),
                      Text('Date', style: AppTextStyles.heading3),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Divider(color: AppColors.black),
          ],
        ),
      ),
    );
  }
}
