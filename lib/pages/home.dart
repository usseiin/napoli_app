import 'package:flutter/material.dart';
import 'package:napoli_app/models/user.dart';
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
import 'package:napoli_app/pages/ch8_bottom_appbar/ch8_botttom-appbar.dart';
import 'package:napoli_app/pages/ch8_bottom_navbar/ch8_bottom_navbar.dart';
import 'package:napoli_app/pages/ch8_hero_animation/ch8_hero_animation.dart';
import 'package:napoli_app/pages/ch8_navigator/ch8_navigator.dart';
import 'package:napoli_app/pages/ch8_tab_bar/ch8_tab_bar.dart';
import 'package:napoli_app/pages/ch9_custom_list_silver/ch9_custom_list_sliver.dart';
import 'package:napoli_app/pages/ch9_listview/ch9_listview.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  User user = User(
    name: "Kehinde HASSAN",
    email: "sirkenny.hk@gail.com",
    backgroundImg: "assets/images/background.png",
    profilePic: const Icon(
      Icons.face,
      size: 50,
      color: Colors.white,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Napoli App"),
      ),
      endDrawer: Drawer(
        child: Column(
          children: [
            Container(
              color: Colors.blue,
              height: 200,
              child: const Center(
                child: Icon(
                  Icons.tag_faces,
                  size: 120,
                  color: Colors.white,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, index) => Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.gif_box),
                    title: Text("List${index + 1}"),
                    subtitle: Text("sublist${index + 1}"),
                  ),
                  const Divider()
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: LeftDrawer(user: user),
    );
  }
}

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(57, 158, 158, 158),
              image: DecorationImage(
                image: AssetImage(user.backgroundImg),
                fit: BoxFit.cover,
              ),
            ),
            height: 200,
            width: double.infinity,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        user.profilePic,
                        const Icon(
                          Icons.bookmark_border,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      user.name,
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      user.email,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    title: const Text("ch5_widgets_tree"),
                    onTap: () => Navigator.of(context)
                        .pushNamed(Ch5WidgetsTree.nameRoute),
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text("ch5_basics"),
                    onTap: () =>
                        Navigator.of(context).pushNamed(Ch5Basics.nameRoute),
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text("ch6_images"),
                    onTap: () =>
                        Navigator.of(context).pushNamed(Ch6Images.nameRoute),
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text("ch6_form_validation"),
                    onTap: () => Navigator.of(context)
                        .pushNamed(Ch6FormValidation.nameRoute),
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text("ch6_orientation"),
                    onTap: () => Navigator.of(context)
                        .pushNamed(Ch6Orientation.nameRoute),
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text("ch7_animation"),
                    onTap: () =>
                        Navigator.of(context).pushNamed(Ch7Animation.nameRoute),
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text("ch8_navigation"),
                    onTap: () =>
                        Navigator.of(context).pushNamed(Ch8Navigator.nameRoute),
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text("ch8_hero_animation"),
                    onTap: () => Navigator.of(context)
                        .pushNamed(Ch8HeroAnimation.nameRoute),
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text("ch8_bottom_navbar"),
                    onTap: () => Navigator.of(context)
                        .pushNamed(Ch8BottomNavbar.nameRoute),
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text("ch8_bottom_appbar"),
                    onTap: () => Navigator.of(context)
                        .pushNamed(Ch8BottomAppBar.nameRoute),
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text("ch8_tab_bar"),
                    onTap: () =>
                        Navigator.of(context).pushNamed(Ch8TabBar.nameRoute),
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text("ch9_layout"),
                    onTap: () =>
                        Navigator.of(context).pushNamed(Ch10Layout.nameRoute),
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text("ch9_listview"),
                    onTap: () =>
                        Navigator.of(context).pushNamed(Ch9ListView.nameRoute),
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text("ch9_custom_list"),
                    onTap: () => Navigator.of(context)
                        .pushNamed(Ch9CustomSliverList.nameRoute),
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text("ch10_layout"),
                    onTap: () =>
                        Navigator.of(context).pushNamed(Ch10Layout.nameRoute),
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text("ch11_interactive"),
                    onTap: () => Navigator.of(context)
                        .pushNamed(Ch11Interactive.nameRoute),
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text("ch11_gesture_scale"),
                    onTap: () => Navigator.of(context)
                        .pushNamed(Ch11GestureScale.nameRoute),
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text("ch11_dsmisible"),
                    onTap: () => Navigator.of(context)
                        .pushNamed(Ch11DismissibleWidget.nameRoute),
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text("ch12_platform_code"),
                    onTap: () => Navigator.of(context)
                        .pushNamed(Ch12PlatformNativeCode.nameRoute),
                  ),
                  const Divider(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
