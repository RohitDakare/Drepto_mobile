// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'appointment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Appointment {
  String get id;
  String get doctorId;
  String get doctorName;
  String get specialty;
  String get hospitalName;
  DateTime get dateTime;
  AppointmentType get type;
  AppointmentStatus get status;
  String? get zoomLink;
  String? get location;

  /// Create a copy of Appointment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppointmentCopyWith<Appointment> get copyWith =>
      _$AppointmentCopyWithImpl<Appointment>(this as Appointment, _$identity);

  /// Serializes this Appointment to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Appointment &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.doctorName, doctorName) ||
                other.doctorName == doctorName) &&
            (identical(other.specialty, specialty) ||
                other.specialty == specialty) &&
            (identical(other.hospitalName, hospitalName) ||
                other.hospitalName == hospitalName) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.zoomLink, zoomLink) ||
                other.zoomLink == zoomLink) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, doctorId, doctorName,
      specialty, hospitalName, dateTime, type, status, zoomLink, location);

  @override
  String toString() {
    return 'Appointment(id: $id, doctorId: $doctorId, doctorName: $doctorName, specialty: $specialty, hospitalName: $hospitalName, dateTime: $dateTime, type: $type, status: $status, zoomLink: $zoomLink, location: $location)';
  }
}

/// @nodoc
abstract mixin class $AppointmentCopyWith<$Res> {
  factory $AppointmentCopyWith(
          Appointment value, $Res Function(Appointment) _then) =
      _$AppointmentCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String doctorId,
      String doctorName,
      String specialty,
      String hospitalName,
      DateTime dateTime,
      AppointmentType type,
      AppointmentStatus status,
      String? zoomLink,
      String? location});
}

/// @nodoc
class _$AppointmentCopyWithImpl<$Res> implements $AppointmentCopyWith<$Res> {
  _$AppointmentCopyWithImpl(this._self, this._then);

  final Appointment _self;
  final $Res Function(Appointment) _then;

