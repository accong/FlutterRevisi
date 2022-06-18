part of 'dashboard_cubit.dart';

enum NavBarItem { home, explore, favorite, profile }

class DashboardState extends Equatable {

  final NavBarItem navBarItem;

  const DashboardState({required this.navBarItem});

  @override
  List<Object> get props => [navBarItem];
}
