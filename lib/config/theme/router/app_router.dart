import 'package:go_router/go_router.dart';
import 'package:wingets_app/presentation/screens/counter/counter_screen.dart';
import 'package:wingets_app/presentation/screens/screens.dart';
import 'package:wingets_app/presentation/screens/theme_change/theme_change_screen.dart';
import 'package:wingets_app/menu/menu_items.dart';

// GoRouter configuration
final appRouter = GoRouter(
  routes: [
    GoRoute(
      name: HomeScreen.name,
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      name: ButtonsScreen.name,
      path: AppRoutes.buttons,
      builder: (context, state) => ButtonsScreen(),
    ),
    GoRoute(
      name: CardsScreen.name,
      path: AppRoutes.cards,
      builder: (context, state) => CardsScreen(),
    ),
    GoRoute(
      name: ProgressScreen.name,
      path: AppRoutes.progress,
      builder: (context, state) => ProgressScreen(),
    ),
    GoRoute(
      name: AppTutorialScreen.name,
      path: AppRoutes.tutorial,
      builder: (context, state) => AppTutorialScreen(),
    ),
    GoRoute(
      name: InfiniteScrollScreen.name,
      path: AppRoutes.infinite,
      builder: (context, state) => InfiniteScrollScreen(),
    ),
    GoRoute(
      name: SnackbarScreen.name,
      path: AppRoutes.snackbar,
      builder: (context, state) => SnackbarScreen(),
    ),
    GoRoute(
      name: UiControlsScreen.name,
      path: AppRoutes.uiControls,
      builder: (context, state) => UiControlsScreen(),
    ),
    GoRoute(
      name: AnimatedScreen.name,
      path: AppRoutes.animated,
      builder: (context, state) => AnimatedScreen(),
    ),
    GoRoute(
      name: CounterScreen.name,
      path: AppRoutes.counter,
      builder: (context, state) => CounterScreen(),
    ),
    GoRoute(
      name: ThemeChangeScreen.name,
      path: AppRoutes.themeChange,
      builder: (context, state) => ThemeChangeScreen(),
    ),
  ],
);
