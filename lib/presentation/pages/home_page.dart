import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kas_mentor_mt/domain/config/theme/colors.dart';
import 'package:kas_mentor_mt/presentation/widgets/featured_test_series_card.dart';
import 'package:kas_mentor_mt/presentation/widgets/spacer.dart';
import 'package:kas_mentor_mt/presentation/widgets/success_stories_card.dart';

import '../../application/landing_controller.dart';
import '../../domain/core/resource/data_state.dart';
import '../widgets/cat_card.dart';
import '../widgets/featured_courses_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final LandingController controller = Get.find<LandingController>();

  @override
  Widget build(BuildContext context) {
    // Trigger data loading when page is built for the first time
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (controller.dataFuture.value == null) {
        controller.loadData();
      }
    });

    return Scaffold(
      appBar: _appBar(),
      body: GetBuilder<LandingController>(
        builder: (controller) {
          if (controller.dataFuture.value == null) {
            return const Center(child: Text("Loading will start soon..."));
          }

          return FutureBuilder<DataState>(
            future: controller.dataFuture.value,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Error: ${snapshot.error}"),
                      SizedBox(height: 16),
                      ElevatedButton(onPressed: () => controller.loadData(), child: Text("Retry")),
                    ],
                  ),
                );
              } else if (snapshot.hasData) {
                if (snapshot.data is DataSuccess) {
                  return _body();
                } else {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Failed to load data"),
                        SizedBox(height: 16),
                        ElevatedButton(onPressed: () => controller.loadData(), child: Text("Retry")),
                      ],
                    ),
                  );
                }
              } else {
                return const Center(child: Text("No data available"));
              }
            },
          );
        },
      ),
    );
  }

  _appBar() {
    return AppBar(
      elevation: 0.1,
      backgroundColor: ColorConst.backgroundWhite,
      title: Text("Welcome Guest", style: TextStyle(color: ColorConst.textAppBar)),

      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.search, color: ColorConst.iconDarkGrey)),
        Center(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorConst.primary,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            ),

            child: Text("Login"),
          ),
        ),
        spacerWidth(8),
      ],
    );
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("Success Stories", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: ColorConst.textBlue)),
        spacerHeight(5),
        SizedBox(
          height: 180,
          child: ListView.separated(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => spacerWidth(5),
            itemBuilder: (context, index) {
              return SuccessStoriesCard();
            },
          ),
        ),
      ],
    );
  }

  Widget featuredTestSeries() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("Featured Test Series", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: ColorConst.textBlue)),
        spacerHeight(5),
        SizedBox(
          height: 250,
          child: ListView.separated(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => spacerWidth(5),
            itemBuilder: (context, index) {
              return FeaturedTestSeriesCard();
            },
          ),
        ),
      ],
    );
  }

  Widget _featuredCourses() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("Featured Courses", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: ColorConst.textBlue)),
        spacerHeight(5),
        SizedBox(
          height: 250,
          child: ListView.separated(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => spacerWidth(5),
            itemBuilder: (context, index) {
              return FeaturedCoursesCard();
            },
          ),
        ),
      ],
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
