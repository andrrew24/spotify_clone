import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_clone/common/widgets/basic_app_button.dart';
import 'package:spotify_clone/core/config/assets/app_styles.dart';
import 'package:spotify_clone/core/config/assets/images.dart';
import 'package:spotify_clone/core/config/assets/vectors.dart';
import 'package:spotify_clone/core/constants/const.dart';
import 'package:spotify_clone/presentation/features/choosemode/widgets/choose_mode_widget.dart';

class ChooseModePage extends StatelessWidget {
  const ChooseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding:
            const EdgeInsets.only(top: 45, bottom: 50, right: 30, left: 30),
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(AssetsImages.imagesChooseModeBg),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(AssetsVectors.vectorsSpotifyLogo),
            const Spacer(),
            Text(
              "Choose Mode",
              style: AppStyles.styleBold22(),
            ),
            const Gap(30),
            const ChooseModeWidget(),
            const Gap(130),
            BasicAppButton(
                title: "Continue",
                onPressed: () {
                  GoRouter.of(context).push(kRegisterOrSignup);
                })
          ],
        ),
      ),
    );
  }
}
