import 'package:flutter/material.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';
import 'package:sayHI/config/palette.dart';
import 'package:sayHI/screens/auth/decoration_functions.dart';
import 'package:sayHI/screens/auth/provider_button.dart';
import 'package:sayHI/screens/auth/sign_in_up_bar.dart';
import 'package:sayHI/screens/auth/title.dart';

class SignIn extends StatelessWidget {
  const SignIn({
    Key key,
    @required this.onRegisterClicked
  }) : super(key: key);

  final VoidCallback onRegisterClicked;

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
            children: [
              Expanded(
                flex: 3,
                child: Align(alignment: Alignment.centerLeft,
                child: LoginTitle(
                  title: 'Welcome\nBack',
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
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: EmailTextFormField(
                          decoration: signInInputDecoration(
                            hintText: 'email'
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: PasswordTextFormField(
                          decoration: signInInputDecoration(
                            hintText: 'password'
                          ),
                        ),
                      ),
                      SignInBar(
                        isLoading: isSubmitting,
                        label: 'Sign in',
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          context.signInWithEmailAndPassword();
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
                        'or sign in with',
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
                          ),
                          ProviderButton(
                            signInType: 'twitter',
                          ),
                        ],
                      ),
                      const Spacer(),
                      InkWell(
                        splashColor: Colors.white,
                        onTap: () {
                          onRegisterClicked?.call();
                        },
                        child: RichText(
                          text: const TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(color: Colors.black54),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'SIGN UP',
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
