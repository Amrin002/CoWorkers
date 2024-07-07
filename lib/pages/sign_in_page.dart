import 'package:coworker_mobile/config/enums.dart';
import 'package:coworker_mobile/cotrollers/sign_in_controller.dart';
import 'package:coworker_mobile/cotrollers/sign_up_controller.dart';
import 'package:coworker_mobile/widget/input_auth.dart';
import 'package:coworker_mobile/widget/input_auth_password.dart';
import 'package:coworker_mobile/widget/secondary_button.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final signInController = Get.put(SignInController());
  @override
  void dispose(){
    signInController.clear();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/signin_background.png',
                  fit: BoxFit.fitWidth,
                ),
                Center(
                  child: Image.asset(
                    'assets/applogo.png',
                    height: 100,
                    width: 100,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 20,
                  child: Transform.translate(
                    offset: const Offset(0, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Sign In",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 24, color: Colors.black),
                        ),
                        DView.spaceHeight(8),
                        const Text("Manage your worker"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          DView.spaceHeight(50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                InputAuth(
                  editingController: signInController.editEmail,
                  hint: 'Tuliskan email anda',
                  title: 'Alamat Email',
                ),
                DView.spaceHeight(15),
                InputAuthPassword(
                  editingController: signInController.editPassword,
                  hint: 'Tuliskan kata sandi anda',
                  title: 'Kata Sandi',
                ),

                DView.spaceHeight(30),
                Obx(
                  () {
                    bool loading = signInController.loading;
                    if(loading) return DView.loadingCircle();
                    return FilledButton(onPressed: () {
                      signInController.execute(context);
                    }, child: const Text('Sign In & Explore'));
                  }
                ),
                DView.spaceHeight(),
                SecondaryButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoute.signUp.name);
                  },
                  child: const Text('Create New Account'),
                ),
                DView.spaceHeight(30),
              ],
            ),
          )
        ],
      ),
    );
  }
}
