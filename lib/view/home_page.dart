// import 'package:chatbotapp/view/chat_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:local_auth/local_auth.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//     final LocalAuthentication _auth=LocalAuthentication();
//     bool _isAuthenticated=false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _BuildUI(),
//       floatingActionButton: _authButton(),
//     );
//   }
//   Widget _authButton(){
//     return FloatingActionButton(onPressed: ()async{
//       if(!_isAuthenticated){
//         final bool canAuthenticateWithBiometrics=await _auth.canCheckBiometrics;
//         if (canAuthenticateWithBiometrics) {
//             try {
//               final bool didAuthenticate = await _auth.authenticate(
//                 localizedReason: 'Please authenticate to use bot',
//                 options: const AuthenticationOptions(
//                   biometricOnly: false,
//                 ),
//               );
//               setState(() {
//                 _isAuthenticated = didAuthenticate;
//               });
//             } catch (e) {
//               print(e);
//             }
//           }
//         } else {
//           setState(() {
//             _isAuthenticated = false;
//           });
//         }
//       },
//       child: Icon(
//         _isAuthenticated ? Icons.lock : Icons.lock_open,
//       ),
//     );
//       }
    
//   Widget _BuildUI(){
//     return SizedBox(
//   width: MediaQuery.sizeOf(context).width,
//   child: Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     crossAxisAlignment: CrossAxisAlignment.center,
//     children: [
//       const Text(
//         "",
//         style: TextStyle(
//           fontSize: 30,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       if (_isAuthenticated)
//         GestureDetector(
//           onTap: () {
//             // Navigate to ChatScreen using GetX
//             Get.to(() => const ChatScreen());
//           },
//           child: const Text(
//             "Authenticated! Tap to go to Chat Screen",
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//               color: Colors.green, // Optional: Highlight the action
//             ),
//           ),
//         ),
//       if (!_isAuthenticated)
//         const Text(
//           "Not Authenticated!",
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//             color: Colors.red, // Optional: Highlight the state
//           ),
//         ),
//     ],
//   ),
// );

//   }
// }