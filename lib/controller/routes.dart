import 'package:flutter/material.dart';

import '../home/details_page/detailscreen.dart';
import '../home/homepage/homescreen.dart';
import '../home/viewpage/view_page.dart';

class RoutesApp
{
  static Map<String, Widget Function(BuildContext)> routes={
    '/':(context)=>const HomePage(),
    '/detail':(context)=>const DetailPage(),
    '/view':(context)=>const ViewPage(),
  };
}