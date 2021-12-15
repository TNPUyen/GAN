import 'package:flutter/material.dart';
import 'package:gan/constants/controller.dart';
import 'package:gan/routes/route.dart';
import 'package:gan/widgets/navbar/navbar_items.dart';
import 'package:get/get.dart';

class DesktopNavbar extends StatelessWidget {
  const DesktopNavbar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return PreferredSize(
      preferredSize: Size(size.width, 1000),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: size.width * 0.01, horizontal: size.width*0.05),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width * 0.01,
            ),
            Image.asset("assets/images/logo.png", width: 120, height: 50,),
            Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: navbarItemRoutes
                      .map((item) => NavbarItems(
                          itemName: item.name,
                          onTap: () {
                            if (!navBarController.isActive(item.name)) {
                              navBarController.changeActiveItemTo(item.name);
                              Get.toNamed('/'+item.route);

                              // navigationController.navigateTo(item.route);
                            }
                          }))
                      .toList()),
            )
          ],
        ),
      ),
    );
  }
}