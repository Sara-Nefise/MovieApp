import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/init/theme/color/color_theme.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_app/widgets/customElevatedButton.dart';
import 'package:movie_app/widgets/customInputFeild.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Expanded(
                      child: SizedBox(height: context.dynamicHeight(0.06))),
                  Expanded(
                    flex: 1,
                    child: Image.asset('assets/images/11.PNG'),
                  ),
                  Expanded(
                    flex: 4,
                    child: _loginForm(context),
                  )
                ],
              ))),
    );
  }

  Widget _loginForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Form(
          key: formKey,
          child: Column(
            children: [
              Text(
                'Login to Your Account',
                style: context.textTheme.headline4,
              ),
              SizedBox(height: context.dynamicHeight(0.06)),
              CustomInputFeild(
                prefixIcon: Icons.email,
                hintText: 'Email',
              ),
              SizedBox(height: context.dynamicHeight(0.03)),
              CustomInputFeild(
                prefixIcon: Icons.password,
                hintText: 'Password',
                SuffixIcon: Icons.visibility,
              ),
              SizedBox(height: context.dynamicHeight(0.06)),
              CustomElevatedButton(onPressedFunc: () {}, buttonText: 'Sign in'),
              SizedBox(height: context.dynamicHeight(0.1)),
              RichText(
                text: TextSpan(
                  text: 'Continue as a ',
                  style: context.textTheme.bodyText2,
                  children: <TextSpan>[
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          //   createToken(context);
                          // createSession();
                          Navigator.pushReplacementNamed(context, "/home");
                        },
                      text: 'Guest',
                      style: context.textTheme.bodyText2?.copyWith(
                          fontWeight: FontWeight.bold, color: AppColors().red),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  // void createToken(BuildContext context) {
  //   FutureBuilder<TokenModel?>(
  //     future: AuthenticationApi().getToken(),
  //     builder: (ctx, snapshot) {
  //       if (snapshot.connectionState == ConnectionState.done) {
  //         if (snapshot.hasError) {
  //           return Center(
  //             child: Text(
  //               '${snapshot.error} occurred',
  //               style: TextStyle(fontSize: 18),
  //             ),
  //           );
  //         } else if (snapshot.hasData) {
  //           ApiConstants.requestKey = snapshot.data!.requestToken;
  //           createSession();
  //         }
  //       }
  //       return Center(
  //         child: SizedBox(
  //           height: context.dynamicHeight(0.1),
  //           width: context.dynamicWidth(0.5),
  //           child: Image.asset('assets/gifs/loading.gif'),
  //         ),
  //       );
  //     },
  //   );
  // }

  // void createSession() {
  //   FutureBuilder<sessionModel?>(
  //     future: AuthenticationApi().makePostRequest(ApiConstants.requestKey),
  //     builder: (context, snapshot) {
  //       if (snapshot.hasData) {
  //         print('helllo');
  //         ApiConstants.sessionId = snapshot.data!.sessionId;
  //         WidgetsBinding.instance.addPostFrameCallback((_) {
  //           Navigator.pushReplacementNamed(context, "/home");
  //         });
  //       } else if (snapshot.hasError) {
  //         return Text('${snapshot.error}');
  //       }

  //       return const CircularProgressIndicator();
  //     },
  //   );
  // }
}
