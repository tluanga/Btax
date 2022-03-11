import 'package:btax/user/authencation/controller/auth_controller.dart';
import 'package:btax/user/authencation/controller/login_sceen_controller.dart';
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
        body: SafeArea(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 14.0, right: 14),
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                //  const Spacer(),
                Flexible(
                  child: Container(
                    color: Colors.grey.shade100,
                    child: TextFormField(
                      controller: _name,
                      enableSuggestions: true,
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (value) {},
                      decoration: const InputDecoration(
                        hintText: 'Name',
                        hintStyle: TextStyle(color: Colors.black54),
                        //  icon: const Icon(Icons.email_outlined, size: 24),
                        //  alignLabelWithHint: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black54),
                          //borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'enter your name';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Flexible(
                  child: Container(
                    color: Colors.grey.shade100,
                    child: TextFormField(
                      controller: _bio,
                      maxLines: 3,
                      minLines: 1,
                      enableSuggestions: true,
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (value) {},
                      decoration: const InputDecoration(
                        hintText: 'Bio',
                        hintStyle: TextStyle(color: Colors.black54),
                        //  icon: const Icon(Icons.email_outlined, size: 24),
                        //  alignLabelWithHint: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black54),
                          //borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Invalid bio!';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Flexible(
                  child: Container(
                    color: Colors.grey.shade100,
                    child: TextFormField(
                      controller: _email,
                      enableSuggestions: true,
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (value) {},
                      decoration: const InputDecoration(
                        hintText: 'Email address',
                        hintStyle: TextStyle(color: Colors.black54),
                        //  icon: const Icon(Icons.email_outlined, size: 24),
                        //  alignLabelWithHint: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black54),
                          //borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return 'Invalid email!';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Flexible(
                  child: Container(
                    color: Colors.grey.shade100,
                    child: TextFormField(
                      obscureText: true,
                      controller: _password,
                      enableSuggestions: true,
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (value) {},
                      decoration: const InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.black54),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black54),
                        ),
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
                const SizedBox(
                  height: 10,
                ),
                Flexible(
                  child: Container(
                    color: Colors.grey.shade100,
                    child: TextFormField(
                      obscureText: true,
                      // controller: _name,
                      //  autocorrect: true,
                      enableSuggestions: true,
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (value) {},
                      decoration: const InputDecoration(
                        hintText: 'Confirm Password',
                        hintStyle: TextStyle(color: Colors.black54),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black54),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty || value != _password.text) {
                          return 'password not match';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                isLoading.value
                    ? const CircularProgressIndicator()
                    : MaterialButton(
                        color: Colors.grey.shade600,
                        onPressed: (() {
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
                                .whenComplete(() => isLoading.value = false);
                          }
                        }),
                        child: const SizedBox(
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 20),
                            ),
                          ),
                        ),
                        textColor: Colors.white,
                        //    textTheme: ButtonTextTheme.primary,
                        minWidth: 100,
                        padding: const EdgeInsets.all(18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                          // side: BorderSide(color: Colors.blue.shade700),
                        ),
                      ),
                TextButton(
                    onPressed: () {
                      ref.read(loginScreenController.state).state =
                          const LoginScreen();
                    },
                    child: const Text('Already have an account?')),
                // const Spacer()
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
