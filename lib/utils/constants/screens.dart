import 'package:flutter/material.dart';
import 'package:sample_ecommerce/screens/cart_screen.dart';
import 'package:sample_ecommerce/screens/favourites_screen.dart';
import 'package:sample_ecommerce/screens/home_screen.dart';
import 'package:sample_ecommerce/screens/profile_screen.dart';
import 'package:sample_ecommerce/screens/time_line_screen.dart';

List<Widget> screens = const [
  HomePage(),
  TimeLineScreen(),
  FavouritesScreen(),
  CartScreen(),
  ProfileScreen(),
];
