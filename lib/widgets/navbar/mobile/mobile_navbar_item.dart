import 'package:flutter/material.dart';
import 'package:gan/constants/controller.dart';
import 'package:gan/constants/style.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MobileNavbarItem extends StatelessWidget {
  final String itemName;
  final void Function() onTap;
  const MobileNavbarItem(
      {Key? key, required this.itemName, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return InkWell(
        hoverColor: Colors.transparent,
        onTap: onTap,
        onHover: (value) {
          value
              ? navBarController.onHover(itemName)
              : navBarController.onHover("not hovering");
        },
        child: Obx(
          () => Container(
            padding: EdgeInsets.symmetric(vertical: size.width * 0.015),
            child: Row(children: [
              navBarController.isActive(itemName) ||
                      navBarController.isHovering(itemName)
                  ? Directionality(
                      textDirection: TextDirection.ltr,
                      child: Text(
                        itemName,
                        style: GoogleFonts.mavenPro(
                          fontSize: 22,
                          color: lightTextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : Directionality(
                      textDirection: TextDirection.ltr,
                      child: Text(itemName,
                          style: GoogleFonts.mavenPro(
                            fontSize: 20,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w600,
                          )),
                    ),
              SizedBox(
                width: size.width * 0.01,
              ),
              Visibility(
                  visible: navBarController.isHovering(itemName) ||
                      navBarController.isActive(itemName),
                  maintainAnimation: true,
                  maintainState: true,
                  maintainSize: true,
                  child: Container(
                    width: 7,
                    height: 7,
                    decoration: BoxDecoration(
                        color: lightTextColor, borderRadius: BorderRadius.circular(20)),
                  ))
            ]),
          ),
        ));
  }
}