  /// Create a copy of Appointment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? doctorId = null,
    Object? doctorName = null,
    Object? specialty = null,
    Object? hospitalName = null,
    Object? dateTime = null,
    Object? type = null,
    Object? status = null,
    Object? zoomLink = freezed,
    Object? location = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      doctorId: null == doctorId
          ? _self.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as String,
      doctorName: null == doctorName
          ? _self.doctorName
          : doctorName // ignore: cast_nullable_to_non_nullable
              as String,
      specialty: null == specialty
          ? _self.specialty
          : specialty // ignore: cast_nullable_to_non_nullable
              as String,
      hospitalName: null == hospitalName
          ? _self.hospitalName
          : hospitalName // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: null == dateTime
          ? _self.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as AppointmentType,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as AppointmentStatus,
      zoomLink: freezed == zoomLink
          ? _self.zoomLink
          : zoomLink // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [Appointment].
extension AppointmentPatterns on Appointment {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Appointment value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Appointment() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Appointment value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Appointment():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Appointment value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Appointment() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            String doctorId,
            String doctorName,
            String specialty,
            String hospitalName,
            DateTime dateTime,
            AppointmentType type,
            AppointmentStatus status,
            String? zoomLink,
            String? location)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Appointment() when $default != null:
        return $default(
            _that.id,
            _that.doctorId,
            _that.doctorName,
            _that.specialty,
            _that.hospitalName,
            _that.dateTime,
            _that.type,
            _that.status,
            _that.zoomLink,
            _that.location);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            String doctorId,
            String doctorName,
            String specialty,
            String hospitalName,
            DateTime dateTime,
            AppointmentType type,
            AppointmentStatus status,
            String? zoomLink,
            String? location)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Appointment():
        return $default(
            _that.id,
            _that.doctorId,
            _that.doctorName,
            _that.specialty,
            _that.hospitalName,
            _that.dateTime,
            _that.type,
            _that.status,
            _that.zoomLink,
            _that.location);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            String doctorId,
            String doctorName,
            String specialty,
            String hospitalName,
            DateTime dateTime,
            AppointmentType type,
            AppointmentStatus status,
            String? zoomLink,
            String? location)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Appointment() when $default != null:
        return $default(
            _that.id,
            _that.doctorId,
            _that.doctorName,
            _that.specialty,
            _that.hospitalName,
            _that.dateTime,
            _that.type,
            _that.status,
            _that.zoomLink,
            _that.location);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Appointment extends Appointment {
  const _Appointment(
      {required this.id,
      required this.doctorId,
      required this.doctorName,
      required this.specialty,
      required this.hospitalName,
      required this.dateTime,
      required this.type,
      this.status = AppointmentStatus.upcoming,
      this.zoomLink,
      this.location})
      : super._();
  factory _Appointment.fromJson(Map<String, dynamic> json) =>
      _$AppointmentFromJson(json);

  @override
  final String id;
  @override
  final String doctorId;
  @override
  final String doctorName;
  @override
  final String specialty;
  @override
  final String hospitalName;
  @override
  final DateTime dateTime;
  @override
  final AppointmentType type;
  @override
  @JsonKey()
  final AppointmentStatus status;
  @override
  final String? zoomLink;
  @override
  final String? location;

  /// Create a copy of Appointment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AppointmentCopyWith<_Appointment> get copyWith =>
      __$AppointmentCopyWithImpl<_Appointment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AppointmentToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Appointment &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.doctorName, doctorName) ||
                other.doctorName == doctorName) &&
            (identical(other.specialty, specialty) ||
                other.specialty == specialty) &&
            (identical(other.hospitalName, hospitalName) ||
                other.hospitalName == hospitalName) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.zoomLink, zoomLink) ||
                other.zoomLink == zoomLink) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, doctorId, doctorName,
      specialty, hospitalName, dateTime, type, status, zoomLink, location);

  @override
  String toString() {
    return 'Appointment(id: $id, doctorId: $doctorId, doctorName: $doctorName, specialty: $specialty, hospitalName: $hospitalName, dateTime: $dateTime, type: $type, status: $status, zoomLink: $zoomLink, location: $location)';
  }
}

/// @nodoc
abstract mixin class _$AppointmentCopyWith<$Res>
    implements $AppointmentCopyWith<$Res> {
  factory _$AppointmentCopyWith(
          _Appointment value, $Res Function(_Appointment) _then) =
      __$AppointmentCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String doctorId,
      String doctorName,
      String specialty,
      String hospitalName,
      DateTime dateTime,
      AppointmentType type,
      AppointmentStatus status,
      String? zoomLink,
      String? location});
}

/// @nodoc
class __$AppointmentCopyWithImpl<$Res> implements _$AppointmentCopyWith<$Res> {
  __$AppointmentCopyWithImpl(this._self, this._then);

  final _Appointment _self;
  final $Res Function(_Appointment) _then;

  /// Create a copy of Appointment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? doctorId = null,
    Object? doctorName = null,
    Object? specialty = null,
    Object? hospitalName = null,
    Object? dateTime = null,
    Object? type = null,
    Object? status = null,
    Object? zoomLink = freezed,
    Object? location = freezed,
  }) {
    return _then(_Appointment(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      doctorId: null == doctorId
          ? _self.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as String,
      doctorName: null == doctorName
          ? _self.doctorName
          : doctorName // ignore: cast_nullable_to_non_nullable
              as String,
      specialty: null == specialty
          ? _self.specialty
          : specialty // ignore: cast_nullable_to_non_nullable
              as String,
      hospitalName: null == hospitalName
          ? _self.hospitalName
          : hospitalName // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: null == dateTime
          ? _self.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as AppointmentType,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as AppointmentStatus,
      zoomLink: freezed == zoomLink
          ? _self.zoomLink
          : zoomLink // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
