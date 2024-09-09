import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:spotify_clone/core/config/assets/app_styles.dart';
import 'package:spotify_clone/core/config/assets/vectors.dart';
import 'package:spotify_clone/core/config/theme/app_colors.dart';
import 'package:spotify_clone/core/widgets/basic_appbar.dart';
import 'package:spotify_clone/presentation/features/home/manager/cubit/get_new_songs_cubit.dart';
import 'package:spotify_clone/presentation/features/home/widgets/custom_card.dart';
import 'package:spotify_clone/presentation/features/home/widgets/new_songs_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        trailingIcon: FontAwesomeIcons.ellipsisVertical,
        trailingonPressed: () {},
        title: SvgPicture.asset(
          AssetsVectors.vectorsSpotifyLogo,
          height: 30,
          width: 30,
        ),
        leadinIcon: FontAwesomeIcons.magnifyingGlass,
        hasBG: false,
        leadingonPressed: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Gap(30),
            const CustomCard(),
            const Gap(40),
            _tabs(),
            SizedBox(
              height: 260,
              child: TabBarView(controller: _tabController, children: [
                const NewSongsList(),
                Container(),
                Container(),
                Container(),
              ]),
            )
          ],
        ),
      ),
    );
  }

  Widget _tabs() {
    return TabBar(
      labelStyle: AppStyles.styleBold13(),
      labelColor: Colors.white,
      indicatorPadding: const EdgeInsets.only(bottom: -5),
      indicatorColor: AppColors.primaryColor,
      isScrollable: false,
      dividerColor: Colors.transparent,
      controller: _tabController,
      padding: const EdgeInsets.symmetric(
        horizontal: 2,
      ),
      tabs: const [
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
