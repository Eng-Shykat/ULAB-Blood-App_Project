import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulab_blood_bank/common/dropdown_items.dart';
import 'package:ulab_blood_bank/data/model/user_data_model.dart';
import 'package:ulab_blood_bank/repository/auth_repository.dart';
import 'package:ulab_blood_bank/res/dimens/common_sizing.dart';

import '../../../res/colors/app_colors.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final fullNameController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final lastDonationDateController = TextEditingController();

  bool isAgree = false;
  bool isAccepted = false;

  final AuthRepository _authRepository = AuthRepository();

  bool isValid(String gender, String disease, String bloodGroup) {
    return gender != genders.first &&
        disease != decisionBool.first &&
        bloodGroup != bloodGroups.first;
  }

  @override
  void dispose() {
    fullNameController.dispose();
    dateOfBirthController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    lastDonationDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "SIGN UP",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: AppColors.primaryPalette,
                  fontFamily: 'RobotoSlab',
                ),
              ),
              verticalGap12,
              const Text(
                "Enter Your Personal Information",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  fontFamily: 'RobotoSlab',
                ),
              ),
              verticalGap8,
              const Text(
                "Please complete the form with authentic information.",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  fontFamily: 'RobotoSlab',
                ),
              ),
              verticalGap36,
              Text(
                "Full Name",
                style: getLabelStyle(),
              ),
              verticalGap8,
              TextField(
                controller: fullNameController,
                decoration: getInputDecoration("Full Name"),
                keyboardType: TextInputType.emailAddress,
                style: getLabelStyle(),
              ),
              verticalGap8,
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Gender",
                      style: getLabelStyle(),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Date of birth",
                      style: getLabelStyle(),
                    ),
                  ),
                ],
              ),
              verticalGap8,
              Row(
                children: [
                  Expanded(
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                        color: AppColors.inputBG,
                      ),
                      child: DropdownButton<String>(
                        style: getLabelStyle(),
                        underline: const SizedBox(),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                        ),
                        isExpanded: true,
                        value: ref.watch(genderProvider),
                        onChanged: (String? value) {
                          ref.read(genderProvider.notifier).state = value!;
                        },
                        items: genders
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  horizontalGap12,
                  Expanded(
                    child: TextField(
                      controller: dateOfBirthController,
                      decoration: getInputDecoration("MM/DD/YYYY"),
                      keyboardType: TextInputType.datetime,
                      style: getLabelStyle(),
                    ),
                  ),
                ],
              ),
              verticalGap8,
              Text(
                "Password",
                style: getLabelStyle(),
              ),
              verticalGap8,
              TextField(
                controller: passwordController,
                obscureText: true,
                obscuringCharacter: "*",
                decoration: getInputDecoration("Password"),
                keyboardType: TextInputType.visiblePassword,
                style: getLabelStyle(),
              ),
              verticalGap8,
              Text(
                "Confirm Password",
                style: getLabelStyle(),
              ),
              verticalGap8,
              TextField(
                controller: confirmPasswordController,
                obscureText: true,
                obscuringCharacter: "*",
                decoration: getInputDecoration("Confirm Password"),
                keyboardType: TextInputType.visiblePassword,
                style: getLabelStyle(),
              ),
              verticalGap36,
              const Text(
                "Enter Your Contact Information",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  fontFamily: 'RobotoSlab',
                ),
              ),
              verticalGap8,
              const Text(
                "Please enter your current address and contact information.",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  fontFamily: 'RobotoSlab',
                ),
              ),
              verticalGap36,
              Text(
                "Email",
                style: getLabelStyle(),
              ),
              TextField(
                controller: emailController,
                decoration: getInputDecoration('Email'),
                keyboardType: TextInputType.emailAddress,
                style: getLabelStyle(),
              ),
              verticalGap8,
              Text(
                "Phone",
                style: getLabelStyle(),
              ),
              Row(
                children: [
                  DecoratedBox(
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      color: AppColors.inputBG,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "+880",
                        style: getLabelStyle(),
                      ),
                    ),
                  ),
                  horizontalGap16,
                  Expanded(
                    child: TextField(
                      controller: phoneController,
                      decoration: getInputDecoration('Contact Number'),
                      keyboardType: TextInputType.phone,
                      style: getLabelStyle(),
                    ),
                  )
                ],
              ),
              verticalGap8,
              Text(
                "Current Address",
                style: getLabelStyle(),
              ),
              SizedBox(
                height: 100,
                child: TextField(
                  controller: addressController,
                  decoration: getInputDecoration('Current Address'),
                  keyboardType: TextInputType.streetAddress,
                  style: getLabelStyle(),
                ),
              ),
              verticalGap36,
              const Text(
                "Enter Your Health Information",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  fontFamily: 'RobotoSlab',
                ),
              ),
              verticalGap8,
              const Text(
                "Enter your current blood details and health conditions.",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  fontFamily: 'RobotoSlab',
                ),
              ),
              verticalGap36,
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Blood Group",
                      style: getLabelStyle(),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Donated Before?",
                      style: getLabelStyle(),
                    ),
                  ),
                ],
              ),
              verticalGap8,
              Row(
                children: [
                  Expanded(
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                        color: AppColors.inputBG,
                      ),
                      child: DropdownButton<String>(
                        style: getLabelStyle(),
                        underline: const SizedBox(),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                        ),
                        isExpanded: true,
                        value: ref.watch(bloodGroupProvider),
                        onChanged: (String? value) {
                          ref.read(bloodGroupProvider.notifier).state = value!;
                        },
                        items: bloodGroups
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  horizontalGap12,
                  Expanded(
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                        color: AppColors.inputBG,
                      ),
                      child: DropdownButton<String>(
                        style: getLabelStyle(),
                        underline: const SizedBox(),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                        ),
                        isExpanded: true,
                        value: ref.watch(donatedBeforeProvider),
                        onChanged: (String? value) {
                          ref.read(donatedBeforeProvider.notifier).state =
                          value!;
                        },
                        items: decisionBool
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              verticalGap8,
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Blood Disease record?",
                      style: getLabelStyle(),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Last Donation Date",
                      style: getLabelStyle(),
                    ),
                  ),
                ],
              ),
              verticalGap8,
              Row(
                children: [
                  Expanded(
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                        color: AppColors.inputBG,
                      ),
                      child: DropdownButton<String>(
                        style: getLabelStyle(),
                        underline: const SizedBox(),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                        ),
                        isExpanded: true,
                        value: ref.watch(bloodDiseaseProvider),
                        onChanged: (String? value) {
                          ref.read(bloodDiseaseProvider.notifier).state =
                          value!;
                        },
                        items: decisionBool
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  horizontalGap12,
                  Expanded(
                    child: TextField(
                      controller: lastDonationDateController,
                      decoration: getInputDecoration("MM/DD/YYYY"),
                      keyboardType: TextInputType.datetime,
                      style: getLabelStyle(),
                    ),
                  ),
                ],
              ),
              verticalGap16,
              Row(
                children: [
                  Checkbox(
                    value: isAgree,
                    onChanged: (isTrue) {
                      setState(() {
                        isAgree = isTrue!;
                      });
                    },
                    fillColor:
                    MaterialStateProperty.all(AppColors.primaryPalette),
                    checkColor: Colors.white,
                  ),
                  Text(
                    "I want to be a donor",
                    style: getLabelStyle(),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: isAccepted,
                    onChanged: (isTrue) {
                      setState(() {
                        isAccepted = isTrue!;
                      });
                    },
                    fillColor:
                    MaterialStateProperty.all(AppColors.primaryPalette),
                    checkColor: Colors.white,
                  ),
                  Text(
                    "I agree with the terms and conditions",
                    style: getLabelStyle(),
                  ),
                ],
              ),
              Text(
                "By clicking “ACCEPT” button you are bound to follow all the rules of our application.  Misuse of this application may cancel your account permanently and depending on the usage authority can take any legal actions.",
                style: getLabelStyle(),
                textAlign: TextAlign.justify,
              ),
              verticalGap36,
              ElevatedButton(
                onPressed: () {
                  final gender = ref.read(genderProvider);
                  final bloodGroup = ref.read(bloodGroupProvider);
                  final hasAnyBloodDiseaseBefore =
                  ref.read(bloodDiseaseProvider);

                  final fullName = fullNameController.text.toString().trim();
                  final dateOfBirth =
                  dateOfBirthController.text.toString().trim();
                  final password = passwordController.text.toString().trim();
                  final confirmPassword =
                  confirmPasswordController.text.toString().trim();
                  final email = emailController.text.toString().trim();
                  final phone = phoneController.text.toString().trim();
                  final address = addressController.text.toString().trim();
                  final lastDonationDate =
                  lastDonationDateController.text.toString().trim();

                  if (isAgree && isAccepted) {
                    if (fullName.isNotEmpty &&
                        dateOfBirth.isNotEmpty &&
                        password.isNotEmpty &&
                        confirmPassword.isNotEmpty &&
                        email.isNotEmpty &&
                        phone.isNotEmpty &&
                        address.isNotEmpty &&
                        lastDonationDate.isNotEmpty) {
                      if (password == confirmPassword) {
                        if (isValid(
                            gender, hasAnyBloodDiseaseBefore, bloodGroup)) {
                          _authRepository.register(
                            UserDataModel(
                              name: fullName,
                              email: email,
                              phone: phone,
                              gender: gender,
                              dateOfBirth: dateOfBirth,
                              address: address,
                              bloodGroup: bloodGroup,
                              donatedBefore:
                              ref.read(donatedBeforeProvider) == 'Yes'
                                  ? true
                                  : false,
                              lastDonatedDate: lastDonationDate,
                              hasAnyBloodDiseaseBefore:
                              hasAnyBloodDiseaseBefore == 'Yes'
                                  ? true
                                  : false,
                            ),
                            password,
                            context,
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Please fill up all the fields1"),
                            ),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Password doesn't match"),
                          ),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please fill up all the fields2"),
                        ),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content:
                        Text("Please agree with the terms and conditions"),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryPalette,
                  minimumSize: const Size(double.maxFinite, 58.0),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                ),
                child: const Text(
                  "SIGN UP",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              verticalGap36,
            ],
          ),
        ),
      ),
    );
  }

  TextStyle getLabelStyle() {
    return const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: Colors.black,
      fontFamily: 'RobotoSlab',
    );
  }

  InputDecoration getInputDecoration(String? hintText) {
    return InputDecoration(
      hintText: hintText ?? "",
      contentPadding:
      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      disabledBorder: InputBorder.none,
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
      ),
      fillColor: AppColors.inputBG,
      filled: true,
    );
  }
}
