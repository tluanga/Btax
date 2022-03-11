import 'package:btax/common/widget_properties/input_border.dart';
import 'package:btax/common/widget_properties/textStyle.dart';
import 'package:btax/user/authencation/controller/auth_controller.dart';
import 'package:btax/user/authencation/controller/login_sceen_controller.dart';
import 'package:btax/user/authencation/signup_screen.dart';
import 'package:btax/user/authencation/widget/auth_button.dart';
import 'package:btax/user/authencation/widget/terms_and_condition_button.dart';
import 'package:btax/user/authencation/widget/text_field_label.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
//import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<FormState> _formKey = GlobalKey();
    final _email = TextEditingController();
    final _password = TextEditingController();
    // final _name = TextEditingController();
    //final _phone = TextEditingController();
    // final _bio = TextEditingController();
    final isLoading = useState<bool>(false);

    final _auth = ref.watch(authenticationProvider);

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
                            child: Text('Hi, Welcome to My App',
                                style: boldTextStyle(
                                    size: 26, color: Colors.teal[600]))),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      // Email TextField ------------------------------------------------------------
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

                      // Password TextField -------------------------------------------------
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

                      const SizedBox(
                        height: 30,
                      ),
                      // Login Button -------------------------
                      isLoading.value
                          ? const CircularProgressIndicator()
                          : GestureDetector(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  isLoading.value = true;
                                  print('valid');
                                  _auth
                                      .signInWithEmailAndPassword(
                                          _email.text, _password.text, context)
                                      .whenComplete(
                                          () => isLoading.value = false);
                                }
                              },
                              child: authButton('Login', isMainButton: true)),
                      Container(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.1,
                              bottom:
                                  MediaQuery.of(context).size.height * 0.004),
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Text(
                              'Don\'t have an account?',
                              style: primaryTextStyle(
                                  weight: FontWeight.w600,
                                  size: 16,
                                  color: Colors.teal),
                            ),
                          )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Divider(
                        height: 2,
                        color: Colors.grey.shade400,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      // Sign Up Button ----------------------------------
                      GestureDetector(
                        onTap: () {
                          ref.read(loginScreenController.state).state =
                              const SignUpScreen();
                        },
                        child: authButton('Sign Up',
                            isMainButton: false, color: Colors.transparent),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      // Continue As Guest Button --------------------------
                      GestureDetector(
                        onTap: () {
                          _auth.anonymousSignIn(context);
                        },
                        child: authButton(
                          'Continue as Guest',
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ),
      // TermsAndConditionButton() ----------------------
      bottomSheet: Container(
          height: 40,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.bottomCenter,
          child: const TermsAndConditonButton()),
    );
  }
}
