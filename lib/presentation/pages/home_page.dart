import 'package:flutter/material.dart';
import 'package:kas_mentor_mt/presentation/widgets/spacer.dart';

import '../widgets/cat_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _appBar(), body: _body());
  }

  _appBar() {
    return AppBar(title: Text("Welcome Guest"));
  }

  _body() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          _catCardBuilder(),
          spacerHeight(10),
          _featuredCourses(),
          spacerHeight(10),
          featuredTestSeries(),
          spacerHeight(10),
          successStories(),
          spacerHeight(10),
          _devInfo(),
          spacerHeight(10),
        ],
      ),
    );
  }

  Widget successStories() {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => spacerWidth(5),
        itemBuilder: (context, index) {
          return CatCard();
        },
      ),
    );
  }

  Widget featuredTestSeries() {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => spacerWidth(5),
        itemBuilder: (context, index) {
          return CatCard();
        },
      ),
    );
  }

  Widget _featuredCourses() {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => spacerWidth(5),
        itemBuilder: (context, index) {
          return CatCard();
        },
      ),
    );
  }

  Widget _catCardBuilder() {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => spacerWidth(5),
        itemBuilder: (context, index) {
          return CatCard();
        },
      ),
    );
  }

  Widget _devInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [Text("Experience our patented learning journey"), Text("Developed with ❤️ in Trivandrum, India")],
    );
  }
}
