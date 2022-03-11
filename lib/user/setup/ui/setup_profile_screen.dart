import 'package:btax/common/widget_properties/input_border.dart';
import 'package:btax/common/widget_properties/textStyle.dart';
import 'package:btax/user/authencation/auth_checker.dart';
import 'package:btax/user/authencation/controller/auth_controller.dart';
import 'package:btax/user/authencation/controller/login_screen_controller.dart';
import 'package:btax/user/authencation/login_screen.dart';
import 'package:btax/user/authencation/signup_screen.dart';
import 'package:btax/user/authencation/widget/auth_button.dart';
import 'package:btax/user/authencation/widget/terms_and_condition_button.dart';
import 'package:btax/user/authencation/widget/text_field_label.dart';
import 'package:btax/user/authencation/widget/text_form_field.dart';
import 'package:btax/user/controller/user_controller_provider.dart';
import 'package:btax/user/model/user_model.dart';
import 'package:btax/user/setup/ui/widget/textformfield_dropdown_button.dart';
import 'package:btax/user/setup/user_details_controller.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SetupScreen extends HookConsumerWidget {
  const SetupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<FormState> _formKey = GlobalKey();
    final _authState = ref.watch(authStateControllerProvider);
    final isLoadingProcress = useState<bool>(false);

    final _auth = ref.watch(authenticationProvider);
    final isloading = useState<bool>(false);
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                            child: Text('Setup your account',
                                style: boldTextStyle(
                                    size: 26, color: Colors.teal[600]))),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 6, right: 6),
                        width: MediaQuery.of(context).size.width,
                        child: Text('Personal Details',
                            style: boldTextStyle(color: Colors.teal[600])),
                      ),
//First Name TextField ------------------------------------------------------------
                      textFormField('First Name', userFirstNameController),

//Last Name TextField ------------------------------------------------------------
                      textFormField('Last Name', userLastNameController),

// Email TextField ------------------------------------------------------------
                      textFormField('Email', userEmailController),

// Address TextField ------------------------------------------------------------
                      textFormField('Address', userAddressController),
// Phone TextField ------------------------------------------------------------
                      textFormField('Phone No', userPhoneController),
//Choose ID for verification -----------------
                      textFormFieldDropdownButton(
                        idType,
                        'Choose ID for verification',
                        userIDVerificatinTypeController,
                        '',
                        'Choose ID for verification',
                      ),
//Upload Id -----------------

                      Padding(
                        padding: const EdgeInsets.only(top: 14),
                        child: authButton('Upload Document',
                            isMainButton: true,
                            height: 40,
                            color: Colors.grey.shade300,
                            texcolor: Colors.grey.shade600),
                      ),
                      Container(
                        padding:
                            const EdgeInsets.only(left: 6, right: 6, top: 20),
                        width: MediaQuery.of(context).size.width,
                        child: Text('Business Details',
                            style: boldTextStyle(color: Colors.teal[600])),
                      ),
// Business Name TextField ------------------------------------------------------------
                      textFormField('Sole Trader/Business Name',
                          userBusinessNameController),
// Phone TextField ------------------------------------------------------------
                      textFormField('ABN No', userABNNoController, isInt: true),
//Choose ID for verification -----------------
                      textFormFieldDropdownButton(
                        gstAccountingMethod,
                        'GST Accounting Method',
                        userIDVerificatinTypeController,
                        '',
                        'Select GST Accounting Method',
                      ),
                      const SizedBox(
                        height: 80,
                      ),

                      ///---
                    ]),
              ),
            ),
          ),
        ),
      ),
      // TermsAndConditionButton() ----------------------
      bottomSheet: Container(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
          color: Colors.transparent,
          height: 48,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.bottomCenter,
          child: isLoadingProcress.value
              ? const Center(child: CircularProgressIndicator())
              : GestureDetector(
                  onTap: () {
                    print('asdasd====' + userIDVerificatinTypeController.text);
                    if (_formKey.currentState!.validate()) {
                      // _formKey.currentState.save();
                      isLoadingProcress.value = true;

                      _auth
                          .uploadUserProfile(UserModel(
                              dateOfRegistration: DateTime.now().toString(),
                              userEmail: userEmailController.text,
                              userId: _authState.value!.uid,
                              userFirstName: userFirstNameController.text,
                              userLastName: userLastNameController.text,
                              userPhone: userPhoneController.text,
                              userAddress: userAddressController.text,
                              userIDVerificatinType:
                                  userIDVerificatinTypeController.text,
                              userBusinessName: userBusinessNameController.text,
                              userBusinessType: userBusinessTypeController.text,
                              userTotalSalesAmount: 0,
                              doesSalesIncledeGST: false,
                              userGSTOnSales: '',
                              userGSTOnPurchases: '',
                              userABNNo: userABNNoController.text,
                              userGSTAcMethod: userGSTAcMethodController.text,
                              doesUserHaveEmployees: false,
                              totalSalryOfEmployees: 0,
                              totalAmountWidthdraw: 0,
                              userDOB: DateTime.now().toString(),
                              payableAmount: 0,
                              paymentMethod: ''))
                          .whenComplete(() {
                        clearTextController();
                        isLoadingProcress.value = false;
                        ref.read(setupCompleteController.state).state = true;
                        ref.read(loginScreenController.state).state =
                            const LoginScreen();
                      });
                    }
                  },
                  child: authButton(
                    'Confirm',
                    isMainButton: true,
                  ))),
    );
  }
}
