// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gan/pages/home/home.dart';
import 'package:gan/pages/repairphoto/repairphoto_page.dart';
import 'package:gan/pages/spoilphoto/spoilphoto_page.dart';

const homePageDisplayName = "Trang chủ";
const homePageRoute = "home";

const repairPhotoDisplayName = "Sửa ảnh";
const repairPhotoRoute = "repairphoto";

const spoilPhotoDisplayName = "Tạo ảnh cũ";
const spoilPhotoRoute = "spoilphoto";

Map<String, Widget> innerRoute = {
  homePageRoute: HomePage(),
  repairPhotoRoute: RepairPhotoPage(),
  spoilPhotoRoute: SpoilPhotoPage(),
};

class NavbarItem {
  final String name;
  final String route;
  NavbarItem(
    this.name,
    this.route,
  );
}

List<NavbarItem> navbarItemRoutes = [
  NavbarItem(homePageDisplayName, homePageRoute),
  NavbarItem(repairPhotoDisplayName, repairPhotoRoute),
  NavbarItem(spoilPhotoDisplayName, spoilPhotoRoute),
];
