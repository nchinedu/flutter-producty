import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/screens/splash_screen.dart';
import 'package:myapp/theme/app_theme.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_error/flutter_error.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    
    FlutterError.onError = (details) {
      FlutterError.presentError(details);
      // Add your error reporting service here
    };
    
    runApp(const MyApp());
  }, (error, stack) {
    // Handle any errors not caught by Flutter
  });
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final FirebaseAnalytics analytics;

  const MyApp({
    super.key,
    required this.navigatorKey,
    required this.analytics,
  });

  @override
  Widget build(BuildContext context) {
    return CacheNetworkImage(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Producty',
        
        themeMode: ThemeMode.system,
        theme: AppTheme.lightTheme(),
        
        darkTheme: AppTheme.darkTheme(),
        
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/auth': (context) => const AuthScreen(),
        },
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'), // English
          Locale('es'), // Spanish
          // Add more locales
        ],
        navigatorKey: navigatorKey,
        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: analytics),
        ],
      ),
    );
  }
}
