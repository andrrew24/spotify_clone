import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_clone/common/widgets/button/basic_app_button.dart';
import 'package:spotify_clone/core/config/assets/app_styles.dart';
import 'package:spotify_clone/core/config/assets/images.dart';
import 'package:spotify_clone/core/config/assets/vectors.dart';
import 'package:spotify_clone/core/constants/const.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding:
            const EdgeInsets.only(top: 45, bottom: 50, right: 30, left: 30),
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(Assets.imagesIntroBg),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(AssetsVectors.vectorsSpotifyLogo),
            const Spacer(),
            Text(
              "Enjoy Listening To Music",
              style: AppStyles.styleBold25().copyWith(color: Colors.white),
            ),
            const Gap(30),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis enim purus sed phasellus. Cursus ornare id scelerisque aliquam.",
              style: AppStyles.styleRegular17().copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const Gap(30),
            BasicAppButton(
                title: "Get Started",
                onPressed: () {
                  GoRouter.of(context).push(kchooseMode);
                })
          ],
        ),
      ),
    );
  }
}
