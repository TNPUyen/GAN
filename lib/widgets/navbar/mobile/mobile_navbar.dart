// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

AppBar mobileNavbar(GlobalKey<ScaffoldState> key) => AppBar(
     leading: IconButton(icon: Icon(Icons.menu, color: Colors.amberAccent,), onPressed: (){
      key.currentState!.openDrawer();
    },),
      title: Image.asset("assets/images/logo.png",  width: 120, height: 50,),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
