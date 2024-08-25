import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:spotify_clone/core/config/assets/app_styles.dart';
import 'package:spotify_clone/core/config/assets/vectors.dart';
import 'package:spotify_clone/core/config/theme/app_colors.dart';
import 'package:spotify_clone/core/widgets/basic_appbar.dart';
import 'package:spotify_clone/presentation/features/home/widgets/custom_card.dart';
import 'package:spotify_clone/presentation/features/home/widgets/tabs_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
        child: const Column(
          children: [Gap(30), CustomCard(), Gap(40), TabsView()],
        ),
      ),
    );
  }
}
