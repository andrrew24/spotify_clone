import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_clone/common/widgets/basic_app_button.dart';
import 'package:spotify_clone/core/config/assets/app_styles.dart';
import 'package:spotify_clone/core/config/assets/images.dart';
import 'package:spotify_clone/core/config/assets/vectors.dart';
import 'package:spotify_clone/core/constants/const.dart';
import 'package:spotify_clone/core/widgets/basic_appbar.dart';

class RegisterOrSignupPage extends StatelessWidget {
  const RegisterOrSignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BasicAppBar(),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(AssetsVectors.vectorsTopPattern),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(AssetsVectors.vectorsBottomPattern),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(AssetsImages.imagesAuthBg),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AssetsVectors.vectorsSpotifyLogo,
                  height: 70,
                ),
                const Gap(40),
                Text(
                  "Enjoy listening to music",
                  style: AppStyles.styleBold25(),
                ),
                const Gap(18),
                Text(
                  textAlign: TextAlign.center,
                  "Spotify is a proprietary Swedish audio streaming and media services provider ",
                  style: AppStyles.styleRegular17(),
                ),
                const Gap(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: BasicAppButton(
                        title: "Register",
                        onPressed: () {
                          GoRouter.of(context).push(kRegisterPage);
                        },
                      ),
                    ),
                    const Gap(90),
                    TextButton(
                        onPressed: () {
                          GoRouter.of(context).push(kSignInPage);
                        },
                        child:
                            Text("Sign in", style: AppStyles.styleMedium19()))
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}