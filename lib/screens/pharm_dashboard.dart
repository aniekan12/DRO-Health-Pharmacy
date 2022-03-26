import 'package:dro_health_phamarcy/screens/community/community_view.dart';
import 'package:dro_health_phamarcy/screens/doctors/doctors_view.dart';
import 'package:dro_health_phamarcy/screens/home/home_view.dart';
import 'package:dro_health_phamarcy/screens/pharmacy/pharmacy_view.dart';
import 'package:dro_health_phamarcy/screens/profile/profile_view.dart';
import 'package:dro_health_phamarcy/utils/colors.dart';
import 'package:dro_health_phamarcy/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PharmDahsboard extends StatefulWidget {
  const PharmDahsboard({Key? key}) : super(key: key);

  @override
  State<PharmDahsboard> createState() => _PharmDahsboardState();
}

class _PharmDahsboardState extends State<PharmDahsboard>
    with WidgetsBindingObserver {
  PageController _pageController = PageController();
  List<Widget>? dashboardPages;
  int currentPage = 0;
  void onItemSelected(int index) {
    _pageController.jumpToPage(
      index,
    );
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addObserver(this);

    dashboardPages = [
      const HomeView(),
      const DoctorsView(),
      const PharmacyView(),
      const CommunityView(),
      const ProfileView(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: dashboardPages!,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            currentPage = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onItemSelected,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.white,
        elevation: 80,
        selectedItemColor: AppColors.droPurple,
        unselectedItemColor: AppColors.darkGrey,
        selectedFontSize: 14.0,
        currentIndex: currentPage,
        unselectedLabelStyle: TextStyle(
          color: AppColors.darkGrey,
          fontSize: 15.sp,
        ),
        selectedLabelStyle: TextStyle(
          color: AppColors.darkGrey,
          fontSize: 15.sp,
        ),
        unselectedFontSize: 14.0,
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.fromLTRB(0, 9, 0, 6),
              child: SvgPicture.asset("$SVG_ASSETS_BASE/home.svg"),
            ),
            activeIcon: Padding(
              padding: EdgeInsets.fromLTRB(0, 9, 0, 6),
              child: SvgPicture.asset(
                "$SVG_ASSETS_BASE/home.svg",
                color: AppColors.droPurple,
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.fromLTRB(0, 9, 0, 6),
              child: SvgPicture.asset("$SVG_ASSETS_BASE/doctors.svg"),
            ),
            activeIcon: Padding(
              padding: EdgeInsets.fromLTRB(0, 9, 0, 6),
              child: SvgPicture.asset(
                "$SVG_ASSETS_BASE/doctors.svg",
                color: AppColors.droPurple,
              ),
            ),
            label: 'Doctors',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.fromLTRB(0, 9, 0, 6),
              child: SvgPicture.asset("$SVG_ASSETS_BASE/pharm.svg"),
            ),
            activeIcon: Padding(
              padding: EdgeInsets.fromLTRB(0, 9, 0, 6),
              child: SvgPicture.asset(
                "$SVG_ASSETS_BASE/pharm.svg",
                color: AppColors.droPurple,
              ),
            ),
            label: "Pharmacy",
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.fromLTRB(0, 9, 0, 6),
              child: SvgPicture.asset("$SVG_ASSETS_BASE/community.svg"),
            ),
            activeIcon: Padding(
              padding: EdgeInsets.fromLTRB(0, 9, 0, 6),
              child: SvgPicture.asset(
                "$SVG_ASSETS_BASE/community.svg",
                color: AppColors.droPurple,
              ),
            ),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.fromLTRB(0, 9, 0, 6),
              child: SvgPicture.asset("$SVG_ASSETS_BASE/profile.svg"),
            ),
            activeIcon: Padding(
              padding: EdgeInsets.fromLTRB(0, 9, 0, 6),
              child: SvgPicture.asset(
                "$SVG_ASSETS_BASE/profile.svg",
                color: AppColors.droPurple,
              ),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
