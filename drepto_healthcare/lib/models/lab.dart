import 'package:freezed_annotation/freezed_annotation.dart';

part 'lab.freezed.dart';
part 'lab.g.dart';

@freezed
abstract class LabCenter with _$LabCenter {
  const LabCenter._();

  const factory LabCenter({
    required String id,
    required String name,
    required String location,
    required double rating,
    required List<String> categories,
    required String nextAvailable,
  }) = _LabCenter;

  factory LabCenter.fromJson(Map<String, dynamic> json) =>
      _$LabCenterFromJson(json);
}

@freezed
abstract class LabBooking with _$LabBooking {
  const LabBooking._();

  const factory LabBooking({
    required String id,
    required String labId,
    required String labName,
    required String testName,
    required String category,
    required String date,
    required String time,
    required String status,
    required String statusLabel,
    required bool hasResult,
    required bool requestAttached,
  }) = _LabBooking;

  factory LabBooking.fromJson(Map<String, dynamic> json) =>
      _$LabBookingFromJson(json);
}
