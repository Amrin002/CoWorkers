import 'package:coworker_mobile/controllers/sign_up_controller.dart';
import 'package:coworker_mobile/widget/input_auth.dart';
import 'package:coworker_mobile/widget/input_auth_password.dart';
import 'package:coworker_mobile/widget/secondary_button.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final signUpController = Get.put(SignUpController());
  @override
  void dispose(){
    signUpController.clear();
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
                          "New account",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 24, color: Colors.black),
                        ),
                        DView.spaceHeight(8),
                        const Text("Let’s grow your business today"),
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
                  editingController: signUpController.editName,
                  hint: 'Tuliskan nama lengkap anda',
                  title: 'Nama Lengkap',
                ),
                DView.spaceHeight(15),
                InputAuth(
                  editingController: signUpController.editEmail,
                  hint: 'Tuliskan email anda',
                  title: 'Alamat Email',
                ),
                DView.spaceHeight(15),
                InputAuthPassword(
                  editingController: signUpController.editPassword,
                  hint: 'Tuliskan kata sandi anda',
                  title: 'Kata Sandi',
                ),
                DView.spaceHeight(15), // Tambahkan jarak antara kata sandi dan konfirmasi kata sandi
                InputAuthPassword(
                  editingController: signUpController.editConfirmPassword, // Tambahkan ini
                  hint: 'Konfirmasi kata sandi anda', // Tambahkan ini
                  title: 'Konfirmasi Kata Sandi', // Tambahkan ini
                ),
                DView.spaceHeight(30),
                Row(
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).primaryColor,

                        ),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      padding: const EdgeInsets.all(2),
                      child: Material(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    DView.spaceWidth(8),
                    const Text('I agree with terms and conditions',
                    style: TextStyle(color: Colors.black),
                    )
                  ],
                ),
                DView.spaceHeight(30),
                Obx(
                  () {
                    bool loading = signUpController.loading;
                    if(loading) return DView.loadingCircle();
                    return FilledButton(onPressed: () {
                      signUpController.execute(context);
                    }, child: const Text('Sign Up'));
                  }
                ),
                DView.spaceHeight(),
                SecondaryButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Sign In to My Account'),
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
