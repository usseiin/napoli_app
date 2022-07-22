import 'package:flutter/material.dart';
import 'package:napoli_app/pages/ch5_basics/models.dart';

class ColumnRowNextingWidget extends StatelessWidget {
  const ColumnRowNextingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Column and Row Nexting 1"),
        const Divider(),
        const Text("Column and Row Nexting 1"),
        const Divider(),
        const Text("Column and Row Nexting 1"),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text("Row 1"),
            Divider(),
            Text("Row 2"),
            Divider(),
            Text("Row 3"),
          ],
        )
      ],
    );
  }
}

class RowWdget extends StatelessWidget {
  const RowWdget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        Text("Row 1"),
        Divider(),
        Text("Row 2"),
        Divider(),
        Text("Row 3"),
      ],
    );
  }
}

class ColumnWidgets extends StatelessWidget {
  const ColumnWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text("Column 1"),
        Divider(),
        Text("Column 2"),
        Divider(),
        Text("Column 3"),
      ],
    );
  }
}

class FlutterMobile extends StatelessWidget {
  const FlutterMobile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(color: Colors.grey, offset: Offset(0, 10), blurRadius: 10),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(100),
          bottomRight: Radius.circular(10),
        ),
        gradient: LinearGradient(
          colors: [
            Colors.white,
            Colors.green.shade500,
          ],
        ),
      ),
      child: Center(
        child: RichText(
          text: const TextSpan(
            text: "Flutter World ",
            style: TextStyle(
                fontSize: 24,
                color: Colors.deepPurple,
                fontStyle: FontStyle.italic,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dotted,
                decorationColor: Colors.deepPurpleAccent),
            children: <TextSpan>[
              TextSpan(
                text: "for ",
              ),
              TextSpan(
                text: "Mobile",
                style: TextStyle(
                  color: Colors.red,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BuildAppBar({
    Key? key,
    required this.prefferredSize,
  }) : super(key: key);
  final Size prefferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      // elevation: 0,
      leading: const IconButton(
        onPressed: null,
        icon: Icon(
          Icons.menu,
          color: Colors.white,
        ),
      ),
      flexibleSpace: const SafeArea(
        child: Icon(
          Icons.photo_camera,
          color: Colors.white,
          size: 75,
        ),
      ),
      actions: const [
        IconButton(
          onPressed: null,
          icon: Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: null,
          icon: Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(75),
        child: Container(
          color: Colors.green.shade100,
          height: 75,
          child: const Center(
            child: Text("Bottom"),
          ),
        ),
      ),
      title: const Text("Home"),
    );
  }

  @override
  Size get preferredSize => prefferredSize;
}

class BuildBottomAppBar extends StatelessWidget {
  const BuildBottomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.green.shade100,
      shape: const CircularNotchedRectangle(),
      notchMargin: 4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.pause),
          ),
          IconButton(
            onPressed: null,
            icon: Icon(Icons.stop),
          ),
          IconButton(
            onPressed: null,
            icon: Icon(Icons.access_time),
          ),
          SizedBox(
            width: 32,
          ),
        ],
      ),
    );
  }
}

class BuildPopMenuBottom extends StatelessWidget {
  const BuildPopMenuBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) {},
      itemBuilder: (context) => foodMenuItem
          .map(
            (todoMenuItem) => PopupMenuItem(
              value: Text(todoMenuItem.title),
              child: Row(
                children: [
                  todoMenuItem.icon,
                  const SizedBox(
                    width: 10,
                  ),
                  Text(todoMenuItem.title)
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
