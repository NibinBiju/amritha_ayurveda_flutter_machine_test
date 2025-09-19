import 'package:amritha_ayurveda/common/helper/custom_button.dart';
import 'package:amritha_ayurveda/common/helper/custom_dropdown_button.dart';
import 'package:amritha_ayurveda/common/helper/custom_radio_button.dart';
import 'package:amritha_ayurveda/common/helper/custom_textfield.dart';
import 'package:amritha_ayurveda/core/configs/app_colors.dart';
import 'package:amritha_ayurveda/core/configs/app_images.dart';
import 'package:amritha_ayurveda/core/configs/app_text_styles.dart';
import 'package:amritha_ayurveda/data/register_form/model/branch_model.dart';
import 'package:amritha_ayurveda/data/register_form/model/treatment_model.dart';
import 'package:amritha_ayurveda/domain/register_form/entity/register_form_entity.dart';
import 'package:amritha_ayurveda/features/register_paitent/controller/get_form_field_data.dart';
import 'package:amritha_ayurveda/features/register_paitent/controller/get_treatments_data.dart';
import 'package:amritha_ayurveda/features/register_paitent/controller/post_patient_reigister.dart';
import 'package:amritha_ayurveda/features/register_paitent/controller/treatment_add_provider.dart';
import 'package:amritha_ayurveda/features/register_paitent/widget/treatment_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPatientForm extends StatefulWidget {
  const RegisterPatientForm({super.key});

  @override
  State<RegisterPatientForm> createState() => _RegisterPatientFormState();
}

