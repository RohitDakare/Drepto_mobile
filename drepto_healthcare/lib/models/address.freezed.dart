// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ShippingAddress {
  String get houseNo;
  String get street;
  String get city;
  String get state;
  String get country;
  String get pincode;
  String get contactNumber;
  String? get buildingName;
  String? get landmark;
  String? get userId;
  String? get id;

  /// Create a copy of ShippingAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ShippingAddressCopyWith<ShippingAddress> get copyWith =>
      _$ShippingAddressCopyWithImpl<ShippingAddress>(
          this as ShippingAddress, _$identity);

  /// Serializes this ShippingAddress to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ShippingAddress &&
            (identical(other.houseNo, houseNo) || other.houseNo == houseNo) &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.pincode, pincode) || other.pincode == pincode) &&
            (identical(other.contactNumber, contactNumber) ||
                other.contactNumber == contactNumber) &&
            (identical(other.buildingName, buildingName) ||
                other.buildingName == buildingName) &&
            (identical(other.landmark, landmark) ||
                other.landmark == landmark) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, houseNo, street, city, state,
      country, pincode, contactNumber, buildingName, landmark, userId, id);

  @override
  String toString() {
    return 'ShippingAddress(houseNo: $houseNo, street: $street, city: $city, state: $state, country: $country, pincode: $pincode, contactNumber: $contactNumber, buildingName: $buildingName, landmark: $landmark, userId: $userId, id: $id)';
  }
}

/// @nodoc
abstract mixin class $ShippingAddressCopyWith<$Res> {
  factory $ShippingAddressCopyWith(
          ShippingAddress value, $Res Function(ShippingAddress) _then) =
      _$ShippingAddressCopyWithImpl;
  @useResult
  $Res call(
      {String houseNo,
      String street,
      String city,
      String state,
      String country,
      String pincode,
      String contactNumber,
      String? buildingName,
      String? landmark,
      String? userId,
      String? id});
}

