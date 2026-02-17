// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nurse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Nurse {
  String get firstName;
  String get lastName;
  int get mobileNumber;
  String get gender;
  String get licenseNumber;
  String get role;
  String get specification;
  String get availiability;
  bool get isAvailable;
  int get experienceYears;
  List<String> get serviceTypes;
  String? get id;
  String? get profileImageUrl;

  /// Create a copy of Nurse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NurseCopyWith<Nurse> get copyWith =>
      _$NurseCopyWithImpl<Nurse>(this as Nurse, _$identity);

  /// Serializes this Nurse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Nurse &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.licenseNumber, licenseNumber) ||
                other.licenseNumber == licenseNumber) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.specification, specification) ||
                other.specification == specification) &&
            (identical(other.availiability, availiability) ||
                other.availiability == availiability) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.experienceYears, experienceYears) ||
                other.experienceYears == experienceYears) &&
            const DeepCollectionEquality()
                .equals(other.serviceTypes, serviceTypes) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      firstName,
      lastName,
      mobileNumber,
      gender,
      licenseNumber,
      role,
      specification,
      availiability,
      isAvailable,
      experienceYears,
      const DeepCollectionEquality().hash(serviceTypes),
      id,
      profileImageUrl);

  @override
  String toString() {
    return 'Nurse(firstName: $firstName, lastName: $lastName, mobileNumber: $mobileNumber, gender: $gender, licenseNumber: $licenseNumber, role: $role, specification: $specification, availiability: $availiability, isAvailable: $isAvailable, experienceYears: $experienceYears, serviceTypes: $serviceTypes, id: $id, profileImageUrl: $profileImageUrl)';
  }
}

/// @nodoc
abstract mixin class $NurseCopyWith<$Res> {
  factory $NurseCopyWith(Nurse value, $Res Function(Nurse) _then) =
      _$NurseCopyWithImpl;
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      int mobileNumber,
      String gender,
      String licenseNumber,
      String role,
      String specification,
      String availiability,
      bool isAvailable,
      int experienceYears,
      List<String> serviceTypes,
      String? id,
      String? profileImageUrl});
}

/// @nodoc
class _$NurseCopyWithImpl<$Res> implements $NurseCopyWith<$Res> {
  _$NurseCopyWithImpl(this._self, this._then);

  final Nurse _self;
  final $Res Function(Nurse) _then;

