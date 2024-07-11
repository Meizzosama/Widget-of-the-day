import 'package:flutter/material.dart';

class MyCustomScrollView extends StatelessWidget {
  const MyCustomScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            pinned: true, 
            floating: false, 
            title: Text('SliverAppBar'),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  title: Text('Item $index'),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}