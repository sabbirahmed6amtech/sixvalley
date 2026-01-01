import 'dart:async';
import 'package:get/get.dart';

class OneTimeDealController extends GetxController {
  Duration remainingTime = const Duration(days: 7);
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    startCountdown();
  }

  void startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime.inSeconds > 0) {
        remainingTime = Duration(seconds: remainingTime.inSeconds - 1);
        update();
      } else {
        _timer?.cancel();
      }
    });
  }

  String getFormattedTime() {
    final days = remainingTime.inDays;
    final hours = (remainingTime.inHours % 24).toString().padLeft(2, '0');
    final minutes = (remainingTime.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (remainingTime.inSeconds % 60).toString().padLeft(2, '0');
    return 'Ends in  $days:$hours:$minutes:$seconds';
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
