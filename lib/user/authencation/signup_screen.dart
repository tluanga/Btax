import 'package:btax/common/widget_properties/input_border.dart';
import 'package:btax/common/widget_properties/textStyle.dart';
import 'package:btax/user/authencation/controller/auth_controller.dart';
import 'package:btax/user/authencation/controller/login_sceen_controller.dart';
import 'package:btax/user/authencation/widget/auth_button.dart';
import 'package:btax/user/authencation/widget/terms_and_condition_button.dart';
import 'package:btax/user/authencation/widget/text_field_label.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
//import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'login_screen.dart';

class SignUpScreen extends HookConsumerWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<FormState> _formKey = GlobalKey();
    final _email = TextEditingController();
    final _password = TextEditingController();
    final _name = TextEditingController();
    //final _phone = TextEditingController();
    final _bio = TextEditingController();
    final isLoading = useState<bool>(false);
    final _auth = ref.watch(authenticationProvider);

    return Scaffold(
// TermsAndConditionButton() ----------------------
        bottomSheet: Container(
            height: 40,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomCenter,
            child: const TermsAndConditonButton()),
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                            child: Text('Create an account',
                                style: boldTextStyle(
                                    size: 26, color: Colors.teal[600]))),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      textFieldLabel('Name'),
                      TextFormField(
                        controller: _name,
                        enableSuggestions: true,
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (value) {},
                        decoration: textFieldInputDecoration('Name'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'enter your name';
                          }
                          return null;
                        },
                      ),

                      textFieldLabel('Email'),
                      TextFormField(
                        controller: _email,
                        enableSuggestions: true,
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (value) {},
                        decoration: textFieldInputDecoration('Email'),
                        validator: (value) {
                          if (value!.isEmpty || !value.contains('@')) {
                            return 'Invalid email!';
                          }
                          return null;
                        },
                      ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      textFieldLabel('Password'),
                      TextFormField(
                        obscureText: true,
                        controller: _password,
                        enableSuggestions: true,
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (value) {},
                        decoration: textFieldInputDecoration('Password'),
                        validator: (value) {
                          if (value!.isEmpty || value.length < 6) {
                            return 'password  is too short!';
                          }
                          return null;
                        },
                      ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      textFieldLabel('Confirm Password'),
                      TextFormField(
                        obscureText: true,
                        enableSuggestions: true,
                        onSaved: (value) {},
                        decoration:
                            textFieldInputDecoration('Confirm Password'),
                        validator: (value) {
                          if (value!.isEmpty || value != _password.text) {
                            return 'password not match';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      isLoading.value
                          ? const CircularProgressIndicator()
                          : GestureDetector(
                              onTap: (() {
                                if (_formKey.currentState!.validate()) {
                                  isLoading.value = true;
                                  print('valid');
                                  _auth
                                      .signUpWithEmailAndPassword(
                                          _email.text,
                                          _password.text,
                                          _name.text,
                                          _bio.text,
                                          context)
                                      .whenComplete(
                                          () => isLoading.value = false);
                                }
                              }),
                              child: authButton(
                                'Sign Up',
                                isMainButton: true,
                              ),
                            ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      GestureDetector(
                        onTap: () {
                          ref.read(loginScreenController.state).state =
                              const LoginScreen();
                        },
                        child: authButton(
                          'Already have an account? Login in',
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      GestureDetector(
                        onTap: () {
                          _auth.anonymousSignIn(context);
                        },
                        child: authButton(
                          'Continue as Guest',
                        ),
                      ),
                      // TextButton(
                      //     onPressed: () {
                      //       ref.read(loginScreenController.state).state =
                      //           const LoginScreen();
                      //     },
                      //     child: const Text('Already have an account?')),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
