import 'package:coworker_mobile/config/app_color.dart';
import 'package:coworker_mobile/config/app_info.dart';
import 'package:coworker_mobile/controllers/edit_account_controller.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config/appwrite.dart';


// class EditAccountPage extends StatelessWidget {
//   final editAccountController = Get.put(EditAccountController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         padding: const EdgeInsets.all(0),
//         children: [
//           SizedBox(
//             height: 172 + 120,
//             child: Stack(
//               children: [
//                 Container(
//                   height: 172,
//                   decoration: const BoxDecoration(
//                     color: AppColor.bgHeader,
//                     borderRadius: BorderRadius.only(
//                       bottomRight: Radius.circular(80),
//                     ),
//                   ),
//                   margin: const EdgeInsets.only(bottom: 24),
//                 ),
//                 SizedBox(
//                   width: double.infinity,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       const Text(
//                         'Edit Account',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       DView.spaceHeight(20),
//                       Container(
//                         width: 150,
//                         height: 150,
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             color: Colors.white,
//                             width: 6,
//                           ),
//                           shape: BoxShape.circle,
//                           color: const Color(0xffBFA8FF),
//                         ),
//                         alignment: Alignment.center,
//                         child: Obx(() {
//                           String initialName = editAccountController.editName.text.isEmpty
//                               ? ""
//                               : editAccountController.editName.text.substring(0, 1);
//                           return Text(
//                             initialName,
//                             style: const TextStyle(
//                               fontSize: 60,
//                               fontWeight: FontWeight.w700,
//                               color: Colors.black,
//                             ),
//                           );
//                         }),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           DView.spaceHeight(),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   'Nama',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//                 ),
//                 const SizedBox(height: 8),
//                 TextField(
//                   controller: editAccountController.editName,
//                   decoration: const InputDecoration(
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 const Text(
//                   'Email',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//                 ),
//                 const SizedBox(height: 8),
//                 TextField(
//                   controller: editAccountController.editEmail,
//                   decoration: const InputDecoration(
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(height: 24),
//                 Center(
//                   child: Obx(() {
//                     return ElevatedButton(
//                       onPressed: editAccountController.loading
//                           ? null
//                           : () => editAccountController.updateAccount(context, ),
//                       child: editAccountController.loading
//                           ? const CircularProgressIndicator()
//                           : const Text('Update Account'),
//                     );
//                   }),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class EditAccountPage extends StatelessWidget {
  final editAccountController = Get.put(EditAccountController());

  EditAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          SizedBox(
            height: 172 + 120,
            child: Stack(
              children: [
                Container(
                  height: 172,
                  decoration: const BoxDecoration(
                    color: AppColor.bgHeader,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(80),
                    ),
                  ),
                  margin: const EdgeInsets.only(bottom: 24),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        'Edit Account',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      DView.spaceHeight(20),
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 6,
                          ),
                          shape: BoxShape.circle,
                          color: const Color(0xffBFA8FF),
                        ),
                        alignment: Alignment.center,
                        child: Obx(() {
                          String initialName = editAccountController.editName.text.isEmpty
                              ? ""
                              : editAccountController.editName.text.substring(0, 1);
                          return Text(
                            initialName,
                            style: const TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          DView.spaceHeight(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Nama',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: editAccountController.editName,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Email',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: editAccountController.editEmail,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 16),
                const Text(
                  'Password',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: editAccountController.editPassword,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),const Text(
                  'Confirm Password',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: editAccountController.editConfirmPassword,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24),
                Center(
                  child: Obx(() {
                    return ElevatedButton(
                      onPressed: editAccountController.loading
                          ? null
                          : () async {
                        String userId = await Appwrite.getUserId();
                        if (userId.isNotEmpty) {
                          editAccountController.updateAccount(context, userId);
                        } else {
                          AppInfo.failed(context, 'Gagal mendapatkan user ID');
                        }
                      },
                      child: editAccountController.loading
                          ? const CircularProgressIndicator()
                          : const Text('Update Account'),
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class EditAccountPage extends StatelessWidget {
//   final editAccountController = Get.put(EditAccountController());
//
//   EditAccountPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         padding: const EdgeInsets.all(0),
//         children: [
//           SizedBox(
//             height: 172 + 120,
//             child: Stack(
//               children: [
//                 Container(
//                   height: 172,
//                   decoration: const BoxDecoration(
//                     color: AppColor.bgHeader,
//                     borderRadius: BorderRadius.only(
//                       bottomRight: Radius.circular(80),
//                     ),
//                   ),
//                   margin: const EdgeInsets.only(bottom: 24),
//                 ),
//                 SizedBox(
//                   width: double.infinity,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       const Text(
//                         'Edit Account',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       DView.spaceHeight(20),
//                       Container(
//                         width: 150,
//                         height: 150,
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             color: Colors.white,
//                             width: 6,
//                           ),
//                           shape: BoxShape.circle,
//                           color: const Color(0xffBFA8FF),
//                         ),
//                         alignment: Alignment.center,
//                         child: Obx(() {
//                           String initialName = editAccountController.editName.text.isEmpty
//                               ? ""
//                               : editAccountController.editName.text.substring(0, 1);
//                           return Text(
//                             initialName,
//                             style: const TextStyle(
//                               fontSize: 60,
//                               fontWeight: FontWeight.w700,
//                               color: Colors.black,
//                             ),
//                           );
//                         }),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           DView.spaceHeight(),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   'Nama',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//                 ),
//                 const SizedBox(height: 8),
//                 TextField(
//                   controller: editAccountController.editName,
//                   decoration: const InputDecoration(
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 const Text(
//                   'Email',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//                 ),
//                 const SizedBox(height: 8),
//                 TextField(
//                   controller: editAccountController.editEmail,
//                   decoration: const InputDecoration(
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(height: 24),
//                 Center(
//                   child: Obx(() {
//                     return ElevatedButton(
//                       onPressed: editAccountController.loading.value
//                           ? null
//                           : () async {
//                         String userId = await Appwrite.getUserId();
//                         if (userId.isNotEmpty) {
//                           editAccountController.updateAccount(context, userId);
//                         } else {
//                           AppInfo.failed(context, 'Gagal mendapatkan user ID');
//                         }
//                       },
//                       child: editAccountController.loading.value
//                           ? const CircularProgressIndicator()
//                           : const Text('Update Account'),
//                     );
//                   }),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



// nanti dibuat
