import 'package:flutter/material.dart';
import 'package:gan/constants/style.dart';
import 'package:gan/constants/controller.dart';
import 'package:gan/routes/route.dart';
import 'package:gan/widgets/navbar/navbar_items.dart';
import 'package:get/get.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: const EdgeInsets.all(16),
        color: active,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: navbarItemRoutes
                .map((item) => NavbarItems(
                    itemName: item.name,
                    onTap: () {
                      if (!navBarController.isActive(item.name)) {
                        navBarController.changeActiveItemTo(item.name);
                      }
                      Get.toNamed('/'+item.route);
                      // Get.back();
                      // navigationController.navigateTo(item.route);
                    }))
                .toList()),
      ),
    );
  }
}