  /// Create a copy of Nurse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? mobileNumber = null,
    Object? gender = null,
    Object? licenseNumber = null,
    Object? role = null,
    Object? specification = null,
    Object? availiability = null,
    Object? isAvailable = null,
    Object? experienceYears = null,
    Object? serviceTypes = null,
    Object? id = freezed,
    Object? profileImageUrl = freezed,
  }) {
    return _then(_self.copyWith(
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber: null == mobileNumber
          ? _self.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as int,
      gender: null == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      licenseNumber: null == licenseNumber
          ? _self.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      specification: null == specification
          ? _self.specification
          : specification // ignore: cast_nullable_to_non_nullable
              as String,
      availiability: null == availiability
          ? _self.availiability
          : availiability // ignore: cast_nullable_to_non_nullable
              as String,
      isAvailable: null == isAvailable
          ? _self.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      experienceYears: null == experienceYears
          ? _self.experienceYears
          : experienceYears // ignore: cast_nullable_to_non_nullable
              as int,
      serviceTypes: null == serviceTypes
          ? _self.serviceTypes
          : serviceTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImageUrl: freezed == profileImageUrl
          ? _self.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [Nurse].
extension NursePatterns on Nurse {
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
    TResult Function(_Nurse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Nurse() when $default != null:
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
    TResult Function(_Nurse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Nurse():
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
    TResult? Function(_Nurse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Nurse() when $default != null:
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
            String firstName,
            String lastName,
            int mobileNumber,
            String gender,
            String licenseNumber,
            String role,
            String specification,
            String availiability,
            bool isAvailable,
            int experienceYears,
            List<String> serviceTypes,
            String? id,
            String? profileImageUrl)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Nurse() when $default != null:
        return $default(
            _that.firstName,
            _that.lastName,
            _that.mobileNumber,
            _that.gender,
            _that.licenseNumber,
            _that.role,
            _that.specification,
            _that.availiability,
            _that.isAvailable,
            _that.experienceYears,
            _that.serviceTypes,
            _that.id,
            _that.profileImageUrl);
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
            String firstName,
            String lastName,
            int mobileNumber,
            String gender,
            String licenseNumber,
            String role,
            String specification,
            String availiability,
            bool isAvailable,
            int experienceYears,
            List<String> serviceTypes,
            String? id,
            String? profileImageUrl)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Nurse():
        return $default(
            _that.firstName,
            _that.lastName,
            _that.mobileNumber,
            _that.gender,
            _that.licenseNumber,
            _that.role,
            _that.specification,
            _that.availiability,
            _that.isAvailable,
            _that.experienceYears,
            _that.serviceTypes,
            _that.id,
            _that.profileImageUrl);
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
            String firstName,
            String lastName,
            int mobileNumber,
            String gender,
            String licenseNumber,
            String role,
            String specification,
            String availiability,
            bool isAvailable,
            int experienceYears,
            List<String> serviceTypes,
            String? id,
            String? profileImageUrl)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Nurse() when $default != null:
        return $default(
            _that.firstName,
            _that.lastName,
            _that.mobileNumber,
            _that.gender,
            _that.licenseNumber,
            _that.role,
            _that.specification,
            _that.availiability,
            _that.isAvailable,
            _that.experienceYears,
            _that.serviceTypes,
            _that.id,
            _that.profileImageUrl);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Nurse extends Nurse {
  const _Nurse(
      {required this.firstName,
      required this.lastName,
      required this.mobileNumber,
      required this.gender,
      required this.licenseNumber,
      required this.role,
      required this.specification,
      required this.availiability,
      required this.isAvailable,
      required this.experienceYears,
      required final List<String> serviceTypes,
      this.id,
      this.profileImageUrl})
      : _serviceTypes = serviceTypes,
        super._();
  factory _Nurse.fromJson(Map<String, dynamic> json) => _$NurseFromJson(json);

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final int mobileNumber;
  @override
  final String gender;
  @override
  final String licenseNumber;
  @override
  final String role;
  @override
  final String specification;
  @override
  final String availiability;
  @override
  final bool isAvailable;
  @override
  final int experienceYears;
  final List<String> _serviceTypes;
  @override
  List<String> get serviceTypes {
    if (_serviceTypes is EqualUnmodifiableListView) return _serviceTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_serviceTypes);
  }

  @override
  final String? id;
  @override
  final String? profileImageUrl;

  /// Create a copy of Nurse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NurseCopyWith<_Nurse> get copyWith =>
      __$NurseCopyWithImpl<_Nurse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NurseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Nurse &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.licenseNumber, licenseNumber) ||
                other.licenseNumber == licenseNumber) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.specification, specification) ||
                other.specification == specification) &&
            (identical(other.availiability, availiability) ||
                other.availiability == availiability) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.experienceYears, experienceYears) ||
                other.experienceYears == experienceYears) &&
            const DeepCollectionEquality()
                .equals(other._serviceTypes, _serviceTypes) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      firstName,
      lastName,
      mobileNumber,
      gender,
      licenseNumber,
      role,
      specification,
      availiability,
      isAvailable,
      experienceYears,
      const DeepCollectionEquality().hash(_serviceTypes),
      id,
      profileImageUrl);

  @override
  String toString() {
    return 'Nurse(firstName: $firstName, lastName: $lastName, mobileNumber: $mobileNumber, gender: $gender, licenseNumber: $licenseNumber, role: $role, specification: $specification, availiability: $availiability, isAvailable: $isAvailable, experienceYears: $experienceYears, serviceTypes: $serviceTypes, id: $id, profileImageUrl: $profileImageUrl)';
  }
}

/// @nodoc
abstract mixin class _$NurseCopyWith<$Res> implements $NurseCopyWith<$Res> {
  factory _$NurseCopyWith(_Nurse value, $Res Function(_Nurse) _then) =
      __$NurseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      int mobileNumber,
      String gender,
      String licenseNumber,
      String role,
      String specification,
      String availiability,
      bool isAvailable,
      int experienceYears,
      List<String> serviceTypes,
      String? id,
      String? profileImageUrl});
}

/// @nodoc
class __$NurseCopyWithImpl<$Res> implements _$NurseCopyWith<$Res> {
  __$NurseCopyWithImpl(this._self, this._then);

  final _Nurse _self;
  final $Res Function(_Nurse) _then;

  /// Create a copy of Nurse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? mobileNumber = null,
    Object? gender = null,
    Object? licenseNumber = null,
    Object? role = null,
    Object? specification = null,
    Object? availiability = null,
    Object? isAvailable = null,
    Object? experienceYears = null,
    Object? serviceTypes = null,
    Object? id = freezed,
    Object? profileImageUrl = freezed,
  }) {
    return _then(_Nurse(
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber: null == mobileNumber
          ? _self.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as int,
      gender: null == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      licenseNumber: null == licenseNumber
          ? _self.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      specification: null == specification
          ? _self.specification
          : specification // ignore: cast_nullable_to_non_nullable
              as String,
      availiability: null == availiability
          ? _self.availiability
          : availiability // ignore: cast_nullable_to_non_nullable
              as String,
      isAvailable: null == isAvailable
          ? _self.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      experienceYears: null == experienceYears
          ? _self.experienceYears
          : experienceYears // ignore: cast_nullable_to_non_nullable
              as int,
      serviceTypes: null == serviceTypes
          ? _self._serviceTypes
          : serviceTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImageUrl: freezed == profileImageUrl
          ? _self.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
