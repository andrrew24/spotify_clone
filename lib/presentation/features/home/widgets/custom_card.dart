import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:spotify_clone/core/config/assets/app_styles.dart';
import 'package:spotify_clone/core/config/theme/app_colors.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(20)),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.centerLeft,
          children: [
            Positioned(
                right: 0,
                top: 0,
                child: SvgPicture.asset("assets/vectors/top_pattern.svg")),
            Positioned(
              bottom: 0,
              right: 30,
              child: Image.asset("assets/images/home_artist.png"),
            ),
            Positioned(
              top: 10,
              left: 15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "New album",
                    style: AppStyles.styleRegular12(),
                  ),
                  const Gap(5),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 150),
                    child: Text(
                      "Happier Than Ever",
                      style: AppStyles.styleMedium19(),
                    ),
                  ),
                  const Gap(5),
                  Text(
                    "Billie Eilish",
                    style: AppStyles.styleBold13(),
                  ),
                  const Gap(5),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
