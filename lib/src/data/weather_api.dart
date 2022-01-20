import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/http.dart';

part 'weather_api.g.dart';

@RestApi(baseUrl: 'https://www.metaweather.com/api/')
abstract class WeatherApi {
  factory WeatherApi(Dio dio, {String baseUrl}) = _WeatherApi;

  @GET('/location/search')
  Future<LocationSearchResponse> search({
    @Query('query') String? query,
    @Query('lattlong') String? lattLong,
  });
}

@JsonSerializable()
class Location extends Equatable {
  const Location({
    this.title,
    this.locationType,
    this.lattLong,
    this.woeid,
    this.distance,
  });

  final String? title;

  @JsonKey(name: 'location_type')
  final String? locationType;

  @JsonKey(name: 'latt_long')
  final String? lattLong;
  final int? woeid;
  final int? distance;

  /// Connect the generated [_$LocationFromJson] function to the `fromJson`
  /// factory.
  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  /// Connect the generated [_$LocationToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$LocationToJson(this);

  @override
  List<Object?> get props {
    return [
      title,
      locationType,
      lattLong,
      woeid,
      distance,
    ];
  }

  @override
  bool? get stringify => true;
}

typedef LocationSearchResponse = List<Location>;
