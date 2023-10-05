import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth/firebase_auth/firebase_user_provider.dart';
import 'auth/firebase_auth/auth_util.dart';

import 'backend/firebase/firebase_config.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'flutter_flow/nav/nav.dart';
import 'index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  await initFirebase();

  await FlutterFlowTheme.initialize();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  late Stream<BaseAuthUser> userStream;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;

  final authUserSub = authenticatedUserStream.listen((_) {});

  @override
  void initState() {
    super.initState();

    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);
    userStream = wWMSPortalFirebaseUserStream()
      ..listen((user) => _appStateNotifier.update(user));
    jwtTokenStream.listen((_) {});
    Future.delayed(
      Duration(milliseconds: 1000),
      () => _appStateNotifier.stopShowingSplashImage(),
    );
  }

  @override
  void dispose() {
    authUserSub.cancel();

    super.dispose();
  }

  void setLocale(String language) {
    setState(() => _locale = createLocale(language));
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'WWMS Portal',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('en'),
        Locale('fr'),
      ],
      theme: ThemeData(
        brightness: Brightness.light,
        scrollbarTheme: ScrollbarThemeData(),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scrollbarTheme: ScrollbarThemeData(),
      ),
      themeMode: _themeMode,
      routerConfig: _router,
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key? key, this.initialPage, this.page}) : super(key: key);

  final String? initialPage;
  final Widget? page;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPageName = 'Main_Home';
  late Widget? _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPageName = widget.initialPage ?? _currentPageName;
    _currentPage = widget.page;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'Main_Home': MainHomeWidget(),
      'Main_customerList': MainCustomerListWidget(),
      'Main_Events': MainEventsWidget(),
      'Main_messages': MainMessagesWidget(),
      'Main_profilePage': MainProfilePageWidget(),
      'Main_EventsDrafts': MainEventsDraftsWidget(),
      'Main_customerListCopy': MainCustomerListCopyWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPageName);

    return Scaffold(
      body: _currentPage ?? tabs[_currentPageName],
      bottomNavigationBar: Visibility(
        visible: responsiveVisibility(
          context: context,
          tabletLandscape: false,
          desktop: false,
        ),
        child: GNav(
          selectedIndex: currentIndex,
          onTabChange: (i) => setState(() {
            _currentPage = null;
            _currentPageName = tabs.keys.toList()[i];
          }),
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          color: FlutterFlowTheme.of(context).secondaryText,
          activeColor: FlutterFlowTheme.of(context).primary,
          tabBackgroundColor: Color(0x00000000),
          tabBorderRadius: 100.0,
          tabMargin: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
          gap: 0.0,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          duration: Duration(milliseconds: 500),
          haptic: false,
          tabs: [
            GButton(
              icon: currentIndex == 0
                  ? Icons.dashboard_rounded
                  : Icons.dashboard_outlined,
              text: FFLocalizations.of(context).getText(
                'kw2zxffg' /* __ */,
              ),
              iconSize: 24.0,
            ),
            GButton(
              icon: currentIndex == 1
                  ? Icons.supervised_user_circle_sharp
                  : Icons.supervised_user_circle_outlined,
              text: FFLocalizations.of(context).getText(
                'jnhl082b' /* __ */,
              ),
              iconSize: 24.0,
            ),
            GButton(
              icon: currentIndex == 2
                  ? Icons.home_work_rounded
                  : Icons.home_work_outlined,
              text: FFLocalizations.of(context).getText(
                'yqa6iget' /* __ */,
              ),
              iconSize: 24.0,
            ),
            GButton(
              icon: currentIndex == 3
                  ? Icons.forum_rounded
                  : Icons.forum_outlined,
              text: FFLocalizations.of(context).getText(
                'uv74o9pn' /* __ */,
              ),
              iconSize: 24.0,
            ),
            GButton(
              icon: currentIndex == 4
                  ? Icons.account_circle
                  : Icons.account_circle_outlined,
              text: FFLocalizations.of(context).getText(
                '0lsmrewx' /* __ */,
              ),
              iconSize: 24.0,
            ),
            GButton(
              icon: currentIndex == 5
                  ? Icons.home_work_rounded
                  : Icons.home_work_outlined,
              text: FFLocalizations.of(context).getText(
                'xnu7qemn' /* __ */,
              ),
              iconSize: 24.0,
            ),
            GButton(
              icon: currentIndex == 6
                  ? Icons.supervised_user_circle_sharp
                  : Icons.supervised_user_circle_outlined,
              text: FFLocalizations.of(context).getText(
                'k0wyce3a' /* __ */,
              ),
              iconSize: 24.0,
            )
          ],
        ),
      ),
    );
  }
}
