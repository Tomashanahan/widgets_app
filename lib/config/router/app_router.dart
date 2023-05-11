import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/screens/screens.dart';

final List<RouteBase> dynamicRoutes = menuItems
    .map(
      (item) => GoRoute(
        path: item.link,
        name: item.routeName,
        builder: (context, state) => item.routeComponentName,
      ),
    )
    .toList();

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
    ...dynamicRoutes
  ],
);
