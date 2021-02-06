import 'package:flutter/material.dart';
import 'package:login_fresh/login_fresh.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  //You have to create a list with the type of login's that you are going to import into your application

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(body: buildLoginFresh()));
  }

  LoginFresh buildLoginFresh() {
    List<LoginFreshTypeLoginModel> listLogin = [
      LoginFreshTypeLoginModel(
          callFunction: (BuildContext _buildContext) {
            // develop what they want the facebook to do when the user clicks
          },
          logo: TypeLogo.FACEBOOK),
      LoginFreshTypeLoginModel(
          callFunction: (BuildContext _buildContext) {
            // develop what they want the Google to do when the user clicks
          },
          logo: TypeLogo.GOOGLE),
      LoginFreshTypeLoginModel(
          callFunction: (BuildContext _buildContext) {
            print("APPLE");
            // develop what they want the Apple to do when the user clicks
          },
          logo: TypeLogo.APPLE),
      LoginFreshTypeLoginModel(
          callFunction: (BuildContext _buildContext) {
            Navigator.of(_buildContext).push(MaterialPageRoute(
              builder: (_buildContext) => widgetLoginFreshUserAndPassword(),
            ));
          },
          logo: TypeLogo.USER_PASSWORD),
    ];

    return LoginFresh(
      pathLogo: 'assets/logo.png',
      isExploreApp: true,
      functionExploreApp: () {
        // develop what they want the ExploreApp to do when the user clicks
      },
      isFooter: true,
      widgetFooter: this.widgetFooter(),
      typeLoginModel: listLogin,
      isSignUp: true,
      widgetSignUp: this.widgetLoginFreshSignUp(),
    );
  }

  Widget widgetLoginFreshUserAndPassword() {
    return LoginFreshUserAndPassword(
      callLogin: (BuildContext _context, Function isRequest, String user,
          String password) {
        isRequest(true);

        Future.delayed(Duration(seconds: 2), () {
          print('-------------- function call----------------');
          print(user);
          print(password);
          print('--------------   end call   ----------------');

          isRequest(false);
        });
      },
      logo: './assets/logo_head.png',
      isFooter: true,
      widgetFooter: this.widgetFooter(),
      isResetPassword: true,
      widgetResetPassword: this.widgetResetPassword(),
      isSignUp: true,
      signUp: this.widgetLoginFreshSignUp(),
    );
  }

  Widget widgetResetPassword() {
    return LoginFreshResetPassword(
      logo: 'assets/logo_head.png',
      funResetPassword:
          (BuildContext _context, Function isRequest, String email) {
        isRequest(true);

        Future.delayed(Duration(seconds: 2), () {
          print('-------------- function call----------------');
          print(email);
          print('--------------   end call   ----------------');
          isRequest(false);
        });
      },
      isFooter: true,
      widgetFooter: this.widgetFooter(),
    );
  }

  Widget widgetFooter() {
    return LoginFreshFooter(
      logo: 'assets/logo_footer.png',
      text: 'Power by',
      funFooterLogin: () {
        // develop what they want the footer to do when the user clicks
      },
    );
  }

  Widget widgetLoginFreshSignUp() {
    return LoginFreshSignUp(
        isFooter: true,
        widgetFooter: this.widgetFooter(),
        logo: 'assets/logo_head.png',
        funSignUp: (BuildContext _context, Function isRequest,
            SignUpModel signUpModel) {
          isRequest(true);

          print(signUpModel.email);
          print(signUpModel.password);
          print(signUpModel.repeatPassword);
          print(signUpModel.surname);
          print(signUpModel.name);

          isRequest(false);
        });
  }
}
