import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_clone/core/config/assets/app_styles.dart';
import 'package:spotify_clone/core/config/assets/vectors.dart';
import 'package:spotify_clone/core/config/constants/app_const.dart';
import 'package:spotify_clone/core/config/theme/app_colors.dart';
import 'package:spotify_clone/presentation/features/authentication/widgets/signin_form.dart';
import 'package:spotify_clone/common/widgets/app_bar/basic_appbar.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        leadingonPressed: () {
          GoRouter.of(context).pop();
        },
        hasBG: true,
        leadinIcon: Icons.arrow_back_ios_new_rounded,
        title: SvgPicture.asset(
          AssetsVectors.vectorsSpotifyLogo,
          height: 30,
          width: 30,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              const Gap(50),
              Text(
                "Sign in",
                style: AppStyles.styleBold30(),
              ),
              const Gap(22),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "If you need any support ",
                    style: AppStyles.styleRegular12(),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Click here",
                      style: AppStyles.styleRegular12()
                          .copyWith(color: AppColors.primaryColor),
                    ),
                  ),
                ],
              ),
              const Gap(30),
              const SigninForm(),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Not A Member ?"),
                  TextButton(
                      onPressed: () {
                        GoRouter.of(context).pushReplacement(AppConstants.kRegisterPage);
                      },
                      child: Text(
                        "Register Now",
                        style: AppStyles.styleMedium14()
                            .copyWith(color: Colors.blue),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
