import 'package:flutter/material.dart';
import 'package:portfolio/utils/app_theme.dart';

class LandingSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width,
      decoration: const BoxDecoration(color: AppTheme.lightBlack),
      child: Stack(children: <Widget>[
        Center(
          child: Row(
            children: [
              SizedBox(width: size.width * 0.20),
              RichText(
                  text: TextSpan(
                      text: "Xavier ",
                      style: TextStyle(color: AppTheme.white, fontSize: 40),
                      children: <TextSpan>[
                    TextSpan(
                        text: "Chrétien",
                        style:
                            TextStyle(color: AppTheme.orangeRed, fontSize: 40)),
                    TextSpan(
                        text: "\nÉtudiant en ",
                        style: TextStyle(color: AppTheme.white, fontSize: 40)),
                    TextSpan(
                        text: "génie logiciel",
                        style:
                            TextStyle(color: AppTheme.orangeRed, fontSize: 40))
                  ]))
            ],
          ),
        ),
      ]),
    );
  }
}
