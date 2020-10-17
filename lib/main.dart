import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:nonce/nonce.dart';
import 'package:virtualtribe/app.dart';
import 'package:virtualtribe/src/MainApp/services/FirestoreService.dart';
import 'package:virtualtribe/src/locator.dart';

// import the io version
import 'package:openid_client/openid_client_io.dart';
// use url launcher package 
import 'package:url_launcher/url_launcher.dart';


 void main(){
   
    WidgetsFlutterBinding.ensureInitialized(); //default from flutter.
     setupLocator(); //initialize dependeny injection
     locator.registerLazySingleton(() => FirestoreService());
   runApp(App());
 }
/// -----------------------------------
///          External Packages
/// -----------------------------------
// import 'dart:convert';

// import 'package:flutter/material.dart';

// import 'package:http/http.dart' as http;
// import 'package:flutter_appauth/flutter_appauth.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// final FlutterAppAuth appAuth = FlutterAppAuth();
// const FlutterSecureStorage secureStorage = FlutterSecureStorage();

// /// -----------------------------------
// ///           Auth0 Variables
// /// -----------------------------------
// const String AUTH0_DOMAIN = 'https://account.hubstaff.com';
// const String AUTH0_CLIENT_ID = '7XDSv7mQQ1TQscNdAxNsAMGTqpGrx57Q2df2L5_OJ9k'; //

// const String AUTH0_REDIRECT_URI = 'net.virtual.virtualwork://https://dev.acadaapp.com/';
// const String AUTH0_ISSUER = '$AUTH0_DOMAIN';

// /// -----------------------------------
// ///           Profile Widget
// /// -----------------------------------
// class Profile extends StatelessWidget {
//   final Future<void> Function() logoutAction;
//   final String name;
//   final String picture;

//   const Profile(this.logoutAction, this.name, this.picture, {Key key})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Container(
//           width: 150,
//           height: 150,
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.blue, width: 4),
//             shape: BoxShape.circle,
//             image: DecorationImage(
//               fit: BoxFit.fill,
//               image: NetworkImage(picture ?? ''),
//             ),
//           ),
//         ),
//         const SizedBox(height: 24),
//         Text('Name: $name'),
//         const SizedBox(height: 48),
//         RaisedButton(
//           onPressed: () async {
//             await logoutAction();
//           },
//           child: const Text('Logout'),
//         ),
//       ],
//     );
//   }
// }

// /// -----------------------------------
// ///            Login Widget
// /// -----------------------------------
// class Login extends StatelessWidget {
//   final Future<void> Function() loginAction;
//   final String loginError;

//   const Login(this.loginAction, this.loginError, {Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         RaisedButton(
//           onPressed: () async {
//             await loginAction();
//           },
//           child: const Text('Login'),
//         ),
//         Text(loginError ?? ''),
//       ],
//     );
//   }
// }

// /// -----------------------------------
// ///                 App
// /// -----------------------------------
// void main() {
     
//     WidgetsFlutterBinding.ensureInitialized(); //default from flutter.
//      setupLocator(); //initialize dependeny injection
//      locator.registerLazySingleton(() => FirestoreService());
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({Key key}) : super(key: key);

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// /// -----------------------------------
// ///              App State
// /// -----------------------------------
// class _MyAppState extends State<MyApp> {
//   bool isBusy = false;
//   bool isLoggedIn = false;
//   String errorMessage;
//   String name;
//   String picture;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Auth0 Demo',
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Auth0 Demo'),
//         ),
//         body: Center(
//           child: isBusy
//               ? const CircularProgressIndicator()
//               : isLoggedIn
//                   ? Profile(logoutAction, name, picture)
//                   : Login(loginAction, errorMessage),
//         ),
//       ),
//     );
//   }

//   Map<String, Object> parseIdToken(String idToken) {
//     final List<String> parts = idToken.split('.');
//     assert(parts.length == 3);

//     return jsonDecode(
//         utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))));
//   }