/// @nodoc
class _$ShippingAddressCopyWithImpl<$Res>
    implements $ShippingAddressCopyWith<$Res> {
  _$ShippingAddressCopyWithImpl(this._self, this._then);

  final ShippingAddress _self;
  final $Res Function(ShippingAddress) _then;

  /// Create a copy of ShippingAddress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? houseNo = null,
    Object? street = null,
    Object? city = null,
    Object? state = null,
    Object? country = null,
    Object? pincode = null,
    Object? contactNumber = null,
    Object? buildingName = freezed,
    Object? landmark = freezed,
    Object? userId = freezed,
    Object? id = freezed,
  }) {
    return _then(_self.copyWith(
      houseNo: null == houseNo
          ? _self.houseNo
          : houseNo // ignore: cast_nullable_to_non_nullable
              as String,
      street: null == street
          ? _self.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      pincode: null == pincode
          ? _self.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as String,
      contactNumber: null == contactNumber
          ? _self.contactNumber
          : contactNumber // ignore: cast_nullable_to_non_nullable
              as String,
      buildingName: freezed == buildingName
          ? _self.buildingName
          : buildingName // ignore: cast_nullable_to_non_nullable
              as String?,
      landmark: freezed == landmark
          ? _self.landmark
          : landmark // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ShippingAddress].
extension ShippingAddressPatterns on ShippingAddress {
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
    TResult Function(_ShippingAddress value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ShippingAddress() when $default != null:
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
    TResult Function(_ShippingAddress value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShippingAddress():
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
    TResult? Function(_ShippingAddress value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShippingAddress() when $default != null:
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
            String houseNo,
            String street,
            String city,
            String state,
            String country,
            String pincode,
            String contactNumber,
            String? buildingName,
            String? landmark,
            String? userId,
            String? id)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ShippingAddress() when $default != null:
        return $default(
            _that.houseNo,
            _that.street,
            _that.city,
            _that.state,
            _that.country,
            _that.pincode,
            _that.contactNumber,
            _that.buildingName,
            _that.landmark,
            _that.userId,
            _that.id);
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
            String houseNo,
            String street,
            String city,
            String state,
            String country,
            String pincode,
            String contactNumber,
            String? buildingName,
            String? landmark,
            String? userId,
            String? id)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShippingAddress():
        return $default(
            _that.houseNo,
            _that.street,
            _that.city,
            _that.state,
            _that.country,
            _that.pincode,
            _that.contactNumber,
            _that.buildingName,
            _that.landmark,
            _that.userId,
            _that.id);
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
            String houseNo,
            String street,
            String city,
            String state,
            String country,
            String pincode,
            String contactNumber,
            String? buildingName,
            String? landmark,
            String? userId,
            String? id)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShippingAddress() when $default != null:
        return $default(
            _that.houseNo,
            _that.street,
            _that.city,
            _that.state,
            _that.country,
            _that.pincode,
            _that.contactNumber,
            _that.buildingName,
            _that.landmark,
            _that.userId,
            _that.id);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ShippingAddress extends ShippingAddress {
  const _ShippingAddress(
      {required this.houseNo,
      required this.street,
      required this.city,
      required this.state,
      required this.country,
      required this.pincode,
      required this.contactNumber,
      this.buildingName,
      this.landmark,
      this.userId,
      this.id})
      : super._();
  factory _ShippingAddress.fromJson(Map<String, dynamic> json) =>
      _$ShippingAddressFromJson(json);

  @override
  final String houseNo;
  @override
  final String street;
  @override
  final String city;
  @override
  final String state;
  @override
  final String country;
  @override
  final String pincode;
  @override
  final String contactNumber;
  @override
  final String? buildingName;
  @override
  final String? landmark;
  @override
  final String? userId;
  @override
  final String? id;

  /// Create a copy of ShippingAddress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ShippingAddressCopyWith<_ShippingAddress> get copyWith =>
      __$ShippingAddressCopyWithImpl<_ShippingAddress>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ShippingAddressToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ShippingAddress &&
            (identical(other.houseNo, houseNo) || other.houseNo == houseNo) &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.pincode, pincode) || other.pincode == pincode) &&
            (identical(other.contactNumber, contactNumber) ||
                other.contactNumber == contactNumber) &&
            (identical(other.buildingName, buildingName) ||
                other.buildingName == buildingName) &&
            (identical(other.landmark, landmark) ||
                other.landmark == landmark) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, houseNo, street, city, state,
      country, pincode, contactNumber, buildingName, landmark, userId, id);

  @override
  String toString() {
    return 'ShippingAddress(houseNo: $houseNo, street: $street, city: $city, state: $state, country: $country, pincode: $pincode, contactNumber: $contactNumber, buildingName: $buildingName, landmark: $landmark, userId: $userId, id: $id)';
  }
}

/// @nodoc
abstract mixin class _$ShippingAddressCopyWith<$Res>
    implements $ShippingAddressCopyWith<$Res> {
  factory _$ShippingAddressCopyWith(
          _ShippingAddress value, $Res Function(_ShippingAddress) _then) =
      __$ShippingAddressCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String houseNo,
      String street,
      String city,
      String state,
      String country,
      String pincode,
      String contactNumber,
      String? buildingName,
      String? landmark,
      String? userId,
      String? id});
}

/// @nodoc
class __$ShippingAddressCopyWithImpl<$Res>
    implements _$ShippingAddressCopyWith<$Res> {
  __$ShippingAddressCopyWithImpl(this._self, this._then);

  final _ShippingAddress _self;
  final $Res Function(_ShippingAddress) _then;

  /// Create a copy of ShippingAddress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? houseNo = null,
    Object? street = null,
    Object? city = null,
    Object? state = null,
    Object? country = null,
    Object? pincode = null,
    Object? contactNumber = null,
    Object? buildingName = freezed,
    Object? landmark = freezed,
    Object? userId = freezed,
    Object? id = freezed,
  }) {
    return _then(_ShippingAddress(
      houseNo: null == houseNo
          ? _self.houseNo
          : houseNo // ignore: cast_nullable_to_non_nullable
              as String,
      street: null == street
          ? _self.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      pincode: null == pincode
          ? _self.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as String,
      contactNumber: null == contactNumber
          ? _self.contactNumber
          : contactNumber // ignore: cast_nullable_to_non_nullable
              as String,
      buildingName: freezed == buildingName
          ? _self.buildingName
          : buildingName // ignore: cast_nullable_to_non_nullable
              as String?,
      landmark: freezed == landmark
          ? _self.landmark
          : landmark // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