class _RegisterPatientFormState extends State<RegisterPatientForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _whatsappController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _totalAmountController = TextEditingController();
  final TextEditingController _discountAmountController =
      TextEditingController();
  final TextEditingController _advanceAmountController =
      TextEditingController();
  final TextEditingController _balanceAmountController =
      TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _branchController = TextEditingController();
  final TextEditingController _hourController = TextEditingController();
  final TextEditingController _minuteController = TextEditingController();
  String radioValue = 'Cash';

  int? selectedValue;

  @override
  void dispose() {
    _nameController.dispose();
    _whatsappController.dispose();
    _addressController.dispose();
    _totalAmountController.dispose();
    _discountAmountController.dispose();
    _advanceAmountController.dispose();
    _balanceAmountController.dispose();
    _dateController.dispose();
    _locationController.dispose();
    _branchController.dispose();
    _hourController.dispose();
    _minuteController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    Provider.of<GetBranchDataProvider>(
      context,
      listen: false,
    ).getBranchFormData();
    Provider.of<GetTreatMentDataProvider>(
      context,
      listen: false,
    ).getTreatMentFormData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var treatmentProvider = Provider.of<TreatmentAddProvider>(context);
    var getFormDataProvider = Provider.of<GetBranchDataProvider>(context);
    var getTreatMentProvider = Provider.of<GetTreatMentDataProvider>(context);
    var postRegisterProvider = Provider.of<PostPatientReigisterProvider>(
      context,
    );

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            backgroundColor: AppColors.background,
            stretch: true,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, color: AppColors.black),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Image.asset(AppImages.notificationIcon),
              ),
            ],
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text("Register"),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(),

                  //name
                  _textfieldHeadtext(text: "Name"),
                  SizedBox(height: 5),
                  CustomTextField(
                    controller: _nameController,
                    showBorder: false,
                    hint: Text("Enter your full name"),
                  ),
                  SizedBox(height: 10),

                  //whatsapp no
                  _textfieldHeadtext(text: "Whatsapp Number"),
                  SizedBox(height: 5),
                  CustomTextField(
                    controller: _whatsappController,
                    showBorder: false,
                    hint: Text("Enter your Whatsapp Number"),
                  ),
                  SizedBox(height: 10),

                  //address
                  _textfieldHeadtext(text: "Address"),
                  SizedBox(height: 5),
                  CustomTextField(
                    controller: _addressController,
                    showBorder: false,
                    hint: Text("Enter your Address"),
                  ),
                  SizedBox(height: 10),

                  _textfieldHeadtext(text: "Location"),
                  SizedBox(height: 5),
                  CommonDropdownButton<String>(
                    label: "Location",
                    items: ["Ernakulam", "Kozhikode"],
                    value: _locationController.text.isNotEmpty
                        ? _locationController.text
                        : null,
                    getLabel: (item) => item,
                    getValue: (item) => item,
                    controller: _locationController,
                    onChanged: (val) {
                      print("Selected location: $val");
                    },
                  ),
                  SizedBox(height: 10),

                  _textfieldHeadtext(text: "Branch"),
                  SizedBox(height: 5),
                  getFormDataProvider.branchModel?.branches == null ||
                          getFormDataProvider.branchModel!.branches!.isEmpty
                      ? Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primary,
                          ),
                        )
                      : CommonDropdownButton<Branch>(
                          label: "Branch",
                          items:
                              getFormDataProvider.branchModel?.branches ?? [],
                          value:
                              getFormDataProvider.branchModel?.branches?.first,
                          getLabel: (branch) => branch.name ?? "Unknown",
                          getValue: (branch) => branch.id,
                          controller: _branchController,
                          onChanged: (val) {
                            print("Selected branch id: $val");
                          },
                        ),
                  SizedBox(height: 10),

                  _textfieldHeadtext(text: "Treatment"),
                  SizedBox(height: 5),
                  getTreatMentProvider.treatmentModel?.treatments == null ||
                          getTreatMentProvider
                              .treatmentModel!
                              .treatments
                              .isEmpty
                      ? Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primary,
                          ),
                        )
                      : Column(
                          children: List.generate(
                            treatmentProvider.treatment.length,
                            (index) => TreatmentCard(
                              index: index,
                              title: treatmentProvider
                                  .treatment[index]
                                  .treatMentName,
                              maleCount:
                                  treatmentProvider.treatment[index].maleCount,
                              femaleCount: treatmentProvider
                                  .treatment[index]
                                  .femaleCount,
                              onRemove: () =>
                                  treatmentProvider.removeItem(index),
                              onEdit: () => print("Edit pressed"),
                            ),
                          ),
                        ),
                  GestureDetector(
                    onTap: () {
                      showTreatmentBottomSheet(
                        context: context,
                        treatments:
                            (getTreatMentProvider.treatmentModel?.treatments ??
                                    [])
                                .cast<TreatmentResponse>(),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        "+ Add Treatments",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),

                  //total amount
                  _textfieldHeadtext(text: "Total Amount"),
                  SizedBox(height: 5),
                  CustomTextField(
                    controller: _totalAmountController,
                    showBorder: false,
                    hint: Text("Enter the Total Amount"),
                  ),
                  SizedBox(height: 10),

                  //discount amount
                  _textfieldHeadtext(text: "Discount Amount"),
                  SizedBox(height: 5),
                  CustomTextField(
                    controller: _discountAmountController,
                    showBorder: false,
                    hint: Text("Enter the Discount Amount"),
                  ),
                  SizedBox(height: 10),

                  _textfieldHeadtext(text: "Payment Option"),
                  SizedBox(height: 5),
                  CustomRadioButton(
                    options: ['Cash', 'Card', 'UPI'],
                    onChanged: (value) {
                      setState(() {
                        radioValue = value;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  //advance amount
                  _textfieldHeadtext(text: "Advance Amount"),
                  SizedBox(height: 5),
                  CustomTextField(
                    controller: _advanceAmountController,
                    showBorder: false,
                    hint: Text("Enter the Advance Amount"),
                  ),
                  SizedBox(height: 10),
                  //balance amount
                  _textfieldHeadtext(text: "Balance Amount"),
                  SizedBox(height: 5),
                  CustomTextField(
                    controller: _balanceAmountController,
                    showBorder: false,
                    hint: Text("Enter the Balance Amount"),
                  ),
                  SizedBox(height: 10),
                  //choose date
                  _textfieldHeadtext(text: "Treatment Date"),
                  SizedBox(height: 5),
                  CustomTextField(
                    controller: _dateController,
                    showBorder: false,
                    isDate: true,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2050),
                    hint: Text("Enter the Date"),
                  ),
                  SizedBox(height: 10),
                  _textfieldHeadtext(text: "Treatment Time"),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: CommonDropdownButton<String>(
                          label: "Hour",
                          items: List.generate(
                            12,
                            (index) => "${index + 1}".padLeft(2, '0'),
                          ),
                          value: _hourController.text.isNotEmpty
                              ? _hourController.text
                              : null,
                          getLabel: (item) => item,
                          getValue: (item) => item,
                          controller: _hourController,
                          onChanged: (val) {
                            print("Selected hour: $val");
                          },
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: CommonDropdownButton<String>(
                          label: "Minutes",
                          items: List.generate(
                            60,
                            (index) => "$index".padLeft(2, '0'),
                          ),
                          value: _minuteController.text.isNotEmpty
                              ? _minuteController.text
                              : null,
                          getLabel: (item) => item,
                          getValue: (item) => item,
                          controller: _minuteController,
                          onChanged: (val) {
                            print("Selected minute: $val");
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  CustomButton(title: 'Save', onTap: submitForm),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void submitForm() {
    final treatmentProvider = Provider.of<TreatmentAddProvider>(
      context,
      listen: false,
    );

    List<int> maleCounts = treatmentProvider.treatment
        .map((t) => t.maleCount)
        .toList();
    List<int> femaleCounts = treatmentProvider.treatment
        .map((t) => t.femaleCount)
        .toList();
    List<int> treatmentIds = treatmentProvider.treatment
        .map((t) => t.treatmentId)
        .toList();

    String paymentOption = radioValue;

    String branchName = _branchController.text.trim();

    final appointment = PatientRegisterModel(
      name: _nameController.text.trim(),
      executive: "test",
      payment: paymentOption,
      phone: _whatsappController.text.trim(),
      address: _addressController.text.trim(),
      totalAmount: double.tryParse(_totalAmountController.text.trim()) ?? 0,
      discountAmount:
          double.tryParse(_discountAmountController.text.trim()) ?? 0,
      advanceAmount: double.tryParse(_advanceAmountController.text.trim()) ?? 0,
      balanceAmount: double.tryParse(_balanceAmountController.text.trim()) ?? 0,
      dateAndTime:
          "${_dateController.text.trim()} ${_hourController.text.trim()}:${_minuteController.text.trim()}",
      branch: int.parse(branchName),
      male: maleCounts,
      female: femaleCounts,
      treatments: treatmentIds,
    );
    Provider.of<PostPatientReigisterProvider>(
      context,
      listen: false,
    ).onPostPatientRegister(appointMent: appointment, context: context);
  }

  Text _textfieldHeadtext({required String text}) {
    return Text(text, style: AppTextStyles.heading3, textAlign: TextAlign.left);
  }
}
