import 'package:go_router/go_router.dart';

import '../../ui/pages/pages.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: MadreLienzoPage.routerName,
      path: '/',
      builder: (context, state) => const MadreLienzoPage(),
    ),
  ],
);
