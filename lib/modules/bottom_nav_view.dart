import 'package:get/get_rx/src/rx_types/rx_types.dart';

class BottomNavState {
  BottomNavState();
  RxInt currenIndex = 0.obs;
  List<String> images = [
    'images/house.png',
    'images/briefcase.png',
    'images/wallet.png',
    'images/gift.png',
  ];
}
