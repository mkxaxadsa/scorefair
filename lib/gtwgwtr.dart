import 'package:go_router/go_router.dart';
import 'package:forLeader/gwtrgwrcrwe/models/actions.dart';
import 'package:forLeader/gwtrgwrcrwe/models/match.dart';
import 'package:forLeader/gtwrgtwrctwr/fdsfsd/community.dart';
import 'package:forLeader/gtwrgtwrctwr/community_screen/community_screen.dart';
import 'package:forLeader/gtwrgtwrctwr/gfhfg/home.dart';
import 'package:forLeader/gtwrgtwrctwr/dsfsdgd/initial_screen.dart';
import 'package:forLeader/gtwrgtwrctwr/fgsdgsd/matcher.dart';
import 'package:forLeader/gtwrgtwrctwr/fgdshsfyh/matches.dart';
import 'package:forLeader/gtwrgtwrctwr/gergre/news.dart';
import 'package:forLeader/gtwrgtwrctwr/yhtyethytver/news_screen.dart';
import 'package:forLeader/gtwrgtwrctwr/gfwgwrgw/settings_screen.dart';

class MyRouter {
  static final GoRouter _router = GoRouter(
    initialLocation: initial,
    routes: [
      GoRoute(
        path: initial,
        name: initial,
        builder: (context, state) => const fasdfdasfdascsa(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            HomeScreen(child: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: matches,
                name: matches,
                builder: (context, state) => const MatchesScreen(),
              ),
              GoRoute(
                path: matchDetail,
                name: matchDetail,
                builder: (context, state) =>
                    MatchDetailScreen(match: state.extra as FootballMatch),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: news,
                name: news,
                builder: (context, state) => const NewsScreen(),
              ),
              GoRoute(
                path: newsDetail,
                name: newsDetail,
                builder: (context, state) =>
                    NewsDetailScreen(dfasfdasf: state.extra as HDUIASd),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: community,
                name: community,
                builder: (context, state) => const CommunityScreen(),
              ),
              GoRoute(
                path: communityDetail,
                name: communityDetail,
                builder: (context, state) =>
                    CommunityDetailScreen(action: state.extra as HDUIASd),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: settings,
                name: settings,
                builder: (context, state) => const SettingsScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
  static GoRouter get router => _router;

  static const String initial = '/initial';
  static const String matches = '/matches';
  static const String matchDetail = '/matchDetail';
  static const String createMatch = '/createMatch';
  static const String createTeam = '/createTeam';
  static const String myMatches = '/myMatches';
  static const String news = '/news';
  static const String newsDetail = '/newsDetail';
  static const String community = '/community';
  static const String communityDetail = '/communityDetail';
  static const String settings = '/settings';
}
