import 'package:flutter/material.dart';
import 'package:spotify_clone/core/config/assets/app_styles.dart';
import 'package:spotify_clone/core/config/theme/app_colors.dart';

class TabsView extends StatefulWidget {
  const TabsView({super.key});

  @override
  State<TabsView> createState() => _TabsViewState();
}

class _TabsViewState extends State<TabsView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelStyle: AppStyles.styleBold13(),
      labelColor: Colors.white,
      indicatorPadding: EdgeInsets.only(bottom: -5),
      indicatorColor: AppColors.primaryColor,
      isScrollable: false,
      dividerColor: Colors.transparent,
      controller: tabController,
      padding: EdgeInsets.symmetric(
        horizontal: 2,
      ),
      tabs: [
        Text(
          "New",
        ),
        Text(
          "Videos",
        ),
        Text(
          "Artists",
        ),
        Text(
          "Podcasts",
        ),
      ],
    );
  }
}
