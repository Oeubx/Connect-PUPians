import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? HomepageWidget() : SignInWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? HomepageWidget() : SignInWidget(),
        ),
        FFRoute(
          name: MenuWidget.routeName,
          path: MenuWidget.routePath,
          builder: (context, params) => MenuWidget(),
        ),
        FFRoute(
          name: UserProfileWidget.routeName,
          path: UserProfileWidget.routePath,
          builder: (context, params) => UserProfileWidget(),
        ),
        FFRoute(
          name: EditProfileWidget.routeName,
          path: EditProfileWidget.routePath,
          builder: (context, params) => EditProfileWidget(),
        ),
        FFRoute(
          name: NotificationsWidget.routeName,
          path: NotificationsWidget.routePath,
          builder: (context, params) => NotificationsWidget(),
        ),
        FFRoute(
          name: MessagesWidget.routeName,
          path: MessagesWidget.routePath,
          builder: (context, params) => MessagesWidget(),
        ),
        FFRoute(
          name: ClassesWidget.routeName,
          path: ClassesWidget.routePath,
          builder: (context, params) => ClassesWidget(),
        ),
        FFRoute(
          name: StudyWidget.routeName,
          path: StudyWidget.routePath,
          builder: (context, params) => StudyWidget(),
        ),
        FFRoute(
          name: HomepageWidget.routeName,
          path: HomepageWidget.routePath,
          builder: (context, params) => HomepageWidget(),
        ),
        FFRoute(
          name: PersonalChatPageWidget.routeName,
          path: PersonalChatPageWidget.routePath,
          builder: (context, params) => PersonalChatPageWidget(
            personalReceiveChats: params.getParam(
              'personalReceiveChats',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['chats'],
            ),
            chosenOneRef: params.getParam(
              'chosenOneRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
            initiatorRef: params.getParam(
              'initiatorRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: AppSettingsWidget.routeName,
          path: AppSettingsWidget.routePath,
          builder: (context, params) => AppSettingsWidget(),
        ),
        FFRoute(
          name: UsersWidget.routeName,
          path: UsersWidget.routePath,
          builder: (context, params) => UsersWidget(),
        ),
        FFRoute(
          name: WholePostUIWidget.routeName,
          path: WholePostUIWidget.routePath,
          builder: (context, params) => WholePostUIWidget(
            docref: params.getParam(
              'docref',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['posts'],
            ),
            userref: params.getParam(
              'userref',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: OtherUserProfileWidget.routeName,
          path: OtherUserProfileWidget.routePath,
          builder: (context, params) => OtherUserProfileWidget(
            userRef: params.getParam(
              'userRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: ForgotPwWidget.routeName,
          path: ForgotPwWidget.routePath,
          builder: (context, params) => ForgotPwWidget(),
        ),
        FFRoute(
          name: ChangeEmailWidget.routeName,
          path: ChangeEmailWidget.routePath,
          builder: (context, params) => ChangeEmailWidget(),
        ),
        FFRoute(
          name: ChangePwWidget.routeName,
          path: ChangePwWidget.routePath,
          builder: (context, params) => ChangePwWidget(),
        ),
        FFRoute(
          name: StudyFeedbackUIWidget.routeName,
          path: StudyFeedbackUIWidget.routePath,
          builder: (context, params) => StudyFeedbackUIWidget(
            studypostsref: params.getParam(
              'studypostsref',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['study_posts'],
            ),
            userref: params.getParam(
              'userref',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: SignUpWidget.routeName,
          path: SignUpWidget.routePath,
          builder: (context, params) => SignUpWidget(),
        ),
        FFRoute(
          name: SignInWidget.routeName,
          path: SignInWidget.routePath,
          builder: (context, params) => SignInWidget(),
        ),
        FFRoute(
          name: ListOfGrpsWidget.routeName,
          path: ListOfGrpsWidget.routePath,
          builder: (context, params) => ListOfGrpsWidget(),
        ),
        FFRoute(
          name: MainGrpUIWidget.routeName,
          path: MainGrpUIWidget.routePath,
          builder: (context, params) => MainGrpUIWidget(
            groupref: params.getParam(
              'groupref',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Groups'],
            ),
          ),
        ),
        FFRoute(
          name: CreateGrpWidget.routeName,
          path: CreateGrpWidget.routePath,
          builder: (context, params) => CreateGrpWidget(),
        ),
        FFRoute(
          name: GroupUsersWidget.routeName,
          path: GroupUsersWidget.routePath,
          builder: (context, params) => GroupUsersWidget(
            groupref: params.getParam(
              'groupref',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Groups'],
            ),
          ),
        ),
        FFRoute(
          name: CreateGcWidget.routeName,
          path: CreateGcWidget.routePath,
          builder: (context, params) => CreateGcWidget(),
        ),
        FFRoute(
          name: GroupChatPageWidget.routeName,
          path: GroupChatPageWidget.routePath,
          builder: (context, params) => GroupChatPageWidget(
            groupchatRef: params.getParam(
              'groupchatRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['groupchat'],
            ),
          ),
        ),
        FFRoute(
          name: GcSettingsWidget.routeName,
          path: GcSettingsWidget.routePath,
          builder: (context, params) => GcSettingsWidget(
            gcRef: params.getParam(
              'gcRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['groupchat'],
            ),
          ),
        ),
        FFRoute(
          name: ClassUIWidget.routeName,
          path: ClassUIWidget.routePath,
          builder: (context, params) => ClassUIWidget(
            classesRef: params.getParam(
              'classesRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['classes'],
            ),
          ),
        ),
        FFRoute(
          name: ClassesInfoWidget.routeName,
          path: ClassesInfoWidget.routePath,
          builder: (context, params) => ClassesInfoWidget(
            classesRef: params.getParam(
              'classesRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['classes'],
            ),
          ),
        ),
        FFRoute(
          name: CreateClassWidget.routeName,
          path: CreateClassWidget.routePath,
          builder: (context, params) => CreateClassWidget(),
        ),
        FFRoute(
          name: WholePostInClassUIWidget.routeName,
          path: WholePostInClassUIWidget.routePath,
          builder: (context, params) => WholePostInClassUIWidget(
            docref: params.getParam(
              'docref',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['posts'],
            ),
            userref: params.getParam(
              'userref',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
            classRef: params.getParam(
              'classRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['classes'],
            ),
          ),
        ),
        FFRoute(
          name: MatActUIWidget.routeName,
          path: MatActUIWidget.routePath,
          builder: (context, params) => MatActUIWidget(
            classmatRef: params.getParam(
              'classmatRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['classes', 'classes_materials'],
            ),
            classRef: params.getParam(
              'classRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['classes'],
            ),
          ),
        ),
        FFRoute(
          name: WholePostUIOfGroupWidget.routeName,
          path: WholePostUIOfGroupWidget.routePath,
          builder: (context, params) => WholePostUIOfGroupWidget(
            docref: params.getParam(
              'docref',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['posts'],
            ),
            userref: params.getParam(
              'userref',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
            groupRef: params.getParam(
              'groupRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Groups'],
            ),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/signIn';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/CPUP_LOGO.png',
                    fit: BoxFit.contain,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  name: state.name,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(
                  key: state.pageKey, name: state.name, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
