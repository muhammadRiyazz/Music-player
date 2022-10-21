import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Column(children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back_ios_new_outlined)),
              Text('Search'),
            ],
          ),
          TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
                fillColor: Colors.grey),
          ),
          //  ListView.builder(itemBuilder: ,itemCount: ,)
        ]),
      )),
    );
  }
}
