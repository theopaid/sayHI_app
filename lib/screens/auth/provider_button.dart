import 'package:flutter/material.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';
import 'package:sayHI/screens/background_painter.dart';

class ProviderButton extends StatefulWidget {
  final String signInType;
  final Color color;

  const ProviderButton({Key key, this.signInType, this.color}) : super(key: key);
  @override
  _ProviderButtonState createState() => _ProviderButtonState();
}

class _ProviderButtonState extends State<ProviderButton> {
  @override
  Widget build(BuildContext context) {
    switch (widget.signInType) {
      case 'google':
        return InkWell(
          onTap: () => context.signInWithGoogle(),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(12.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: widget.color,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black26,
              ),
            ),
            child: LitAuthIcon.google(
              size: const Size(30, 30),
            ),
          ),
        );
        break;
      case 'twitter':
        return InkWell(
          onTap: () => context.signInWithTwitter(),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(12.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.color,
              border: Border.all(
                color: Colors.black26,
              ),
            ),
            child: Transform.scale(
              scale: 1.5,
              child: LitAuthIcon.twitter(
                size: const Size(30, 30),
              ),
            ),
          ),
        );
        break;
      default:
        return const Text('error');
    }
  }
}
