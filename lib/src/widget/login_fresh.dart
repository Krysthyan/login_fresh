import 'dart:io';

import 'package:flutter/material.dart';
import 'package:login_fresh/src/config/language.dart';
import 'package:login_fresh/src/service/type_login.dart';

class LoginFresh extends StatefulWidget {
  final Color backgroundColor;
  final Color cardColor;
  final Color textColor;

  final String pathLogo;

  final bool isExploreApp;
  final Function functionExploreApp;

  final bool isFooter;
  final Widget widgetFooter;

  final List<LoginFreshTypeLoginModel> typeLoginModel;

  final bool isSignUp;
  final Widget widgetSignUp;

  LoginFreshWords keyWord;

  LoginFresh(
      {@required this.pathLogo,
      this.typeLoginModel,
      this.isExploreApp,
      this.functionExploreApp,
      this.isSignUp,
      this.widgetSignUp,
      this.isFooter,
      this.widgetFooter,
      this.backgroundColor,
      this.cardColor,
      this.textColor,
      this.keyWord});

  @override
  _LoginFreshState createState() => _LoginFreshState();
}

class _LoginFreshState extends State<LoginFresh> {
  @override
  Widget build(BuildContext context) {
    widget.keyWord = widget.keyWord ?? LoginFreshWords();

    return Stack(
      children: [
        Container(
          color: widget.backgroundColor ?? Color(0xFFE7004C),
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.45,
              width: MediaQuery.of(context).size.width * 0.60,
              child: Center(
                child: Image.asset(
                  widget.pathLogo,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.55,
              width: MediaQuery.of(context).size.width,
              decoration: new BoxDecoration(
                  color: widget.cardColor ?? Color(0xFFF3F3F5),
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(50.0),
                    topRight: const Radius.circular(50.0),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(),
                  Column(
                    children: [
                      buildLoginWith(),
                      buildTypeLogin(context),
                      (widget.isExploreApp == null ||
                              widget.isExploreApp == false)
                          ? SizedBox()
                          : SizedBox(
                              height: 20,
                            ),
                      buildExploreApp(context),
                      (widget.isSignUp == null || widget.isSignUp == false)
                          ? SizedBox()
                          : buildSignUp(),
                    ],
                  ),
                  (widget.isFooter == null || widget.isFooter == false)
                      ? SizedBox()
                      : widget.widgetFooter
                ],
              ),
            ))
      ],
    );
  }

  GestureDetector buildSignUp() {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
                text: widget.keyWord.notAccount + '\n',
                style: TextStyle(
                    color: widget.textColor ?? Color(0xFF0F2E48),
                    fontWeight: FontWeight.normal,
                    fontSize: 15)),
            TextSpan(
                text: widget.keyWord.signUp,
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: widget.textColor ?? Color(0xFF0F2E48),
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
          ]),
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (_buildContext) => widget.widgetSignUp));
      },
    );
  }

  Widget buildExploreApp(BuildContext context) {
    return (widget.isExploreApp == null || widget.isExploreApp == false)
        ? SizedBox()
        : GestureDetector(
            onTap: widget.functionExploreApp,
            child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
                width: (widget.typeLoginModel.length > 3)
                    ? MediaQuery.of(context).size.width * 0.90
                    : MediaQuery.of(context).size.width * 0.80,
                child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Center(
                          child: Text(
                        widget.keyWord.exploreApp,
                        style: TextStyle(
                            color: widget.textColor ?? Color(0xFF0F2E48),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      )),
                    ))),
          );
  }

  SizedBox buildTypeLogin(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
      width: (widget.typeLoginModel.length > 3)
          ? MediaQuery.of(context).size.width * 0.90
          : MediaQuery.of(context).size.width * 0.80,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: this.getCardLogin()),
        ),
      ),
    );
  }

  Padding buildLoginWith() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(widget.keyWord.loginWith,
          style: TextStyle(
              color: widget.textColor ?? Color(0xFF0F2E48),
              fontSize: 16,
              fontWeight: FontWeight.bold)),
    );
  }

  List<Widget> getCardLogin() {
    List<Widget> list = [];

    for (LoginFreshTypeLoginModel tlm in widget.typeLoginModel) {
      list.add(GestureDetector(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image(
            image: ExactAssetImage(
              tlm.logo,
              package: (tlm.logo.contains('assets/images_login_fresh_34_/'))
                  ? 'login_fresh'
                  : null,
            ),
          ),
        ),
        onTap: () {
          tlm.callFunction(context);
        },
      ));
    }

    return list;
  }
}
