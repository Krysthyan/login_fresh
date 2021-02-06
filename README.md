# Login Fresh

LogiFresh helps you build a login easily with a friendly design, and very flexible for its construction.


## Installation
Follow the install instructions [here](https://pub.dev/packages/login_fresh/install)

## Use demo
  
First you need to download the github repository and run the following commands:
```bash
git clone https://github.com/Krysthyan/login_fresh.git
cd login_fresh/example
flutter run
```

![Capture 1](https://github.com/Krysthyan/login_fresh/blob/main/screenshot/image1.jpeg)         | ![Capture 2](https://github.com/Krysthyan/login_fresh/blob/main/screenshot/image2.jpeg)
:-------------------------:|:-------------------------:
![Capture 3](https://github.com/Krysthyan/login_fresh/blob/main/screenshot/image3.jpeg) |  ![Capture 4](https://github.com/Krysthyan/login_fresh/blob/main/screenshot/image4.jpeg)






## Languages docs

 - [English](https://pub.dev/packages/login_fresh#examples)
 - [Español](https://pub.dev/packages/login_fresh#ejemplos)

## Examples

You can view the complete demo in the [demo project](https://github.com/Krysthyan/login_fresh) 

### Complete code of the example
 ```dart
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
        home: Scaffold(  
            body: buildLoginFresh()));  
  }  
  
  LoginFresh buildLoginFresh() {  
  
    List<LoginFreshTypeLoginModel> listLogin = [  
      LoginFreshTypeLoginModel(  
          callFunction: (BuildContext _buildContext) {  
            // develop what they want the facebook to do when the user clicks  
  },  
          logo: TypeLogo.facebook),  
      LoginFreshTypeLoginModel(  
          callFunction: (BuildContext _buildContext) {  
            // develop what they want the Google to do when the user clicks  
  },  
          logo: TypeLogo.google),  
      LoginFreshTypeLoginModel(  
          callFunction: (BuildContext _buildContext) {  
            print("APPLE");  
            // develop what they want the Apple to do when the user clicks  
  },  
          logo: TypeLogo.apple),  
      LoginFreshTypeLoginModel(  
          callFunction: (BuildContext _buildContext) {  
            Navigator.of(_buildContext).push(MaterialPageRoute(  
              builder: (_buildContext) => widgetLoginFreshUserAndPassword(),  
            ));  
          },  
          logo: TypeLogo.userPassword),  
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
              callLogin: (BuildContext _context, Function isRequest,  
                  String user, String password) {  
                isRequest(true);  
  
                Future.delayed(Duration(seconds: 2), () {  
                  print('-------------- function call----------------');  
                  print(user);  
                  print(password);  
                  print('-------------- end call----------------');  
  
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
      funResetPassword: (BuildContext _context, Function isRequest, String email) {  
        isRequest(true);  
  
        Future.delayed(Duration(seconds: 2), () {  
          print('-------------- function call----------------');  
          print(email);  
          print('-------------- end call----------------');  
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
```


### Login with user and password

```dart
Widget widgetLoginFreshUserAndPassword() {  
  return LoginFreshUserAndPassword(  
            callLogin: (BuildContext _context, Function isRequest,  
                String user, String password) {  
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
```
The moment the user clicks the login button, `LoginFreshUserAndPassword` calls the function added in` callLogin`, it receives 4 parameters `BuildContext _context, Function isRequest, String user, String password`.
`isRequest` serves to add a loading in the part of the login button when it has been clicked, to enable this functionality within` callLogin` invoke said method with the true parameter `isRequest (true)`, after developing all the necessary code You must disable `isResquest (false)` so that the login button appears again (it is used for cases such as when the credentials were incorrect or when you query an API and have to wait until the response server), you can see the example where I have put a timer `(Future.delayed)`, where callLogin is called and after 2 seconds the login button is enabled again.
  
In `LogiFresh` you can include a footer widget, for this case you can use` LoginFreshFooter` or build yourself the widget you want to put in that part.

```dart
Widget widgetFooter() {  
  return LoginFreshFooter(  
    logo: 'assets/logo_footer.png',  
    text: 'Power by',  
    funFooterLogin: () {  
      // develop what they want the footer to do when the user clicks  
  },  
  );  
}
```
Additionally, you can enable the functionality of registering users, where you capture user information such as (email, name, surname, password, repeat password). To achieve that part you must put in the variable `isSignUp: true` and in` signUp` call the Widget `LoginFreshSingUp`. Below you can see an example of how to build the widget. This must be passed a function that receives 3 parameters `BuildContext _context, Function isRequest, SignUpModel signUpModel`, the isRequest method has the same functionality explained above,` signUpModel` contains the information of the inputs when the user clicks on the register button.

```dart
Widget widgetLoginFreshSignUp() {  
  return LoginFreshSignUp(  
    isFooter: true,  
      widgetFooter: this.widgetFooter(),  
      logo: 'assets/logo_head.png',  
      funSignUp: (BuildContext _context, Function isRequest, SignUpModel signUpModel) {  
        isRequest(true);  
  
        print(signUpModel.email);  
	print(signUpModel.password);  
	print(signUpModel.repeatPassword);  
	print(signUpModel.surname);  
	print(signUpModel.name);  
  
        isRequest(false);  
      });  
}
```
  
Finally we have the widget `LoginFreshResetPassword`, it serves to give the user the functionality to request a password change from the email. In the return function of this widget you must add 3 parameters `BuildContext _context, Function isRequest, String email`, isRequest has the functionality explained above and email is the string that the widget returns.
```dart
Widget widgetResetPassword() {  
  return LoginFreshResetPassword(  
    logo: 'assets/logo_head.png',  
    funResetPassword: (BuildContext _context, Function isRequest, String email) {  
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
```

  
In parameters of each widget there are some that are options but that help to personalize your login. The functionality of each is explained below:
 - `logo` -> this parameter is to enter the url of the image that we want to put in our login
 - `textColor` -> the texts set in the login you can specify the color, for example` Color (0xFFE7004C) ` 
 - `backgroundColor` -> It is the customization of the main login color, you can specify the color you want as for example` Color (0xFFE7004C) ` 
 - `loginFreshWords` -> It is a class where you can specify or customize the strings that are in your login, for example` LoginFresWords (login: 'Login fesh', signUp: 'Sign Up Fresh', ...) `


### Login with social networks
LoginFresh gives you the functionality to add various types of login, the same ones that you can program them as you wish, below I present an example and an explanation of how it works.

```dart
LoginFresh buildLoginFresh() {  
  List<LoginFreshTypeLoginModel> listLogin = [  
    LoginFreshTypeLoginModel(  
        callFunction: (BuildContext _buildContext) {  
          // develop what they want the facebook to do when the user clicks  
  },  
        logo: TypeLogo.facebook),  
    LoginFreshTypeLoginModel(  
        callFunction: (BuildContext _buildContext) {  
          // develop what they want the Google to do when the user clicks  
  },  
        logo: TypeLogo.google),  
    LoginFreshTypeLoginModel(  
        callFunction: (BuildContext _buildContext) {  
          print("APPLE");  
          // develop what they want the Apple to do when the user clicks  
  },  
        logo: TypeLogo.apple),  
    LoginFreshTypeLoginModel(  
        callFunction: (BuildContext _buildContext) {  
          Navigator.of(_buildContext).push(MaterialPageRoute(  
            builder: (_buildContext) => widgetLoginFreshUserAndPassword(),  
          ));  
        },  
        logo: TypeLogo.userPassword),  
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
```
  
The first thing we must do to create our `LoginFresh` is create a list of the types of login's that we will have in our application. Next I explain what is `LoginFreshTypeLoginModel`
```dart
LoginFreshTypeLoginModel(  
        callFunction: (BuildContext _buildContext) {  
          // develop what they want the facebook to do when the user clicks  
  },  
        logo: TypeLogo.facebook),
```
There are two parameters `callFunction, logo`, the first is the function that will be executed when the user clicks that type of login, you can program your code as for example if you want to build a login for` Facebook` within this you do all the functionality and import the necessary libraries. And in addition to this there is the `logo` parameter, this is used to use the` LoginFresh` logos but you can put the logo you want, `logo` is a string where you can put the path of where your image is to put.

  
Within this you can also add the user login and password, like this in the following example `widgetLoginFreshUserAndPassword ()` is a function that is specified previously, where it is explained how to build the `LoginFreshUserAndPassword` widget.

 ```dart
LoginFreshTypeLoginModel(  
    callFunction: (BuildContext _buildContext) {  
      Navigator.of(_buildContext).push(MaterialPageRoute(  
        builder: (_buildContext) => widgetLoginFreshUserAndPassword(),  
      ));  
    },  
    logo: TypeLogo.userPassword),
```


## Feedback

  
Your comments and suggestions are very important for the growth of `LoginFresh`, for that reason you can leave them in the [github] repository (https://github.com/Krysthyan/login_fresh) Or you can create forks to improve the package, I appreciate your collaboration: smiley:: smiley: if you need help write to me at cristhian.hernandez@softnux.io

-----------------------------------

## Ejemplos

Puedes ver el demo completo aquí [demo project](https://github.com/Krysthyan/login_fresh) 

### Código completo del ejemplo
 ```dart
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
        home: Scaffold(  
            body: buildLoginFresh()));  
  }  
  
  LoginFresh buildLoginFresh() {  
  
    List<LoginFreshTypeLoginModel> listLogin = [  
      LoginFreshTypeLoginModel(  
          callFunction: (BuildContext _buildContext) {  
            // develop what they want the facebook to do when the user clicks  
  },  
          logo: TypeLogo.facebook),  
      LoginFreshTypeLoginModel(  
          callFunction: (BuildContext _buildContext) {  
            // develop what they want the Google to do when the user clicks  
  },  
          logo: TypeLogo.google),  
      LoginFreshTypeLoginModel(  
          callFunction: (BuildContext _buildContext) {  
            print("APPLE");  
            // develop what they want the Apple to do when the user clicks  
  },  
          logo: TypeLogo.apple),  
      LoginFreshTypeLoginModel(  
          callFunction: (BuildContext _buildContext) {  
            Navigator.of(_buildContext).push(MaterialPageRoute(  
              builder: (_buildContext) => widgetLoginFreshUserAndPassword(),  
            ));  
          },  
          logo: TypeLogo.userPassword),  
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
              callLogin: (BuildContext _context, Function isRequest,  
                  String user, String password) {  
                isRequest(true);  
  
                Future.delayed(Duration(seconds: 2), () {  
                  print('-------------- function call----------------');  
                  print(user);  
                  print(password);  
                  print('-------------- end call----------------');  
  
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
      funResetPassword: (BuildContext _context, Function isRequest, String email) {  
        isRequest(true);  
  
        Future.delayed(Duration(seconds: 2), () {  
          print('-------------- function call----------------');  
          print(email);  
          print('-------------- end call----------------');  
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
```


### Login with user and password

```dart
Widget widgetLoginFreshUserAndPassword() {  
  return LoginFreshUserAndPassword(  
            callLogin: (BuildContext _context, Function isRequest,  
                String user, String password) {  
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
```

Al momento que el usuario de click en el botón de login, `LoginFreshUserAndPassword` llama la función agregada en `callLogin`, esta recibe 4 parametros `BuildContext _context, Function isRequest, String user, String password`.
`isRequest` sirve para agregar un loading en la parte del botón de login cuando ha sido pulsado, para habilitar esta funcionalidad dentro de `callLogin`invocar dicho metodo con el parametro true `isRequest(true)`, despues de desarrollar todo el codigo necesario debes deshablitar `isResquest(false)`  para que vuelva aparecer el botón de login (sirve para casos como cuando las credenciales fueron incorrectas o cuando haces consultas a una API y toca esperar hasta que el servidor de respuesta), puedes ver el ejemplo donde he puesto un timer `(Future.delayed)`, donde se llama callLogin y luego de 2 segundos vuelve habilitarse el botón de login.
  En `LoginFresh` tu puedes incluir un widget de footer, para este caso se puede utilizar `LoginFreshFooter` o puedes contruir tu propio widget e incluirlo en el login
```dart
Widget widgetFooter() {  
  return LoginFreshFooter(  
    logo: 'assets/logo_footer.png',  
    text: 'Power by',  
    funFooterLogin: () {  
      // develop what they want the footer to do when the user clicks  
  },  
  );  
}
```

Adicional puedes habilitar la funcionalidad de registar usuarios, donde capturas información del usuario como (email, nombre, apellido, contraseña, repetir contraseña). Para lograr esa parte debes poner en la variable `isSignUp: true` y en `signUp` llamar el Widget `LoginFreshSingUp`. A continuación puedes ver un ejemplo de como construir el widget. Este se le debe pasar una función que recibe 3 parametros `BuildContext _context, Function isRequest, SignUpModel signUpModel`, el metodo isRequest tiene la misma funcionalidad explicada anteriormente, `signUpModel` contiene la información de los inputs cuando el usuario de click en el botón registrar.

```dart
Widget widgetLoginFreshSignUp() {  
  return LoginFreshSignUp(  
    isFooter: true,  
      widgetFooter: this.widgetFooter(),  
      logo: 'assets/logo_head.png',  
      funSignUp: (BuildContext _context, Function isRequest, SignUpModel signUpModel) {  
        isRequest(true);  
  
        print(signUpModel.email);  
	print(signUpModel.password);  
	print(signUpModel.repeatPassword);  
	print(signUpModel.surname);  
	print(signUpModel.name);  
  
        isRequest(false);  
      });  
}
```
Por ultimo tenemos el widget `LoginFreshResetPassword`, nos sirve para dar la funcionaldiad al usuario de solicitar un cambio de contraseña a partir del email. En la función de retorno de este widget se debe agregar 3 parametros  `BuildContext _context, Function isRequest, String email`, isRequest tiene la funcionalidad explicada anteriormente y email es el string que retorna el widget.
```dart
Widget widgetResetPassword() {  
  return LoginFreshResetPassword(  
    logo: 'assets/logo_head.png',  
    funResetPassword: (BuildContext _context, Function isRequest, String email) {  
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
```

En parametros de cada widget existen algunos que son opciones pero que ayuda a la personalización de tu login. A continuación se explica la funcionalidad de cada uno:

 - `logo` -> este parametro es para ingresar la url de la imagen que deseamos poner en nuestro login
 - `textColor` -> los textos puestos en el login tu puedes especificar el color, como por ejemplo `Color(0xFFE7004C)`
 - `backgroundColor` -> Es la personalización del color principal del login, tu puedes especificar el color que desees como por ejm `Color(0xFFE7004C)`
 - `loginFreshWords` -> Es una clase donde tu puedes especificar o personalizar los strings que estan en tu login, por ejemplo `LoginFresWords(login: 'Login fesh', signUp: 'Sign Up Fresh', ...)`


### Login con redes sociales
LoginFresh te da la funcionalidad de agregar varios tipos de login, los mismos que tu puedes pogramarlos como desees, a continuación te presento un ejemplo y la explicación de como es su funcionamiento.

```dart
LoginFresh buildLoginFresh() {  
  List<LoginFreshTypeLoginModel> listLogin = [  
    LoginFreshTypeLoginModel(  
        callFunction: (BuildContext _buildContext) {  
          // develop what they want the facebook to do when the user clicks  
  },  
        logo: TypeLogo.facebook),  
    LoginFreshTypeLoginModel(  
        callFunction: (BuildContext _buildContext) {  
          // develop what they want the Google to do when the user clicks  
  },  
        logo: TypeLogo.google),  
    LoginFreshTypeLoginModel(  
        callFunction: (BuildContext _buildContext) {  
          print("APPLE");  
          // develop what they want the Apple to do when the user clicks  
  },  
        logo: TypeLogo.apple),  
    LoginFreshTypeLoginModel(  
        callFunction: (BuildContext _buildContext) {  
          Navigator.of(_buildContext).push(MaterialPageRoute(  
            builder: (_buildContext) => widgetLoginFreshUserAndPassword(),  
          ));  
        },  
        logo: TypeLogo.userPassword),  
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
```
Lo primero que debemos hacer para crear nuestro `LoginFresh`es crear una lista de los tipos de login's que vamos a tener en nuestra aplicación. A continuación te explico que es `LoginFreshTypeLoginModel`

```dart
LoginFreshTypeLoginModel(  
        callFunction: (BuildContext _buildContext) {  
          // develop what they want the facebook to do when the user clicks  
  },  
        logo: TypeLogo.facebook),
```

Existen dos parametros  `callFunction, logo`, el primero es la función que se va a ejecutar cuando el usuario pulse ese tipo de login, puedes pogramar tu código como por ejemplo si quieres construir un login para `Facebook` dentro de esta realizas toda la funcionalidad e importas las librerias necesarias. Y adicional a esto hay el parametro `logo`, esto sirve para utilizar los logos de `LoginFresh` pero tu puedes poner el logo que desees, `logo` es un string donde puedes poner el path de donde esta tu imagen a poner.

Dentro de esto tu puedes agregar tambien el login de usuario y contraseña, como esta en el siguiente ejemplo `widgetLoginFreshUserAndPassword()` es una función que se encuentra especificada anteriormente, donde se explica como construir el widget de 	`LoginFreshUserAndPassword`.
 ```dart
LoginFreshTypeLoginModel(  
    callFunction: (BuildContext _buildContext) {  
      Navigator.of(_buildContext).push(MaterialPageRoute(  
        builder: (_buildContext) => widgetLoginFreshUserAndPassword(),  
      ));  
    },  
    logo: TypeLogo.userPassword),
```


## Retroalimentación

Tus comentarios y sugerencias son muy importantes para el crecimiento de `LoginFresh` por esa razón puedes dejarlos en el repositorio de [github](https://github.com/Krysthyan/login_fresh) 
O puedes crear forks para mejorar el paquete, te agradezco tu colaboración :smiley: :smiley: si necesitas ayuda escribeme al correo cristhian.hernandez@softnux.io

## License

 - MIT License

