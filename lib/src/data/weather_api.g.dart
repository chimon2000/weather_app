// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      title: json['title'] as String?,
      locationType: json['location_type'] as String?,
      lattLong: json['latt_long'] as String?,
      woeid: json['woeid'] as int?,
      distance: json['distance'] as int?,
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'title': instance.title,
      'location_type': instance.locationType,
      'latt_long': instance.lattLong,
      'woeid': instance.woeid,
      'distance': instance.distance,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _WeatherApi implements WeatherApi {
  _WeatherApi(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://www.metaweather.com/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<Location>> search({query, lattLong}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'query': query,
      r'lattlong': lattLong
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<Location>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/location/search',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Location.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
