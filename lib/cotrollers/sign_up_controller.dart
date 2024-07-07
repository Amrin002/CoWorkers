import 'package:coworker_mobile/config/app_info.dart';
import 'package:coworker_mobile/datasource/user_datasource.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  clear() {
    Get.delete<SignUpController>(force: true);
  }

  final editName = TextEditingController();
  final editEmail = TextEditingController();
  final editPassword = TextEditingController();

  final _loading = false.obs;
  bool get loading => _loading.value;
  set loading(bool n) => _loading.value = n;

  execute(BuildContext context) {
    if (editName.text == '') {
      AppInfo.failed(context, 'Nama wajib diisi');
      return;
    }

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
    UserDatasource.signUp(
      editName.text,
      editEmail.text,
      editPassword.text,
    ).then((value) {
      loading = false;
          value.fold(
            (message) {
              AppInfo.failed(context, message);
            },
            (data) {
              AppInfo.toastSucces('Berhasil');
            },
          );
        });
  }
}
