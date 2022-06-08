import 'package:flutter/material.dart';

//MediaQuery.of(context).size.height * 0.8 -> 80%

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: const Color.fromARGB(230, 245, 65, 65),
      child: Container(
        margin: const EdgeInsets.all(32),
        child: Center(
          child:
              Image.asset('assets/images/pokeball.png', fit: BoxFit.fitWidth),
        ),
      ),
    );
  }
}
