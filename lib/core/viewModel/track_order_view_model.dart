import 'package:e_commerce/constant.dart';
import 'package:e_commerce/model/track_model.dart';
import 'package:get/get.dart';

class TrackOrderViewModel extends GetxController {
  List<String> history = [
    'Sept 23, 2018','Sept 18, 2018','',
  ];
  List<TrackModel> content = [
    TrackModel(
      id: 'OD - 424923192 - N',
      price: '\$4500',
      orderState: ProcessEnum.transit,
      image: 'assets/images/order/Image -2.png',
      state: 2,
    ),TrackModel(
      id: 'OD - 424923192 - N',
      price: '\$700',
      orderState: ProcessEnum.delivered,
      image: 'assets/images/order/Image -1.png',
      state: 4,
    ),TrackModel(
      id: 'OD - 424923192 - N',
      price: '\$5300',
      orderState: ProcessEnum.delivered,
      image: 'assets/images/order/Image 1.png',
      state: 4,
    ),
  ];
}
