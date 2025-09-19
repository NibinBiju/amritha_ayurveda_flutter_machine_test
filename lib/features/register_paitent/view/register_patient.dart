import 'package:amritha_ayurveda/common/helper/custom_button.dart';
import 'package:amritha_ayurveda/common/helper/custom_radio_button.dart';
import 'package:amritha_ayurveda/common/helper/custom_textfield.dart';
import 'package:amritha_ayurveda/core/configs/app_colors.dart';
import 'package:amritha_ayurveda/core/configs/app_images.dart';
import 'package:amritha_ayurveda/core/configs/app_text_styles.dart';
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
  Widget build(BuildContext context) {
    var treatmentProvider = Provider.of<TreatmentAddProvider>(context);
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
                  _dropdownField('Location', [
                    "Ernakulam",
                    "Kozhikode",
                  ], controller: _locationController),
                  SizedBox(height: 10),

                  _textfieldHeadtext(text: "Branch"),
                  SizedBox(height: 5),
                  _dropdownField('Branch', [
                    "Branch 1",
                    "Branch 2",
                  ], controller: _branchController),
                  SizedBox(height: 10),

                  _textfieldHeadtext(text: "Treatment"),
                  SizedBox(height: 5),
                  Column(
                    children: List.generate(
                      treatmentProvider.treatment.length,
                      (index) => TreatmentCard(
                        index: index,
                        title: treatmentProvider.treatment[index].treatMentName,
                        maleCount: treatmentProvider.treatment[index].maleCount,
                        femaleCount:
                            treatmentProvider.treatment[index].femaleCount,
                        onRemove: () => treatmentProvider.removeItem(index),
                        onEdit: () => print("Edit pressed"),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showTreatmentBottomSheet(
                        context: context,
                        treatments: ["Treatment 1"],
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
                  CustomRadioButton(options: ['Cash', 'Card', 'UPI']),
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
                        child: _dropdownField(
                          'Hour',
                          List.generate(
                            12,
                            (index) =>
                                "${index + 1}".toString().padLeft(2, '0'),
                          ),
                          controller: _hourController,
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: _dropdownField(
                          'Minutes',
                          List.generate(
                            60,
                            (index) => "$index".toString().padLeft(2, '0'),
                          ),
                          controller: _minuteController,
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

    // Collect male/female counts and treatment IDs from provider
    List<int> maleCounts = treatmentProvider.treatment
        .map((t) => t.maleCount)
        .toList();
    List<int> femaleCounts = treatmentProvider.treatment
        .map((t) => t.femaleCount)
        .toList();
    // List<int> treatmentIds = treatmentProvider.treatment
    //     .map((t) => t.id)
    //     .toList();

    // // Example: Get selected payment option from your radio button logic
    // String paymentOption = treatmentProvider.selectedPayment ?? "Cash";

    // final appointment = Appointment(
    //   name: _nameController.text.trim(),
    //   executive: "", // Fill as needed
    //   payment: paymentOption,
    //   phone: _whatsappController.text.trim(),
    //   address: _addressController.text.trim(),
    //   totalAmount: double.tryParse(_totalAmountController.text.trim()) ?? 0,
    //   discountAmount:
    //       double.tryParse(_discountAmountController.text.trim()) ?? 0,
    //   advanceAmount: double.tryParse(_advanceAmountController.text.trim()) ?? 0,
    //   balanceAmount: double.tryParse(_balanceAmountController.text.trim()) ?? 0,
    //   dateAndTime:
    //       "${_dateController.text.trim()} ${_hourController.text.trim()}:${_minuteController.text.trim()}",
    //   branch: _branchController.text.trim(),
    //   male: maleCounts,
    //   female: femaleCounts,
    //   treatments: treatmentIds,
    // );

    // Example: Print or send to provider/backend
    // print(appointment.toJson());

    // You can call your provider or API here
    // await treatmentProvider.saveAppointment(appointment);
  }

  Widget _dropdownField(
    String label,
    List<String> items, {
    TextEditingController? controller,
  }) {
    String? selectedValue = items.contains(controller?.text)
        ? controller?.text
        : null;

    return DropdownButtonFormField<String>(
      style: TextStyle(color: Colors.black, fontSize: 16),
      dropdownColor: AppColors.background,
      decoration: InputDecoration(
        fillColor: AppColors.background,
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      initialValue: selectedValue,

      items: items
          .map(
            (e) => DropdownMenuItem<String>(
              value: e,
              child: Text(
                e.split(':').first.toString(),
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
          )
          .toList(),
      onChanged: (val) {
        if (controller != null && val != null) {
          controller.text = val;
        }
        setState(() {});
      },
    );
  }
}

Text _textfieldHeadtext({required String text}) {
  return Text(text, style: AppTextStyles.heading3, textAlign: TextAlign.left);
}
