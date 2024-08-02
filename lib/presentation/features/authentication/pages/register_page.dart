import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_clone/core/config/assets/app_styles.dart';
import 'package:spotify_clone/core/config/assets/vectors.dart';
import 'package:spotify_clone/core/config/theme/app_colors.dart';
import 'package:spotify_clone/core/constants/const.dart';
import 'package:spotify_clone/presentation/features/authentication/widgets/register_form.dart';
import 'package:spotify_clone/core/widgets/basic_appbar.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
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
                "Register",
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
              const Gap(25),
              const RegisterForm(),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Do You Have An Account ?"),
                  TextButton(
                    onPressed: () {
                      GoRouter.of(context).pushReplacement(kSignInPage);
                    },
                    child: Text(
                      "Sign in",
                      style: AppStyles.styleMedium14()
                          .copyWith(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
