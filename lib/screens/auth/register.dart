import 'package:flutter/material.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';
import 'package:sayHI/screens/auth/provider_button.dart';

import 'decoration_functions.dart';
import 'sign_in_up_bar.dart';
import 'title.dart';

class Register extends StatelessWidget {
  const Register({Key key, this.onSignInPressed}) : super(key: key);

  final VoidCallback onSignInPressed;

  @override
  Widget build(BuildContext context) {
    final isSubmitting = context.isSubmitting();
    return SignInForm(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
              currentFocus.focusedChild.unfocus();
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(
                flex: 3,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: LoginTitle(
                    title: 'Create\nAccount',
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: SingleChildScrollView(
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: EmailTextFormField(
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                            decoration: registerInputDecoration(hintText: 'email')),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: PasswordTextFormField(
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                          decoration: registerInputDecoration(hintText: 'password'),
                        ),
                      ),
                      SignUpBar(
                        label: 'Sign up',
                        isLoading: isSubmitting,
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          context.registerWithEmailAndPassword();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      const Text(
                        'or sign up with',
                        style: TextStyle(color: Colors.black54),
                      ),
                      const SizedBox(
                        height: 24.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ProviderButton(
                            signInType: 'google',
                            color: Colors.white,
                          ),
                          ProviderButton(
                            signInType: 'twitter',
                            color: Colors.white,
                          ),
                        ],
                      ),
                      const Spacer(),
                      InkWell(
                        splashColor: Colors.white,
                        onTap: () {
                          onSignInPressed?.call();
                        },
                        child: RichText(
                          text: const TextSpan(
                              text: "Already have an account? ",
                              style: TextStyle(color: Colors.black54),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'SIGN IN',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                  ),
                                )
                              ]
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}