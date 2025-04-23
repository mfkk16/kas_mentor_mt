import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kas_mentor_mt/domain/config/theme/colors.dart';
import 'package:kas_mentor_mt/domain/constants/assets.dart';
import 'package:kas_mentor_mt/presentation/widgets/spacer.dart';

import '../widgets/discover_courses_card.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    final featuredTests = Get.arguments;

    return Scaffold(
      appBar: _appBar(context),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Exam...',
                contentPadding: EdgeInsets.all(0),
                prefixIcon: SizedBox(
                  height: 50,
                  width: 50,
                  child: Center(child: ImageIcon(AssetImage(Assets.search), color: ColorConst.iconLightGrey, size: 20)),
                ),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ImageIcon(AssetImage(Assets.record), color: ColorConst.iconLightGrey, size: 20),
                    spacerWidth(10),
                    ImageIcon(AssetImage(Assets.camera), color: ColorConst.iconLightGrey, size: 20),
                    spacerWidth(10),
                    ImageIcon(AssetImage(Assets.close), color: ColorConst.iconLightGrey, size: 20),
                    spacerWidth(10),
                  ],
                ),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0),borderSide: BorderSide(color: ColorConst.iconLightGrey)),
              ),
            ),
          ),
          // Recent searches
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Recent Searches', style: TextStyle(fontSize: 16)),
                SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [_recentSearch('High Court Assistant'), spacerHeight(10), _recentSearch('Common Degree Prelims')],
                ),
              ],
            ),
          ),
          // Filter and sort options
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                OutlinedButton.icon(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
                  icon: ImageIcon(AssetImage(Assets.filter), color: ColorConst.iconLightGrey, size: 15),
                  label: Text('Filters', style: TextStyle(color: ColorConst.textBlack)),
                ),
                Spacer(),
                ImageIcon(AssetImage(Assets.question), color: ColorConst.primary, size: 15),
                spacerWidth(10),
                ImageIcon(AssetImage(Assets.menu), color: ColorConst.iconLightGrey, size: 15),
                spacerWidth(5),
                TextButton.icon(
                  onPressed: () {},
                  label: ImageIcon(AssetImage(Assets.downArrow), color: ColorConst.iconLightGrey, size: 15),
                   icon: Text('Most Popular', style: TextStyle(color: ColorConst.textBlack)),
                ),
              ],
            ),
          ),
          // Grid of exam cards
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio: 1,
                children:
                    featuredTests.map<Widget>((test) {
                      return DiscoverCoursesCard(test);
                    }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _recentSearch(String s) {
    return Row(
      children: [
        ImageIcon(AssetImage(Assets.recent), color: ColorConst.iconLightGrey, size: 15),
        spacerWidth(10),
        Text(s, style: TextStyle(color: ColorConst.textBlack)),
        Spacer(),
        ImageIcon(AssetImage(Assets.close), color: ColorConst.iconLightGrey, size: 15),
      ],
    );
  }

  _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: ColorConst.backgroundWhite,
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: ImageIcon(AssetImage(Assets.back), color: ColorConst.iconDarkGrey, size: 15),
      ),
      title: Text('Discover', style: TextStyle(color: ColorConst.textBlue)),
      centerTitle: true,
    );
  }
}
