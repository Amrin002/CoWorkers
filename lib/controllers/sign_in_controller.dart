import 'package:coworker_mobile/config/app_info.dart';

import 'package:coworker_mobile/config/session.dart';
import 'package:coworker_mobile/datasource/user_datasource.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../config/enums.dart';

class SignInController extends GetxController {
  clear() {
    Get.delete<SignInController>(force: true);
  }


  final editEmail = TextEditingController();
  final editPassword = TextEditingController();

  final _loading = false.obs;
  bool get loading => _loading.value;
  set loading(bool n) => _loading.value = n;

  execute(BuildContext context) {


    if (editEmail.text == '') {
      AppInfo.failed(context, 'Email wajib diisi');
      return;
    }

    if (!GetUtils.isEmail(editEmail.text)) {
      AppInfo.failed(context, 'Email tidak valid');
      return;
    }

    if (editPassword.text == '') {
      AppInfo.failed(context, 'Kata sandi wajib diisi');
      return;
    }

    if (editPassword.text.length < 8) {
      AppInfo.failed(context, 'Kata sandi minimal 8 karakter');
      return;
    }

    loading = true;
    UserDatasource.signIn(
      editEmail.text,
      editPassword.text,
    ).then((value) {
      loading = false;
      value.fold(
            (message) {
          AppInfo.failed(context, message);
        },
            (data) {
          AppSession.setUser(Map.from(data));
          AppInfo.toastSucces('Berhasil');
          Navigator.pushReplacementNamed(context, AppRoute.dashboard.name);
        },
      );
    });
  }
}
// class SignInController extends GetxController {
//   clear() {
//     Get.delete<SignInController>(force: true);
//   }
//
//   final editEmail = TextEditingController();
//   final editPassword = TextEditingController();
//
//   final _loading = false.obs;
//   bool get loading => _loading.value;
//   set loading(bool n) => _loading.value = n;
//
//   execute(BuildContext context) async {
//     if (editEmail.text == '') {
//       AppInfo.failed(context, 'Email wajib diisi');
//       return;
//     }
//
//     if (!GetUtils.isEmail(editEmail.text)) {
//       AppInfo.failed(context, 'Email tidak valid');
//       return;
//     }
//
//     if (editPassword.text == '') {
//       AppInfo.failed(context, 'Kata sandi wajib diisi');
//       return;
//     }
//
//     if (editPassword.text.length < 8) {
//       AppInfo.failed(context, 'Kata sandi minimal 8 karakter');
//       return;
//     }
//
//     loading = true;
//
//     // Hapus sesi yang ada sebelum membuat sesi baru
//     // await AppSession.removeUser();
//
//     UserDatasource.signIn(
//       editEmail.text,
//       editPassword.text,
//     ).then((value) {
//       loading = false;
//       value.fold(
//             (message) {
//           AppInfo.failed(context, message);
//         },
//             (data) {
//           AppSession.setUser(Map.from(data));
//           AppInfo.toastSucces('Berhasil');
//           Navigator.pushReplacementNamed(context, AppRoute.dashboard.name);
//         },
//       );
//     }).catchError((error) {
//       loading = false;
//       AppInfo.failed(context, 'Terjadi kesalahan: $error');
//       print('Error: $error');
//     });
//   }
// }