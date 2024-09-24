import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:spotify_clone/common/helper/service_locator.dart';
import 'package:spotify_clone/core/config/assets/app_styles.dart';
import 'package:spotify_clone/core/config/assets/vectors.dart';
import 'package:spotify_clone/core/config/theme/app_colors.dart';
import 'package:spotify_clone/common/widgets/app_bar/basic_appbar.dart';
import 'package:spotify_clone/data/sources/auth/auth_local_data_source.dart';
import 'package:spotify_clone/presentation/features/home/manager/get_new_songs_cubit/get_new_songs_cubit.dart';
import 'package:spotify_clone/presentation/features/home/widgets/custom_card.dart';
import 'package:spotify_clone/presentation/features/home/widgets/new_songs_list.dart';
import 'package:spotify_clone/presentation/features/home/widgets/playlist.dart';

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
        trailingonPressed: () async {
          print(pb.authStore.model.id);
        },
        title: SvgPicture.asset(
          AssetsVectors.vectorsSpotifyLogo,
          height: 30,
          width: 30,
        ),
        leadinIcon: FontAwesomeIcons.magnifyingGlass,
        hasBG: false,
        leadingonPressed: () {},
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(50),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: CustomCard(),
            ),
            const Gap(40),
            _tabs(),
            const Gap(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: SizedBox(
                height: 220,
                child: TabBarView(controller: _tabController, children: [
                  const NewSongsList(),
                  Container(),
                  Container(),
                  Container(),
                ]),
              ),
            ),
            const Gap(25),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Playlist(),
            )
          ],
        ),
      ),
    );
  }

  Widget _tabs() {
    return TabBar(
      labelStyle: AppStyles.styleBold13(),
      labelColor: AppColors.primaryColor,
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
