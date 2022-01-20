import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';
import 'package:rxdata/rxdata.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/src/data/weather_api.dart';
import 'package:weather_app/src/locator.dart';

class WeatherDetailsView extends StatelessWidget with UiLoggy {
  const WeatherDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DataBuilder<LocationSearchResponse?>(
        bloc: cityDataDelegate('Atlanta'),
        builder: (context, state) {
          loggy.info(state.value);

          return Container();
        },
      ),
    );
  }
}

DataDelegate<LocationSearchResponse?> cityDataDelegate(String query) =>
    DataDelegate<LocationSearchResponse?>(
      fromNetwork: () async* {
        final api = locator.get<WeatherApi>();
        final response = await api.search(query: query);

        yield response;
      },
      fromStorage: () async {
        logInfo('Restoring request from storage');

        try {
          SharedPreferences prefs = await SharedPreferences.getInstance();

          final response = prefs
              .getStringList(query)
              ?.map((e) => Location.fromJson(jsonDecode(e)))
              .toList();

          return response;
        } catch (e) {
          logError('Error restoring request from storage', e);
        }
      },
      toStorage: (value) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();

        if (value == null) return;

        try {
          logError('Persisting response to storage');

          final stringList = value.map((e) => jsonEncode(e.toJson())).toList();

          await prefs.setStringList(query, stringList);
        } catch (e) {
          logError('Error persisting response to storage', e);
        }
      },
    );
