import 'package:flutter/material.dart';
import 'package:gan/constants/controller.dart';
import 'package:gan/constants/style.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DesktopNavbarItem extends StatelessWidget {
  final String itemName;
  final void Function() onTap;
  const DesktopNavbarItem(
      {Key? key, required this.itemName, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.005),
      child: InkWell(
          hoverColor: Colors.transparent,
          onTap: onTap,
          onHover: (value) {
            value
                ? navBarController.onHover(itemName)
                : navBarController.onHover("not hovering");
          },
          child: Obx(
            () => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: size.height * 0.01,
                ),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Text(
                    itemName,
                    style: GoogleFonts.mavenPro(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: navBarController.isHovering(itemName) ||
                                navBarController.isActive(itemName)
                            ? active
                            : lightTextColor),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
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
                          color: active,
                          borderRadius: BorderRadius.circular(20)),
                    ))
              ],
            ),
          )),
    );
  }
}
