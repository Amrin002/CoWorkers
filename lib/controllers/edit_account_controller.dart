import 'package:coworker_mobile/config/app_info.dart';
import 'package:coworker_mobile/datasource/user_datasource.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditAccountController extends GetxController {
  clear() {
    Get.delete<EditAccountController>(force: true);
  }

  final editName = TextEditingController();
  final editEmail = TextEditingController();
  final editPassword = TextEditingController();
  final editConfirmPassword = TextEditingController();

  final _loading = false.obs;
  bool get loading => _loading.value;
  set loading(bool n) => _loading.value = n;

  void initialize(String name, String email) {
    editName.text = name;
    editEmail.text = email;
  }

  updateAccount(BuildContext context, String userId) {
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

    if (editPassword.text.isNotEmpty && editPassword.text.length < 8) {
      AppInfo.failed(context, 'Kata sandi minimal 8 karakter');
      return;
    }

    if (editPassword.text != editConfirmPassword.text) {
      AppInfo.failed(context, 'Kata sandi dan konfirmasi kata sandi tidak cocok');
      return;
    }

    loading = true;
    UserDatasource.updateAccount(
      userId,
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
          AppInfo.toastSucces('Berhasil memperbarui akun');
          Navigator.pop(context);
        },
      );
    });
  }
}

// !!! nanti dibuat