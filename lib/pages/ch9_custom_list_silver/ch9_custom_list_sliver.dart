import 'package:flutter/material.dart';

class Ch9CustomSliverList extends StatelessWidget {
  const Ch9CustomSliverList({Key? key}) : super(key: key);
  static const String nameRoute = "/ch9_custom_list";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Sliver List"),
      ),
      body: const CustomScrollView(
        slivers: [
          SliverAppBarWidget(),
          SliverListWidget(),
          SliverGridWidget(),
        ],
      ),
    );
  }
}

class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      backgroundColor: Colors.brown,
      forceElevated: true,
      expandedHeight: 250.0,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          'Parallax Effect',
        ),
        background: Image(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class SliverListWidget extends StatelessWidget {
  const SliverListWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        List.generate(3, (int index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.lightGreen,
              foregroundColor: Colors.white,
              child: Text("${index + 1}"),
            ),
            title: Text('Row ${index + 1}'),
            subtitle: Text('Subtitle Row ${index + 1}'),
            trailing: const Icon(Icons.star_border),
          );
        }),
      ),
    );
  }
}

class SliverGridWidget extends StatelessWidget {
  const SliverGridWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverSafeArea(
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Icon(
                    Icons.child_friendly,
                    size: 48.0,
                    color: Colors.amber,
                  ),
                  const Divider(),
                  Text('Grid ${index + 1}'),
                ],
              ),
            );
          },
          childCount: 12,
        ),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      ),
    );
  }
}
