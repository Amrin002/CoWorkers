import 'package:coworker_mobile/models/booking_model.dart';
import 'package:coworker_mobile/models/worker_model.dart';
import 'package:get/get.dart';
//
// class BookingController extends GetxController {
//   clear() {
//     Get.delete<BookingController>(force: true);
//   }
//
//   final hourDuartion = [5, 10, 15, 25, 40, 100];
//
//   final _duration = 10.obs;
//   int get duration => _duration.value;
//   setDuration(int n, double hourRate) {
//     _duration.value = n;
//     BookingModel newBookingModel = bookingDetail
//       ..hiringDuration = n
//       ..subtotal = n * hourRate;
//     _bookingDetail.value = newBookingModel;
//     update();
//   }
//
//   final _bookingDetail = BookingModel(
//     userId: '',
//     workerId: '',
//     date: DateTime.now(),
//     hiringDuration: 0,
//     subtotal: 0,
//     insurance: 0,
//     tax: 0,
//     platformFee: 0,
//     grandTotal: 0,
//     payWith: '',
//     status: 'In Progress',
//     $id: '',
//     $createdAt: '',
//     $updatedAt: '',
//   ).obs;
//   BookingModel get bookingDetail => _bookingDetail.value;
//
//   iniBookingDetail(String userId, WorkerModel worker) {
//     _bookingDetail.value = BookingModel(
//       userId: userId,
//       workerId: worker.$id,
//       date: DateTime.now(),
//       hiringDuration: duration,
//       subtotal: duration * worker.hourRate,
//       insurance: 56,
//       tax: 12,
//       platformFee: 344,
//       grandTotal: 2323,
//       payWith: 'Wallet',
//       status: 'In Progress',
//       $id: '',
//       $createdAt: '',
//       $updatedAt: '',
//       worker: worker,
//     );
//   }
// }

class BookingController extends GetxController {
  clear() {
    Get.delete<BookingController>(force: true);
  }

  final hourDuartion = [5, 10, 15, 25, 40, 100];

  final _duration = 10.obs;
  int get duration => _duration.value;
  setDuration(int n, double hourRate) {
    _duration.value = n;
    BookingModel newBookingModel = bookingDetail
      ..hiringDuration = n
      ..subtotal = n * hourRate;
    _bookingDetail.value = newBookingModel;
    update();
  }

  final _bookingDetail = BookingModel(
    userId: '',
    workerId: '',
    date: DateTime.now(),
    hiringDuration: 0,
    subtotal: 0,
    insurance: 0,
    tax: 0,
    platformFee: 0,
    grandTotal: 0,
    payWith: '',
    status: 'In Progress',
    $id: '',
    $createdAt: '',
    $updatedAt: '',
  ).obs;
  BookingModel get bookingDetail => _bookingDetail.value;

  iniBookingDetail(String userId, WorkerModel worker) {
    double subtotal = duration * worker.hourRate;
    double insurance = 56;
    double tax = 12;
    double platformFee = 344;
    double grandTotal = subtotal + insurance + tax + platformFee;

    _bookingDetail.value = BookingModel(
      userId: userId,
      workerId: worker.$id,
      date: DateTime.now(),
      hiringDuration: duration,
      subtotal: subtotal,
      insurance: insurance,
      tax: tax,
      platformFee: platformFee,
      grandTotal: grandTotal,
      payWith: 'Wallet',
      status: 'In Progress',
      $id: '',
      $createdAt: '',
      $updatedAt: '',
      worker: worker,
    );
  }
}