import 'package:flutter/material.dart';
import 'package:napoli_app/pages/ch10_layout/ch10_layout.dart';
import 'package:napoli_app/pages/ch11_disnmisible_widgets/ch11_dismisible_widgets.dart';
import 'package:napoli_app/pages/ch11_gesture_drag_drop/ch11_gestue_drag_drop.dart';
import 'package:napoli_app/pages/ch11_gesture_scale/ch11_gesture_scale.dart';
import 'package:napoli_app/pages/ch12_platform_native_code/ch12_platform_native_code.dart';
import 'package:napoli_app/pages/ch5_basics/ch5_basics.dart';
import 'package:napoli_app/pages/ch5_widgets_tree/ch5_widgets_tree.dart';
import 'package:napoli_app/pages/ch6_form_validation/ch6_form_validation.dart';
import 'package:napoli_app/pages/ch6_images/ch6_images.dart';
import 'package:napoli_app/pages/ch6_orientation/ch6_orientation.dart';
import 'package:napoli_app/pages/ch7_animation/ch7_animation.dart';
import 'package:napoli_app/pages/ch7_animation/ch7_animation_controller.dart';
import 'package:napoli_app/pages/ch7_animation/ch7_staggered_animation.dart';
import 'package:napoli_app/pages/ch8_bottom_appbar/ch8_botttom-appbar.dart';
import 'package:napoli_app/pages/ch8_bottom_navbar/ch8_bottom_navbar.dart';
import 'package:napoli_app/pages/ch8_hero_animation/ch8_hero_animation.dart';
import 'package:napoli_app/pages/ch8_navigator/ch8_navigator.dart';
import 'package:napoli_app/pages/ch8_tab_bar/ch8_tab_bar.dart';
import 'package:napoli_app/pages/ch9_custom_list_silver/ch9_custom_list_sliver.dart';
import 'package:napoli_app/pages/ch9_listview/ch9_listview.dart';
import 'package:napoli_app/pages/home.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;

    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => const Home());

      case Ch5WidgetsTree.nameRoute:
        return MaterialPageRoute(builder: (context) => const Ch5WidgetsTree());

      case Ch5Basics.nameRoute:
        return MaterialPageRoute(builder: (context) => const Ch5Basics());

      case Ch6Images.nameRoute:
        return MaterialPageRoute(builder: (context) => const Ch6Images());

      case Ch6FormValidation.nameRoute:
        return MaterialPageRoute(
            builder: (context) => const Ch6FormValidation());

      case Ch6Orientation.nameRoute:
        return MaterialPageRoute(builder: (context) => const Ch6Orientation());

      case Ch7Animation.nameRoute:
        return MaterialPageRoute(builder: (context) => const Ch7Animation());

      case Ch7AnimatedController.nameRoute:
        return MaterialPageRoute(
            builder: (context) => const Ch7AnimatedController());

      case Ch7StaggeredAnimation.nameRoute:
        return MaterialPageRoute(
            builder: (context) => const Ch7StaggeredAnimation());

      case Ch8Navigator.nameRoute:
        return MaterialPageRoute(builder: (context) => const Ch8Navigator());

      case Ch8HeroAnimation.nameRoute:
        return MaterialPageRoute(
            builder: (context) => const Ch8HeroAnimation());

      case Ch8BottomNavbar.nameRoute:
        return MaterialPageRoute(builder: (context) => const Ch8BottomNavbar());

      case Ch8BottomAppBar.nameRoute:
        return MaterialPageRoute(builder: (context) => const Ch8BottomAppBar());

      case Ch8TabBar.nameRoute:
        return MaterialPageRoute(builder: (context) => const Ch8TabBar());

      case Ch10Layout.nameRoute:
        return MaterialPageRoute(builder: (context) => const Ch10Layout());

      case Ch9ListView.nameRoute:
        return MaterialPageRoute(builder: (context) => const Ch9ListView());

      case Ch9CustomSliverList.nameRoute:
        return MaterialPageRoute(
            builder: (context) => const Ch9CustomSliverList());

      case Ch11Interactive.nameRoute:
        return MaterialPageRoute(builder: (context) => const Ch11Interactive());

      case Ch11GestureScale.nameRoute:
        return MaterialPageRoute(
            builder: (context) => const Ch11GestureScale());

      case Ch11DismissibleWidget.nameRoute:
        return MaterialPageRoute(
            builder: (context) => const Ch11DismissibleWidget());

      case Ch12PlatformNativeCode.nameRoute:
        return MaterialPageRoute(
            builder: (context) => const Ch12PlatformNativeCode());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: Text("Error Page"),
        ),
      ),
    );
  }
}
