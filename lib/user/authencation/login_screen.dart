import 'package:btax/common/widget_properties/textStyle.dart';
import 'package:btax/user/authencation/controller/auth_controller.dart';
import 'package:btax/user/authencation/controller/login_sceen_controller.dart';
import 'package:btax/user/authencation/signup_screen.dart';
import 'package:btax/user/authencation/widget/auth_button.dart';
import 'package:btax/user/authencation/widget/terms_and_condition_button.dart';
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
          padding: const EdgeInsets.only(left: 14.0, right: 14),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                ),

                Icon(
                  CupertinoIcons.person_alt_circle,
                  size: 120,
                  color: Colors.grey.shade700,
                ),

                const Spacer(),
// Email TextField ------------------------------------------------------------
                TextFormField(
                  controller: _email,
                  enableSuggestions: true,
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (value) {},
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1.5, color: Colors.grey.shade700),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1.5, color: Colors.grey.shade700),
                    ),
                    labelText: 'Email',
                    isDense: true,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  ),
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Invalid email!';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
// Password TextField -------------------------------------------------
                SizedBox(
                  child: Flexible(
                    child: TextFormField(
                      obscureText: true,
                      controller: _password,
                      enableSuggestions: true,
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (value) {},
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1.5, color: Colors.grey.shade700),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1.5, color: Colors.grey.shade700),
                        ),
                        labelText: 'Password',
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 12),
                      ),
                      validator: (value) {
                        if (value!.isEmpty || value.length < 6) {
                          return 'password  is too short!';
                        }
                        return null;
                      },
                    ),
                  ),
                ),

                Flexible(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.014,
                  ),
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
                                .whenComplete(() => isLoading.value = false);
                          }
                        },
                        child: authButton('Login', width: 140)),
                Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.03,
                        bottom: MediaQuery.of(context).size.height * 0.004),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'Don\'t have an account?',
                      style:
                          primaryTextStyle(weight: FontWeight.w600, size: 18),
                    )),
// Sign Up Button ----------------------------------
                GestureDetector(
                  onTap: () {
                    ref.read(loginScreenController.state).state =
                        const SignUpScreen();
                  },
                  child: authButton(
                    'Sign Up',
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.002,
                  ),
                ),
// Continue As Guest Button --------------------------
                authButton(
                  'Continue as Guest',
                ),
                const Spacer(),
// TermsAndConditionButton() ----------------------
                Flexible(
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.bottomCenter,
                      child: const TermsAndConditonButton()),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