//   Future<Map<String, Object>> getUserDetails(String accessToken) async {
//     const String url = '$AUTH0_DOMAIN/user_info';
//     print('ACCESS TOKEN >>>> $accessToken');
//     final http.Response response = await http.get(
//       url,
//       headers: <String, String>{'Authorization': 'Bearer $accessToken'},
//     );

//     if (response.statusCode == 200) {
//       return jsonDecode(response.body);
//     } else {
//       throw Exception('Failed to get user details');
//     }
//   }

//   Future<void> loginAction() async {
//     Map<String, String> map = new HashMap();
//     setState(() {
//       isBusy = true;
//       errorMessage = '';
//     });
//        //client_id, response_type, state, redirect_uri
//      map['nonce'] = Nonce.generate();
//       //  map['redirect_uri'] = AUTH0_REDIRECT_URI;

//     try {
//       authenticate(
//         scopes: ['openid', 'profile', 'email', 'hubstaff:read', 'hubstaff:write'],
//         clientId: AUTH0_CLIENT_ID,
//       );

//       // setState(() {
//       //   isBusy = false;
//       //   isLoggedIn = true;
//       //   // name = idToken['name'];
//       //   // picture = profile['picture'];
//       // });
//     } on Exception catch (e, s) {
//       debugPrint('login error: $e - stack: $s');

//       setState(() {
//         isBusy = false;
//        // isLoggedIn = false;
//         errorMessage = e.toString();
//       });
//     }
//   }

//   Future<void> logoutAction() async {
//     await secureStorage.delete(key: 'refresh_token');
//     setState(() {
//       isLoggedIn = false;
//       isBusy = false;
//     });
//   }

//   @override
//   void initState() {
//     initAction();
//     super.initState();
//   }

//   Future<void> initAction() async {
//     final String storedRefreshToken =
//         await secureStorage.read(key: 'refresh_token');
//     if (storedRefreshToken == null) return;

//     setState(() {
//       isBusy = true;
//     });

//     // try {
//     //   final TokenResponse response = await appAuth.token(TokenRequest(
//     //     AUTH0_CLIENT_ID,
//     //     AUTH0_REDIRECT_URI,
//     //     issuer: AUTH0_ISSUER,
//     //     refreshToken: storedRefreshToken,
//       //   ));

//     //   final Map<String, Object> idToken = parseIdToken(response.idToken);
//     //   final Map<String, Object> profile =
//     //       await getUserDetails(response.accessToken);

//     //   await secureStorage.write(
//     //       key: 'refresh_token', value: response.refreshToken);

//     //   setState(() {
//     //     isBusy = false;
//     //     isLoggedIn = true;
//     //     name = idToken['name'];
//     //     picture = profile['picture'];
//     //   });
//     // } on Exception catch (e, s) {
//     //   debugPrint('error on refresh token: $e - stack: $s');
//     //   await logoutAction();
//     // }
//   }


// authenticate({String clientId, List<String> scopes}) async {   
    
//     // create the client
//     var issuer = await Issuer.discover(new Uri.https("account.hubstaff.com", "",    ));
//     var client = new Client(issuer, clientId);
    
//     // create a function to open a browser with an url
//     urlLauncher(String url) async {
//         if (await canLaunch(url)) {
//           await launch(url, forceWebView: true);
//         } else {
//           throw 'Could not launch $url';
//         }
//     }
    
//     // create an authenticator
//     var authenticator = new Authenticator(client,
//         scopes: scopes,
//         redirectUri: Uri.https("dev.acadaapp.com", ""),
//         port: 4000, urlLancher: urlLauncher);
    
//     // starts the authentication
//     var c = await authenticator.authorize();
//     print('Authorization => ${c.idToken}');
    
//     // close the webview when finished
//     closeWebView();
//       setState(() {
//         isBusy = false;
//       });
//     // return the user info
//     return await c.getUserInfo();
// }
// }
