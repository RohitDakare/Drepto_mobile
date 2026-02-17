// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lab.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LabCenter {
  String get id;
  String get name;
  String get location;
  double get rating;
  List<String> get categories;
  String get nextAvailable;

  /// Create a copy of LabCenter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LabCenterCopyWith<LabCenter> get copyWith =>
      _$LabCenterCopyWithImpl<LabCenter>(this as LabCenter, _$identity);

  /// Serializes this LabCenter to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LabCenter &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            const DeepCollectionEquality()
                .equals(other.categories, categories) &&
            (identical(other.nextAvailable, nextAvailable) ||
                other.nextAvailable == nextAvailable));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, location, rating,
      const DeepCollectionEquality().hash(categories), nextAvailable);

  @override
  String toString() {
    return 'LabCenter(id: $id, name: $name, location: $location, rating: $rating, categories: $categories, nextAvailable: $nextAvailable)';
  }
}

/// @nodoc
abstract mixin class $LabCenterCopyWith<$Res> {
  factory $LabCenterCopyWith(LabCenter value, $Res Function(LabCenter) _then) =
      _$LabCenterCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      String location,
      double rating,
      List<String> categories,
      String nextAvailable});
}

/// @nodoc
class _$LabCenterCopyWithImpl<$Res> implements $LabCenterCopyWith<$Res> {
  _$LabCenterCopyWithImpl(this._self, this._then);

  final LabCenter _self;
  final $Res Function(LabCenter) _then;

  /// Create a copy of LabCenter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? location = null,
    Object? rating = null,
    Object? categories = null,
    Object? nextAvailable = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      categories: null == categories
          ? _self.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      nextAvailable: null == nextAvailable
          ? _self.nextAvailable
          : nextAvailable // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [LabCenter].
extension LabCenterPatterns on LabCenter {
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
    TResult Function(_LabCenter value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LabCenter() when $default != null:
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
    TResult Function(_LabCenter value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LabCenter():
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
    TResult? Function(_LabCenter value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LabCenter() when $default != null:
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
    TResult Function(String id, String name, String location, double rating,
            List<String> categories, String nextAvailable)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LabCenter() when $default != null:
        return $default(_that.id, _that.name, _that.location, _that.rating,
            _that.categories, _that.nextAvailable);
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
    TResult Function(String id, String name, String location, double rating,
            List<String> categories, String nextAvailable)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LabCenter():
        return $default(_that.id, _that.name, _that.location, _that.rating,
            _that.categories, _that.nextAvailable);
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
    TResult? Function(String id, String name, String location, double rating,
            List<String> categories, String nextAvailable)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LabCenter() when $default != null:
        return $default(_that.id, _that.name, _that.location, _that.rating,
            _that.categories, _that.nextAvailable);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _LabCenter extends LabCenter {
  const _LabCenter(
      {required this.id,
      required this.name,
      required this.location,
      required this.rating,
      required final List<String> categories,
      required this.nextAvailable})
      : _categories = categories,
        super._();
  factory _LabCenter.fromJson(Map<String, dynamic> json) =>
      _$LabCenterFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String location;
  @override
  final double rating;
  final List<String> _categories;
  @override
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  final String nextAvailable;

  /// Create a copy of LabCenter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LabCenterCopyWith<_LabCenter> get copyWith =>
      __$LabCenterCopyWithImpl<_LabCenter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LabCenterToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LabCenter &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.nextAvailable, nextAvailable) ||
                other.nextAvailable == nextAvailable));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, location, rating,
      const DeepCollectionEquality().hash(_categories), nextAvailable);

  @override
  String toString() {
    return 'LabCenter(id: $id, name: $name, location: $location, rating: $rating, categories: $categories, nextAvailable: $nextAvailable)';
  }
}

/// @nodoc
abstract mixin class _$LabCenterCopyWith<$Res>
    implements $LabCenterCopyWith<$Res> {
  factory _$LabCenterCopyWith(
          _LabCenter value, $Res Function(_LabCenter) _then) =
      __$LabCenterCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String location,
      double rating,
      List<String> categories,
      String nextAvailable});
}

/// @nodoc
class __$LabCenterCopyWithImpl<$Res> implements _$LabCenterCopyWith<$Res> {
  __$LabCenterCopyWithImpl(this._self, this._then);

