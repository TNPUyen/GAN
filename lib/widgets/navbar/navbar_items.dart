import 'package:flutter/material.dart';
import 'package:gan/helpers/responsive.dart';
import 'package:gan/widgets/navbar/desktop/desktop_navbar_item.dart';
import 'package:gan/widgets/navbar/mobile/mobile_navbar_item.dart';

class NavbarItems extends StatelessWidget {
  final String itemName;
  final void Function() onTap;
  const NavbarItems({Key? key, required this.itemName, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (ResponsiveWidget.isSmallScreen(context)) {
      return MobileNavbarItem(itemName: itemName, onTap: onTap);
    }
    return DesktopNavbarItem(
      itemName: itemName,
      onTap: onTap,
    );
  }
}
