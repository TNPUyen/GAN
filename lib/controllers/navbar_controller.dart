import 'package:gan/routes/route.dart';
import 'package:get/get.dart';

class NavBarController extends GetxController {
  static NavBarController instance = Get.find();
  
  var activeItems = homePageDisplayName.obs;
  var hoverItems = "".obs;

  changeActiveItemTo(String itemName){
    activeItems.value = itemName;
  }

  onHover(String itemName){
    if(!isActive(itemName)) hoverItems.value = itemName;
  }

  isActive(String itemName) => activeItems.value == itemName;

  isHovering(String itemName) => hoverItems.value == itemName;
}
