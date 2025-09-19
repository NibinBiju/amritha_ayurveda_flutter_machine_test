import 'package:amritha_ayurveda/common/helper/custom_button.dart';
import 'package:amritha_ayurveda/common/helper/navigation_helper.dart';
import 'package:amritha_ayurveda/core/configs/app_colors.dart';
import 'package:amritha_ayurveda/core/configs/app_images.dart';
import 'package:amritha_ayurveda/core/configs/app_text_styles.dart';
import 'package:amritha_ayurveda/domain/home_page/entity/booking_entity.dart';
import 'package:amritha_ayurveda/features/homepage/controller/home_page_provider.dart';
import 'package:amritha_ayurveda/features/homepage/widgets/home_card_widget.dart';
import 'package:amritha_ayurveda/features/homepage/widgets/search_widget.dart';
import 'package:amritha_ayurveda/features/register_paitent/view/register_patient.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final homeProvider = Provider.of<HomePageProvider>(
        context,
        listen: false,
      );
      homeProvider.getPatientList();
      _scrollController.addListener(() {
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          homeProvider.loadMorePatients();
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var homeProvider = Provider.of<HomePageProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
          RefreshIndicator(
            onRefresh: () async {
              homeProvider.getPatientList();
            },
            color: AppColors.primary,
            child: CustomScrollView(
              controller: _scrollController,
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
                            homeProvider.visiblePatients.length +
                                (homeProvider.isLoadingMore ? 1 : 0),
                            (index) {
                              if (index < homeProvider.visiblePatients.length) {
                                List<PatientEntity> patientList =
                                    homeProvider.visiblePatients;
                                return HomeCardWidget(
                                  index: index + 1,
                                  customerName: patientList[index].name,
                                  packageName:
                                      patientList[index].branch?.name ?? "",
                                  date: patientList[index].dateNdTime
                                      .toString()
                                      .split(' ')
                                      .first,
                                  staff: "Jithesh",
                                  onTap: () {},
                                );
                              } else {
                                return const Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 80)),
              ],
            ),
          ),

          Positioned(
            bottom: 20,
            left: 16,
            right: 16,
            child: CustomButton(
              title: "Register",
              height: 60,
              width: double.infinity,
              onTap: () {
                NavigatorWidget.push(
                  context: context,
                  page: RegisterPatientForm(),
                );
              },
            ),
          ),
        ],
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
            Divider(),
          ],
        ),
      ),
    );
  }
}
