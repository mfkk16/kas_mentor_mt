import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kas_mentor_mt/domain/config/theme/colors.dart';
import 'package:kas_mentor_mt/presentation/widgets/featured_test_series_card.dart';
import 'package:kas_mentor_mt/presentation/widgets/spacer.dart';
import 'package:kas_mentor_mt/presentation/widgets/success_stories_card.dart';

import '../../application/landing_controller.dart';
import '../../domain/config/route/route_const.dart';
import '../../domain/core/resource/data_state.dart';
import '../../domain/models/api_response.dart';
import '../widgets/cat_card.dart';
import '../widgets/featured_courses_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<FeaturedTest>? _featuredTests;
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
                  _featuredTests = (snapshot.data as DataSuccess).data.message.featuredTests;
                  return _body(snapshot.data!.data);
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
        IconButton(
          onPressed: () {
            if (_featuredTests != null) {
              Get.toNamed(discoverViewRoute, arguments: _featuredTests);
            }
          },

          icon: Icon(Icons.search, color: ColorConst.iconDarkGrey),
        ),
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

  _body(AllDataModel allDataModel) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          _catCardBuilder(allDataModel.message.highlights),
          spacerHeight(20),
          _featuredCourses(allDataModel.message.featuredCourses),
          spacerHeight(20),
          featuredTestSeries(allDataModel.message.featuredTests),
          spacerHeight(20),
          successStories(allDataModel.message.successStories),
          spacerHeight(20),
          _devInfo(allDataModel.message.bottomText),
          spacerHeight(10),
        ],
      ),
    );
  }

  Widget successStories(List<SuccessStory> successStories) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("Success Stories", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: ColorConst.textBlue)),
        spacerHeight(5),
        SizedBox(
          height: 180,
          child: ListView.separated(
            itemCount: successStories.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => spacerWidth(5),
            itemBuilder: (context, index) {
              return SuccessStoriesCard(successStories[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget featuredTestSeries(List<FeaturedTest> featuredTests) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("Featured Test Series", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: ColorConst.textBlue)),
        spacerHeight(5),
        SizedBox(
          height: 250,
          child: ListView.separated(
            itemCount: featuredTests.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => spacerWidth(5),
            itemBuilder: (context, index) {
              return FeaturedTestSeriesCard(featuredTests[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _featuredCourses(List<FeaturedCourse> featuredCourses) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("Featured Courses", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: ColorConst.textBlue)),
        spacerHeight(5),
        SizedBox(
          height: 250,
          child: ListView.separated(
            itemCount: featuredCourses.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => spacerWidth(5),
            itemBuilder: (context, index) {
              return FeaturedCoursesCard(featuredCourses[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _catCardBuilder(List<Highlight> highlights) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        itemCount: highlights.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => spacerWidth(10),
        itemBuilder: (context, index) {
          return CatCard(highlights[index]);
        },
      ),
    );
  }

  Widget _devInfo(String bottomText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(bottomText, style: TextStyle(color: ColorConst.textBlack.withOpacity(0.7), fontSize: 25, fontWeight: FontWeight.bold)),
        spacerHeight(5),
        Text(
          "Developed with ❤️ in Trivandrum, India",
          style: TextStyle(color: ColorConst.textBlack.withOpacity(0.7), fontWeight: FontWeight.w100),
        ),
      ],
    );
  }
}