  final _LabCenter _self;
  final $Res Function(_LabCenter) _then;

  /// Create a copy of LabCenter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? location = null,
    Object? rating = null,
    Object? categories = null,
    Object? nextAvailable = null,
  }) {
    return _then(_LabCenter(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      categories: null == categories
          ? _self._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      nextAvailable: null == nextAvailable
          ? _self.nextAvailable
          : nextAvailable // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$LabBooking {
  String get id;
  String get labId;
  String get labName;
  String get testName;
  String get category;
  String get date;
  String get time;
  String get status;
  String get statusLabel;
  bool get hasResult;
  bool get requestAttached;

  /// Create a copy of LabBooking
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LabBookingCopyWith<LabBooking> get copyWith =>
      _$LabBookingCopyWithImpl<LabBooking>(this as LabBooking, _$identity);

  /// Serializes this LabBooking to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LabBooking &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.labId, labId) || other.labId == labId) &&
            (identical(other.labName, labName) || other.labName == labName) &&
            (identical(other.testName, testName) ||
                other.testName == testName) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.statusLabel, statusLabel) ||
                other.statusLabel == statusLabel) &&
            (identical(other.hasResult, hasResult) ||
                other.hasResult == hasResult) &&
            (identical(other.requestAttached, requestAttached) ||
                other.requestAttached == requestAttached));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, labId, labName, testName,
      category, date, time, status, statusLabel, hasResult, requestAttached);

  @override
  String toString() {
    return 'LabBooking(id: $id, labId: $labId, labName: $labName, testName: $testName, category: $category, date: $date, time: $time, status: $status, statusLabel: $statusLabel, hasResult: $hasResult, requestAttached: $requestAttached)';
  }
}

/// @nodoc
abstract mixin class $LabBookingCopyWith<$Res> {
  factory $LabBookingCopyWith(
          LabBooking value, $Res Function(LabBooking) _then) =
      _$LabBookingCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String labId,
      String labName,
      String testName,
      String category,
      String date,
      String time,
      String status,
      String statusLabel,
      bool hasResult,
      bool requestAttached});
}

/// @nodoc
class _$LabBookingCopyWithImpl<$Res> implements $LabBookingCopyWith<$Res> {
  _$LabBookingCopyWithImpl(this._self, this._then);

  final LabBooking _self;
  final $Res Function(LabBooking) _then;

