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
  String get appointmentId;
  String get status;
  String? get userId;
  String? get patientName;
  String? get address;
  String? get mobileNumber;
  String? get symptoms;
  String? get date;
  String? get time;
  String? get nurseId;
  String? get nurseName;
  String? get nurseSpecialization;
  String? get paymentMethod;
  String? get transactionId;
  double? get amount; // Doctor specific fields if needed
  String? get doctorId;
  String? get doctorName;
  String? get specialty;
  String?
      get hospitalName; // Original fields for backward compatibility or general use
  DateTime? get dateTime;
  AppointmentType? get type;
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
            (identical(other.appointmentId, appointmentId) ||
                other.appointmentId == appointmentId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.patientName, patientName) ||
                other.patientName == patientName) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.symptoms, symptoms) ||
                other.symptoms == symptoms) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.nurseId, nurseId) || other.nurseId == nurseId) &&
            (identical(other.nurseName, nurseName) ||
                other.nurseName == nurseName) &&
            (identical(other.nurseSpecialization, nurseSpecialization) ||
                other.nurseSpecialization == nurseSpecialization) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
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
            (identical(other.zoomLink, zoomLink) ||
                other.zoomLink == zoomLink) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        appointmentId,
        status,
        userId,
        patientName,
        address,
        mobileNumber,
        symptoms,
        date,
        time,
        nurseId,
        nurseName,
        nurseSpecialization,
        paymentMethod,
        transactionId,
        amount,
        doctorId,
        doctorName,
        specialty,
        hospitalName,
        dateTime,
        type,
        zoomLink,
        location
      ]);

  @override
  String toString() {
    return 'Appointment(appointmentId: $appointmentId, status: $status, userId: $userId, patientName: $patientName, address: $address, mobileNumber: $mobileNumber, symptoms: $symptoms, date: $date, time: $time, nurseId: $nurseId, nurseName: $nurseName, nurseSpecialization: $nurseSpecialization, paymentMethod: $paymentMethod, transactionId: $transactionId, amount: $amount, doctorId: $doctorId, doctorName: $doctorName, specialty: $specialty, hospitalName: $hospitalName, dateTime: $dateTime, type: $type, zoomLink: $zoomLink, location: $location)';
  }
}

