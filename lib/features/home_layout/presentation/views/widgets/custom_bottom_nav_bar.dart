import 'package:exam_app/core/constants/app_strings/app_strings.dart';
import 'package:exam_app/core/styles/app_colors.dart';
import 'package:exam_app/core/styles/assets.gen.dart';
import 'package:exam_app/features/home_layout/helper/home_layout_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_bottom_nav_bar_item.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  late HomeLayoutEnum _homeLayoutEnum;
  @override
  void initState() {
    _homeLayoutEnum = HomeLayoutEnum.explore;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      decoration: BoxDecoration(color: AppColors.kLightBlueColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        spacing: 8.w,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _homeLayoutEnum = HomeLayoutEnum.explore;
              });
            },
            child: CustomBottomNavBarItem(
              icon: Assets.icons.homeIcon.svg(),
              label: AppStrings.explore,
              isSelected: _homeLayoutEnum == HomeLayoutEnum.explore,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _homeLayoutEnum = HomeLayoutEnum.result;
              });
            },
            child: CustomBottomNavBarItem(
              icon: Assets.icons.resultIcon.svg(),
              label: AppStrings.result,
              isSelected: _homeLayoutEnum == HomeLayoutEnum.result,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _homeLayoutEnum = HomeLayoutEnum.profile;
              });
            },
            child: CustomBottomNavBarItem(
              icon: Assets.icons.profileIcon.svg(),
              label: AppStrings.profile,
              isSelected: _homeLayoutEnum == HomeLayoutEnum.profile,
            ),
          ),
        ],
      ),
    );
  }
}
