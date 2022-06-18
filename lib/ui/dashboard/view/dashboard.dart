import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripkuy/core/app/app.dart';
import 'package:tripkuy/core/util/util.dart';
import 'package:tripkuy/ui/dashboard/cubit/dashboard_cubit.dart';
import 'package:tripkuy/ui/destination/destination_view.dart';
import 'package:tripkuy/ui/explore/view/explore_view.dart';
import 'package:tripkuy/ui/favorite/view/favorite_view.dart';
import 'package:tripkuy/ui/home/home.dart';
import 'package:tripkuy/ui/profile/view/profile_view.dart';
import 'package:tripkuy/ui/tourguide/tourguide.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key, this.page = 0}) : super(key: key);
  final int page;

  final DashboardCubit dashboardCubit = DashboardCubit();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
        create: (context) => dashboardCubit..pickItem(page),
        child: Scaffold(
          extendBody: true,
          resizeToAvoidBottomInset: false,
          body: WillPopScope(
              onWillPop: () => dashboardCubit.handleWillPop(),
              child: BlocBuilder<DashboardCubit, DashboardState>(
                builder: (context, state) {
                  switch (state.navBarItem) {
                    case NavBarItem.home:
                      return const HomeView();
                    case NavBarItem.explore:
                      return const ExploreView();
                    case NavBarItem.favorite:
                      return const FavoriteView();
                    case NavBarItem.profile:
                      return const ProfileView();
                    default:
                      return Container();
                  }
                },
              )),
          bottomNavigationBar: buildBottomNavigation(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          // floatingActionButton: _buildFloatingActionButton(),
        ));
  }

  Widget buildBottomNavigation() {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: ColorPalette.white,
          currentIndex: state.navBarItem.index,
          unselectedItemColor: ColorPalette.grey,
          selectedItemColor: ColorPalette.blueLight,
          onTap: (index) => dashboardCubit.pickItem(index),
          items: const [
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.home, color: ColorPalette.blueLight),
              icon: Icon(Icons.location_city, color: ColorPalette.grey),
              label: "Home",
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.explore, color: ColorPalette.blueLight),
              icon: Icon(Icons.explore, color: ColorPalette.grey),
              label: "Explore",
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.favorite, color: ColorPalette.blueLight),
              icon: Icon(Icons.favorite, color: ColorPalette.grey),
              label: "Favorite",
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.person, color: ColorPalette.blueLight),
              icon: Icon(Icons.person, color: ColorPalette.grey),
              label: "Profile",
            ),
          ],
        );
      },
    );
  }
}
