import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_clone/core/config/assets/vectors.dart';

class SigninRegisterAppBar extends StatelessWidget {
  const SigninRegisterAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        const Gap(60),
        SvgPicture.asset(
          AssetsVectors.vectorsSpotifyLogo,
          height: 35,
        ),
      ],
    );
  }
}