  /// Create a copy of LabBooking
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? labId = null,
    Object? labName = null,
    Object? testName = null,
    Object? category = null,
    Object? date = null,
    Object? time = null,
    Object? status = null,
    Object? statusLabel = null,
    Object? hasResult = null,
    Object? requestAttached = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      labId: null == labId
          ? _self.labId
          : labId // ignore: cast_nullable_to_non_nullable
              as String,
      labName: null == labName
          ? _self.labName
          : labName // ignore: cast_nullable_to_non_nullable
              as String,
      testName: null == testName
          ? _self.testName
          : testName // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      statusLabel: null == statusLabel
          ? _self.statusLabel
          : statusLabel // ignore: cast_nullable_to_non_nullable
              as String,
      hasResult: null == hasResult
          ? _self.hasResult
          : hasResult // ignore: cast_nullable_to_non_nullable
              as bool,
      requestAttached: null == requestAttached
          ? _self.requestAttached
          : requestAttached // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [LabBooking].
extension LabBookingPatterns on LabBooking {
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
    TResult Function(_LabBooking value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LabBooking() when $default != null:
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
    TResult Function(_LabBooking value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LabBooking():
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
    TResult? Function(_LabBooking value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LabBooking() when $default != null:
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
            String labId,
            String labName,
            String testName,
            String category,
            String date,
            String time,
            String status,
            String statusLabel,
            bool hasResult,
            bool requestAttached)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LabBooking() when $default != null:
        return $default(
            _that.id,
            _that.labId,
            _that.labName,
            _that.testName,
            _that.category,
            _that.date,
            _that.time,
            _that.status,
            _that.statusLabel,
            _that.hasResult,
            _that.requestAttached);
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
            String labId,
            String labName,
            String testName,
            String category,
            String date,
            String time,
            String status,
            String statusLabel,
            bool hasResult,
            bool requestAttached)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LabBooking():
        return $default(
            _that.id,
            _that.labId,
            _that.labName,
            _that.testName,
            _that.category,
            _that.date,
            _that.time,
            _that.status,
            _that.statusLabel,
            _that.hasResult,
            _that.requestAttached);
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
            String labId,
            String labName,
            String testName,
            String category,
            String date,
            String time,
            String status,
            String statusLabel,
            bool hasResult,
            bool requestAttached)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LabBooking() when $default != null:
        return $default(
            _that.id,
            _that.labId,
            _that.labName,
            _that.testName,
            _that.category,
            _that.date,
            _that.time,
            _that.status,
            _that.statusLabel,
            _that.hasResult,
            _that.requestAttached);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _LabBooking extends LabBooking {
  const _LabBooking(
      {required this.id,
      required this.labId,
      required this.labName,
      required this.testName,
      required this.category,
      required this.date,
      required this.time,
      required this.status,
      required this.statusLabel,
      required this.hasResult,
      required this.requestAttached})
      : super._();
  factory _LabBooking.fromJson(Map<String, dynamic> json) =>
      _$LabBookingFromJson(json);

  @override
  final String id;
  @override
  final String labId;
  @override
  final String labName;
  @override
  final String testName;
  @override
  final String category;
  @override
  final String date;
  @override
  final String time;
  @override
  final String status;
  @override
  final String statusLabel;
  @override
  final bool hasResult;
  @override
  final bool requestAttached;

  /// Create a copy of LabBooking
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LabBookingCopyWith<_LabBooking> get copyWith =>
      __$LabBookingCopyWithImpl<_LabBooking>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LabBookingToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LabBooking &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.labId, labId) || other.labId == labId) &&
            (identical(other.labName, labName) || other.labName == labName) &&
            (identical(other.testName, testName) ||
                other.testName == testName) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.statusLabel, statusLabel) ||
                other.statusLabel == statusLabel) &&
            (identical(other.hasResult, hasResult) ||
                other.hasResult == hasResult) &&
            (identical(other.requestAttached, requestAttached) ||
                other.requestAttached == requestAttached));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, labId, labName, testName,
      category, date, time, status, statusLabel, hasResult, requestAttached);

  @override
  String toString() {
    return 'LabBooking(id: $id, labId: $labId, labName: $labName, testName: $testName, category: $category, date: $date, time: $time, status: $status, statusLabel: $statusLabel, hasResult: $hasResult, requestAttached: $requestAttached)';
  }
}

/// @nodoc
abstract mixin class _$LabBookingCopyWith<$Res>
    implements $LabBookingCopyWith<$Res> {
  factory _$LabBookingCopyWith(
          _LabBooking value, $Res Function(_LabBooking) _then) =
      __$LabBookingCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String labId,
      String labName,
      String testName,
      String category,
      String date,
      String time,
      String status,
      String statusLabel,
      bool hasResult,
      bool requestAttached});
}

/// @nodoc
class __$LabBookingCopyWithImpl<$Res> implements _$LabBookingCopyWith<$Res> {
  __$LabBookingCopyWithImpl(this._self, this._then);

  final _LabBooking _self;
  final $Res Function(_LabBooking) _then;

  /// Create a copy of LabBooking
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? labId = null,
    Object? labName = null,
    Object? testName = null,
    Object? category = null,
    Object? date = null,
    Object? time = null,
    Object? status = null,
    Object? statusLabel = null,
    Object? hasResult = null,
    Object? requestAttached = null,
  }) {
    return _then(_LabBooking(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      labId: null == labId
          ? _self.labId
          : labId // ignore: cast_nullable_to_non_nullable
              as String,
      labName: null == labName
          ? _self.labName
          : labName // ignore: cast_nullable_to_non_nullable
              as String,
      testName: null == testName
          ? _self.testName
          : testName // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      statusLabel: null == statusLabel
          ? _self.statusLabel
          : statusLabel // ignore: cast_nullable_to_non_nullable
              as String,
      hasResult: null == hasResult
          ? _self.hasResult
          : hasResult // ignore: cast_nullable_to_non_nullable
              as bool,
      requestAttached: null == requestAttached
          ? _self.requestAttached
          : requestAttached // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
