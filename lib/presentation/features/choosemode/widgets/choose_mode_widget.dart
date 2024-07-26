import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:spotify_clone/core/config/assets/vectors.dart';
import 'package:spotify_clone/core/config/theme/app_colors.dart';

class ChooseModeWidget extends StatefulWidget {
  const ChooseModeWidget({
    super.key,
  });

  @override
  State<ChooseModeWidget> createState() => _ChooseModeWidgetState();
}

class _ChooseModeWidgetState extends State<ChooseModeWidget> {
  int activeOption = 0;

  void changeIndex(index) {
    setState(() {
      activeOption = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            changeIndex(0);
          },
          child: ChooseModeOption(
              iconName: AssetsVectors.vectorsMoon,
              isSelected: activeOption == 0),
        ),
        Gap(50),
        GestureDetector(
          onTap: () {
            changeIndex(1);
          },
          child: ChooseModeOption(
              iconName: AssetsVectors.vectorsSun,
              isSelected: activeOption == 1),
        )
      ],
    );
  }
}

class ChooseModeOption extends StatelessWidget {
  const ChooseModeOption({
    super.key,
    required this.iconName,
    required this.isSelected,
  });

  final String iconName;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveChooseModeItem(iconName: iconName)
        : InactiveChooseModeItem(iconName: iconName);
  }
}

class InactiveChooseModeItem extends StatelessWidget {
  const InactiveChooseModeItem({
    super.key,
    required this.iconName,
  });

  final String iconName;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.all(22),
          decoration: const ShapeDecoration(
            shape: CircleBorder(),
          ),
          child: SvgPicture.asset(iconName),
        ),
      ),
    );
  }
}

class ActiveChooseModeItem extends StatelessWidget {
  const ActiveChooseModeItem({
    super.key,
    required this.iconName,
  });

  final String iconName;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        Positioned(
          bottom: 10,
          right: 2,
          child: Container(
            height: 50,
            width: 50,
            decoration: const ShapeDecoration(
                color: AppColors.primaryColor, shape: CircleBorder()),
          ),
        ),
        ClipOval(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              padding: const EdgeInsets.all(22),
              decoration: const ShapeDecoration(
                shape: CircleBorder(),
              ),
              child: SvgPicture.asset(iconName),
            ),
          ),
        ),
      ],
    );
  }
}
