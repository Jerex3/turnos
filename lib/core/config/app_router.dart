import 'package:go_router/go_router.dart';
import 'package:tnpd/core/config/service_locator.dart';
import 'package:tnpd/domain/models/turno.dart';
import 'package:tnpd/global/cubit/auth/auth_cubit.dart';
import 'package:tnpd/presentation/auth/auth_check.dart';
import 'package:tnpd/presentation/auth/auth_login.dart';
import 'package:tnpd/presentation/feed/feed_page.dart';
import 'package:tnpd/presentation/home_layout/widgets/custom_layout.dart';
import 'package:tnpd/presentation/profile/profile_page.dart';
import 'package:tnpd/presentation/turno/turno_page.dart';

// GoRouter configuration
final router = GoRouter(
  refreshListenable: sl<AuthCubit>(),
  redirect: (context, state) {
    final authCubit = sl<AuthCubit>();

    if (authCubit.state.loadingAuthentication) return '/';

    if (authCubit.state.userCredential == null) return '/login';

    if (state.matchedLocation == "/" || state.matchedLocation == "/login")
      return '/feed';

    return state.matchedLocation;
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => AuthCheck(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => AuthLogin(),
    ),

    StatefulShellRoute.indexedStack(
      branches: [
        StatefulShellBranch(
          routes: [
          GoRoute(
            path: '/feed',
            builder: (context, state) {
              return FeedPage();
            },
          ),
          GoRoute(
            path: '/turno',
            builder: (context, state) {
              return TurnoPage(
                turno: state.extra as Turno,
              );
            },
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/profile',
            builder: (context, state) {
              return const ProfilePage();
            },
          ),
        ])
      ],
      builder: (context, state, navigationShell) =>
          CustomLayout(child: navigationShell),
    )
  ],
);