/// @nodoc
abstract mixin class $AppointmentCopyWith<$Res> {
  factory $AppointmentCopyWith(
          Appointment value, $Res Function(Appointment) _then) =
      _$AppointmentCopyWithImpl;
  @useResult
  $Res call(
      {String appointmentId,
      String status,
      String? userId,
      String? patientName,
      String? address,
      String? mobileNumber,
      String? symptoms,
      String? date,
      String? time,
      String? nurseId,
      String? nurseName,
      String? nurseSpecialization,
      String? paymentMethod,
      String? transactionId,
      double? amount,
      String? doctorId,
      String? doctorName,
      String? specialty,
      String? hospitalName,
      DateTime? dateTime,
      AppointmentType? type,
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
    Object? appointmentId = null,
    Object? status = null,
    Object? userId = freezed,
    Object? patientName = freezed,
    Object? address = freezed,
    Object? mobileNumber = freezed,
    Object? symptoms = freezed,
    Object? date = freezed,
    Object? time = freezed,
    Object? nurseId = freezed,
    Object? nurseName = freezed,
    Object? nurseSpecialization = freezed,
    Object? paymentMethod = freezed,
    Object? transactionId = freezed,
    Object? amount = freezed,
    Object? doctorId = freezed,
    Object? doctorName = freezed,
    Object? specialty = freezed,
    Object? hospitalName = freezed,
    Object? dateTime = freezed,
    Object? type = freezed,
    Object? zoomLink = freezed,
    Object? location = freezed,
  }) {
    return _then(_self.copyWith(
      appointmentId: null == appointmentId
          ? _self.appointmentId
          : appointmentId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      patientName: freezed == patientName
          ? _self.patientName
          : patientName // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNumber: freezed == mobileNumber
          ? _self.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      symptoms: freezed == symptoms
          ? _self.symptoms
          : symptoms // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      nurseId: freezed == nurseId
          ? _self.nurseId
          : nurseId // ignore: cast_nullable_to_non_nullable
              as String?,
      nurseName: freezed == nurseName
          ? _self.nurseName
          : nurseName // ignore: cast_nullable_to_non_nullable
              as String?,
      nurseSpecialization: freezed == nurseSpecialization
          ? _self.nurseSpecialization
          : nurseSpecialization // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _self.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionId: freezed == transactionId
          ? _self.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      doctorId: freezed == doctorId
          ? _self.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as String?,
      doctorName: freezed == doctorName
          ? _self.doctorName
          : doctorName // ignore: cast_nullable_to_non_nullable
              as String?,
      specialty: freezed == specialty
          ? _self.specialty
          : specialty // ignore: cast_nullable_to_non_nullable
              as String?,
      hospitalName: freezed == hospitalName
          ? _self.hospitalName
          : hospitalName // ignore: cast_nullable_to_non_nullable
              as String?,
      dateTime: freezed == dateTime
          ? _self.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as AppointmentType?,
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
            String appointmentId,
            String status,
            String? userId,
            String? patientName,
            String? address,
            String? mobileNumber,
            String? symptoms,
            String? date,
            String? time,
            String? nurseId,
            String? nurseName,
            String? nurseSpecialization,
            String? paymentMethod,
            String? transactionId,
            double? amount,
            String? doctorId,
            String? doctorName,
            String? specialty,
            String? hospitalName,
            DateTime? dateTime,
            AppointmentType? type,
            String? zoomLink,
            String? location)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Appointment() when $default != null:
        return $default(
            _that.appointmentId,
            _that.status,
            _that.userId,
            _that.patientName,
            _that.address,
            _that.mobileNumber,
            _that.symptoms,
            _that.date,
            _that.time,
            _that.nurseId,
            _that.nurseName,
            _that.nurseSpecialization,
            _that.paymentMethod,
            _that.transactionId,
            _that.amount,
            _that.doctorId,
            _that.doctorName,
            _that.specialty,
            _that.hospitalName,
            _that.dateTime,
            _that.type,
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
            String appointmentId,
            String status,
            String? userId,
            String? patientName,
            String? address,
            String? mobileNumber,
            String? symptoms,
            String? date,
            String? time,
            String? nurseId,
            String? nurseName,
            String? nurseSpecialization,
            String? paymentMethod,
            String? transactionId,
            double? amount,
            String? doctorId,
            String? doctorName,
            String? specialty,
            String? hospitalName,
            DateTime? dateTime,
            AppointmentType? type,
            String? zoomLink,
            String? location)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Appointment():
        return $default(
            _that.appointmentId,
            _that.status,
            _that.userId,
            _that.patientName,
            _that.address,
            _that.mobileNumber,
            _that.symptoms,
            _that.date,
            _that.time,
            _that.nurseId,
            _that.nurseName,
            _that.nurseSpecialization,
            _that.paymentMethod,
            _that.transactionId,
            _that.amount,
            _that.doctorId,
            _that.doctorName,
            _that.specialty,
            _that.hospitalName,
            _that.dateTime,
            _that.type,
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
            String appointmentId,
            String status,
            String? userId,
            String? patientName,
            String? address,
            String? mobileNumber,
            String? symptoms,
            String? date,
            String? time,
            String? nurseId,
            String? nurseName,
            String? nurseSpecialization,
            String? paymentMethod,
            String? transactionId,
            double? amount,
            String? doctorId,
            String? doctorName,
            String? specialty,
            String? hospitalName,
            DateTime? dateTime,
            AppointmentType? type,
            String? zoomLink,
            String? location)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Appointment() when $default != null:
        return $default(
            _that.appointmentId,
            _that.status,
            _that.userId,
            _that.patientName,
            _that.address,
            _that.mobileNumber,
            _that.symptoms,
            _that.date,
            _that.time,
            _that.nurseId,
            _that.nurseName,
            _that.nurseSpecialization,
            _that.paymentMethod,
            _that.transactionId,
            _that.amount,
            _that.doctorId,
            _that.doctorName,
            _that.specialty,
            _that.hospitalName,
            _that.dateTime,
            _that.type,
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
      {required this.appointmentId,
      required this.status,
      this.userId,
      this.patientName,
      this.address,
      this.mobileNumber,
      this.symptoms,
      this.date,
      this.time,
      this.nurseId,
      this.nurseName,
      this.nurseSpecialization,
      this.paymentMethod,
      this.transactionId,
      this.amount,
      this.doctorId,
      this.doctorName,
      this.specialty,
      this.hospitalName,
      this.dateTime,
      this.type,
      this.zoomLink,
      this.location})
      : super._();
  factory _Appointment.fromJson(Map<String, dynamic> json) =>
      _$AppointmentFromJson(json);

  @override
  final String appointmentId;
  @override
  final String status;
  @override
  final String? userId;
  @override
  final String? patientName;
  @override
  final String? address;
  @override
  final String? mobileNumber;
  @override
  final String? symptoms;
  @override
  final String? date;
  @override
  final String? time;
  @override
  final String? nurseId;
  @override
  final String? nurseName;
  @override
  final String? nurseSpecialization;
  @override
  final String? paymentMethod;
  @override
  final String? transactionId;
  @override
  final double? amount;
// Doctor specific fields if needed
  @override
  final String? doctorId;
  @override
  final String? doctorName;
  @override
  final String? specialty;
  @override
  final String? hospitalName;
// Original fields for backward compatibility or general use
  @override
  final DateTime? dateTime;
  @override
  final AppointmentType? type;
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
            (identical(other.appointmentId, appointmentId) ||
                other.appointmentId == appointmentId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.patientName, patientName) ||
                other.patientName == patientName) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.symptoms, symptoms) ||
                other.symptoms == symptoms) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.nurseId, nurseId) || other.nurseId == nurseId) &&
            (identical(other.nurseName, nurseName) ||
                other.nurseName == nurseName) &&
            (identical(other.nurseSpecialization, nurseSpecialization) ||
                other.nurseSpecialization == nurseSpecialization) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
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
            (identical(other.zoomLink, zoomLink) ||
                other.zoomLink == zoomLink) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        appointmentId,
        status,
        userId,
        patientName,
        address,
        mobileNumber,
        symptoms,
        date,
        time,
        nurseId,
        nurseName,
        nurseSpecialization,
        paymentMethod,
        transactionId,
        amount,
        doctorId,
        doctorName,
        specialty,
        hospitalName,
        dateTime,
        type,
        zoomLink,
        location
      ]);

  @override
  String toString() {
    return 'Appointment(appointmentId: $appointmentId, status: $status, userId: $userId, patientName: $patientName, address: $address, mobileNumber: $mobileNumber, symptoms: $symptoms, date: $date, time: $time, nurseId: $nurseId, nurseName: $nurseName, nurseSpecialization: $nurseSpecialization, paymentMethod: $paymentMethod, transactionId: $transactionId, amount: $amount, doctorId: $doctorId, doctorName: $doctorName, specialty: $specialty, hospitalName: $hospitalName, dateTime: $dateTime, type: $type, zoomLink: $zoomLink, location: $location)';
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
      {String appointmentId,
      String status,
      String? userId,
      String? patientName,
      String? address,
      String? mobileNumber,
      String? symptoms,
      String? date,
      String? time,
      String? nurseId,
      String? nurseName,
      String? nurseSpecialization,
      String? paymentMethod,
      String? transactionId,
      double? amount,
      String? doctorId,
      String? doctorName,
      String? specialty,
      String? hospitalName,
      DateTime? dateTime,
      AppointmentType? type,
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
    Object? appointmentId = null,
    Object? status = null,
    Object? userId = freezed,
    Object? patientName = freezed,
    Object? address = freezed,
    Object? mobileNumber = freezed,
    Object? symptoms = freezed,
    Object? date = freezed,
    Object? time = freezed,
    Object? nurseId = freezed,
    Object? nurseName = freezed,
    Object? nurseSpecialization = freezed,
    Object? paymentMethod = freezed,
    Object? transactionId = freezed,
    Object? amount = freezed,
    Object? doctorId = freezed,
    Object? doctorName = freezed,
    Object? specialty = freezed,
    Object? hospitalName = freezed,
    Object? dateTime = freezed,
    Object? type = freezed,
    Object? zoomLink = freezed,
    Object? location = freezed,
  }) {
    return _then(_Appointment(
      appointmentId: null == appointmentId
          ? _self.appointmentId
          : appointmentId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      patientName: freezed == patientName
          ? _self.patientName
          : patientName // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNumber: freezed == mobileNumber
          ? _self.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      symptoms: freezed == symptoms
          ? _self.symptoms
          : symptoms // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      nurseId: freezed == nurseId
          ? _self.nurseId
          : nurseId // ignore: cast_nullable_to_non_nullable
              as String?,
      nurseName: freezed == nurseName
          ? _self.nurseName
          : nurseName // ignore: cast_nullable_to_non_nullable
              as String?,
      nurseSpecialization: freezed == nurseSpecialization
          ? _self.nurseSpecialization
          : nurseSpecialization // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _self.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionId: freezed == transactionId
          ? _self.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      doctorId: freezed == doctorId
          ? _self.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as String?,
      doctorName: freezed == doctorName
          ? _self.doctorName
          : doctorName // ignore: cast_nullable_to_non_nullable
              as String?,
      specialty: freezed == specialty
          ? _self.specialty
          : specialty // ignore: cast_nullable_to_non_nullable
              as String?,
      hospitalName: freezed == hospitalName
          ? _self.hospitalName
          : hospitalName // ignore: cast_nullable_to_non_nullable
              as String?,
      dateTime: freezed == dateTime
          ? _self.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as AppointmentType?,
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
