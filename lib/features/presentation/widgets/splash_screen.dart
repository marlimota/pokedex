import 'package:flutter/material.dart';

//MediaQuery.of(context).size.height * 0.8 -> 80%

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
            gradient: RadialGradient(
          radius: 0.6,
          colors: [
            Color.fromARGB(255, 200, 255, 228),
            Color.fromARGB(255, 0, 157, 120)
          ],
        )),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        //color: const Color.fromARGB(255, 67, 180, 99),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Container(
              margin: const EdgeInsets.all(32),
              child: Center(
                child: Image.asset('assets/images/logoB.png',
                    fit: BoxFit.fitWidth),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Pokedex',
                  style: TextStyle(
                    fontFamily: 'Monofett',
                    fontSize: 36,
                    color: Color.fromARGB(255, 229, 244, 242),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
