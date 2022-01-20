import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:routemaster/routemaster.dart';
import 'package:weather_app/src/weather/weather_details_view.dart';

/// The Widget that configures your application.
class WeatherApp extends StatelessWidget {
  const WeatherApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      restorationScopeId: 'app',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
      ],
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.appTitle,
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      routerDelegate: RoutemasterDelegate(routesBuilder: (context) => routes),
      routeInformationParser: const RoutemasterParser(),
    );
  }
}

final routes = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: WeatherDetailsView()),
});
