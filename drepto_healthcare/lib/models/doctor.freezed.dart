// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doctor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Doctor {
  String get id;
  String get name;
  String get specialization;
  int get experienceYears;
  double get rating;
  String get nextAvailable;
  String? get hospital;
  int? get reviews;
  int? get patients;
  String? get about;
  String? get imageUrl;
  List<String>? get availableSlots;
  double? get videoConsultationFee;
  double? get clinicVisitFee;
  bool get isOnline;

  /// Create a copy of Doctor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DoctorCopyWith<Doctor> get copyWith =>
      _$DoctorCopyWithImpl<Doctor>(this as Doctor, _$identity);

  /// Serializes this Doctor to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Doctor &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.specialization, specialization) ||
                other.specialization == specialization) &&
            (identical(other.experienceYears, experienceYears) ||
                other.experienceYears == experienceYears) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.nextAvailable, nextAvailable) ||
                other.nextAvailable == nextAvailable) &&
            (identical(other.hospital, hospital) ||
                other.hospital == hospital) &&
            (identical(other.reviews, reviews) || other.reviews == reviews) &&
            (identical(other.patients, patients) ||
                other.patients == patients) &&
            (identical(other.about, about) || other.about == about) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality()
                .equals(other.availableSlots, availableSlots) &&
            (identical(other.videoConsultationFee, videoConsultationFee) ||
                other.videoConsultationFee == videoConsultationFee) &&
            (identical(other.clinicVisitFee, clinicVisitFee) ||
                other.clinicVisitFee == clinicVisitFee) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      specialization,
      experienceYears,
      rating,
      nextAvailable,
      hospital,
      reviews,
      patients,
      about,
      imageUrl,
      const DeepCollectionEquality().hash(availableSlots),
      videoConsultationFee,
      clinicVisitFee,
      isOnline);

  @override
  String toString() {
    return 'Doctor(id: $id, name: $name, specialization: $specialization, experienceYears: $experienceYears, rating: $rating, nextAvailable: $nextAvailable, hospital: $hospital, reviews: $reviews, patients: $patients, about: $about, imageUrl: $imageUrl, availableSlots: $availableSlots, videoConsultationFee: $videoConsultationFee, clinicVisitFee: $clinicVisitFee, isOnline: $isOnline)';
  }
}

/// @nodoc
abstract mixin class $DoctorCopyWith<$Res> {
  factory $DoctorCopyWith(Doctor value, $Res Function(Doctor) _then) =
      _$DoctorCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      String specialization,
      int experienceYears,
      double rating,
      String nextAvailable,
      String? hospital,
      int? reviews,
      int? patients,
      String? about,
      String? imageUrl,
      List<String>? availableSlots,
      double? videoConsultationFee,
      double? clinicVisitFee,
      bool isOnline});
}

/// @nodoc
class _$DoctorCopyWithImpl<$Res> implements $DoctorCopyWith<$Res> {
  _$DoctorCopyWithImpl(this._self, this._then);

  final Doctor _self;
  final $Res Function(Doctor) _then;

  /// Create a copy of Doctor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? specialization = null,
    Object? experienceYears = null,
    Object? rating = null,
    Object? nextAvailable = null,
    Object? hospital = freezed,
    Object? reviews = freezed,
    Object? patients = freezed,
    Object? about = freezed,
    Object? imageUrl = freezed,
    Object? availableSlots = freezed,
    Object? videoConsultationFee = freezed,
    Object? clinicVisitFee = freezed,
    Object? isOnline = null,
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
      specialization: null == specialization
          ? _self.specialization
          : specialization // ignore: cast_nullable_to_non_nullable
              as String,
      experienceYears: null == experienceYears
          ? _self.experienceYears
          : experienceYears // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      nextAvailable: null == nextAvailable
          ? _self.nextAvailable
          : nextAvailable // ignore: cast_nullable_to_non_nullable
              as String,
      hospital: freezed == hospital
          ? _self.hospital
          : hospital // ignore: cast_nullable_to_non_nullable
              as String?,
      reviews: freezed == reviews
          ? _self.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as int?,
      patients: freezed == patients
          ? _self.patients
          : patients // ignore: cast_nullable_to_non_nullable
              as int?,
      about: freezed == about
          ? _self.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      availableSlots: freezed == availableSlots
          ? _self.availableSlots
          : availableSlots // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      videoConsultationFee: freezed == videoConsultationFee
          ? _self.videoConsultationFee
          : videoConsultationFee // ignore: cast_nullable_to_non_nullable
              as double?,
      clinicVisitFee: freezed == clinicVisitFee
          ? _self.clinicVisitFee
          : clinicVisitFee // ignore: cast_nullable_to_non_nullable
              as double?,
      isOnline: null == isOnline
          ? _self.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [Doctor].
extension DoctorPatterns on Doctor {
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
    TResult Function(_Doctor value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Doctor() when $default != null:
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
    TResult Function(_Doctor value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Doctor():
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
    TResult? Function(_Doctor value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Doctor() when $default != null:
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
            String name,
            String specialization,
            int experienceYears,
            double rating,
            String nextAvailable,
            String? hospital,
            int? reviews,
            int? patients,
            String? about,
            String? imageUrl,
            List<String>? availableSlots,
            double? videoConsultationFee,
            double? clinicVisitFee,
            bool isOnline)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Doctor() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.specialization,
            _that.experienceYears,
            _that.rating,
            _that.nextAvailable,
            _that.hospital,
            _that.reviews,
            _that.patients,
            _that.about,
            _that.imageUrl,
            _that.availableSlots,
            _that.videoConsultationFee,
            _that.clinicVisitFee,
            _that.isOnline);
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
            String name,
            String specialization,
            int experienceYears,
            double rating,
            String nextAvailable,
            String? hospital,
            int? reviews,
            int? patients,
            String? about,
            String? imageUrl,
            List<String>? availableSlots,
            double? videoConsultationFee,
            double? clinicVisitFee,
            bool isOnline)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Doctor():
        return $default(
            _that.id,
            _that.name,
            _that.specialization,
            _that.experienceYears,
            _that.rating,
            _that.nextAvailable,
            _that.hospital,
            _that.reviews,
            _that.patients,
            _that.about,
            _that.imageUrl,
            _that.availableSlots,
            _that.videoConsultationFee,
            _that.clinicVisitFee,
            _that.isOnline);
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
            String name,
            String specialization,
            int experienceYears,
            double rating,
            String nextAvailable,
            String? hospital,
            int? reviews,
            int? patients,
            String? about,
            String? imageUrl,
            List<String>? availableSlots,
            double? videoConsultationFee,
            double? clinicVisitFee,
            bool isOnline)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Doctor() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.specialization,
            _that.experienceYears,
            _that.rating,
            _that.nextAvailable,
            _that.hospital,
            _that.reviews,
            _that.patients,
            _that.about,
            _that.imageUrl,
            _that.availableSlots,
            _that.videoConsultationFee,
            _that.clinicVisitFee,
            _that.isOnline);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Doctor extends Doctor {
  const _Doctor(
      {required this.id,
      required this.name,
      required this.specialization,
      required this.experienceYears,
      required this.rating,
      required this.nextAvailable,
      this.hospital,
      this.reviews,
      this.patients,
      this.about,
      this.imageUrl,
      final List<String>? availableSlots,
      this.videoConsultationFee,
      this.clinicVisitFee,
      this.isOnline = false})
      : _availableSlots = availableSlots,
        super._();
  factory _Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String specialization;
  @override
  final int experienceYears;
  @override
  final double rating;
  @override
  final String nextAvailable;
  @override
  final String? hospital;
  @override
  final int? reviews;
  @override
  final int? patients;
  @override
  final String? about;
  @override
  final String? imageUrl;
  final List<String>? _availableSlots;
  @override
  List<String>? get availableSlots {
    final value = _availableSlots;
    if (value == null) return null;
    if (_availableSlots is EqualUnmodifiableListView) return _availableSlots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final double? videoConsultationFee;
  @override
  final double? clinicVisitFee;
  @override
  @JsonKey()
  final bool isOnline;

  /// Create a copy of Doctor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DoctorCopyWith<_Doctor> get copyWith =>
      __$DoctorCopyWithImpl<_Doctor>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DoctorToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Doctor &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.specialization, specialization) ||
                other.specialization == specialization) &&
            (identical(other.experienceYears, experienceYears) ||
                other.experienceYears == experienceYears) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.nextAvailable, nextAvailable) ||
                other.nextAvailable == nextAvailable) &&
            (identical(other.hospital, hospital) ||
                other.hospital == hospital) &&
            (identical(other.reviews, reviews) || other.reviews == reviews) &&
            (identical(other.patients, patients) ||
                other.patients == patients) &&
            (identical(other.about, about) || other.about == about) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality()
                .equals(other._availableSlots, _availableSlots) &&
            (identical(other.videoConsultationFee, videoConsultationFee) ||
                other.videoConsultationFee == videoConsultationFee) &&
            (identical(other.clinicVisitFee, clinicVisitFee) ||
                other.clinicVisitFee == clinicVisitFee) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      specialization,
      experienceYears,
      rating,
      nextAvailable,
      hospital,
      reviews,
      patients,
      about,
      imageUrl,
      const DeepCollectionEquality().hash(_availableSlots),
      videoConsultationFee,
      clinicVisitFee,
      isOnline);

  @override
  String toString() {
    return 'Doctor(id: $id, name: $name, specialization: $specialization, experienceYears: $experienceYears, rating: $rating, nextAvailable: $nextAvailable, hospital: $hospital, reviews: $reviews, patients: $patients, about: $about, imageUrl: $imageUrl, availableSlots: $availableSlots, videoConsultationFee: $videoConsultationFee, clinicVisitFee: $clinicVisitFee, isOnline: $isOnline)';
  }
}

/// @nodoc
abstract mixin class _$DoctorCopyWith<$Res> implements $DoctorCopyWith<$Res> {
  factory _$DoctorCopyWith(_Doctor value, $Res Function(_Doctor) _then) =
      __$DoctorCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String specialization,
      int experienceYears,
      double rating,
      String nextAvailable,
      String? hospital,
      int? reviews,
      int? patients,
      String? about,
      String? imageUrl,
      List<String>? availableSlots,
      double? videoConsultationFee,
      double? clinicVisitFee,
      bool isOnline});
}

/// @nodoc
class __$DoctorCopyWithImpl<$Res> implements _$DoctorCopyWith<$Res> {
  __$DoctorCopyWithImpl(this._self, this._then);

  final _Doctor _self;
  final $Res Function(_Doctor) _then;

  /// Create a copy of Doctor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? specialization = null,
    Object? experienceYears = null,
    Object? rating = null,
    Object? nextAvailable = null,
    Object? hospital = freezed,
    Object? reviews = freezed,
    Object? patients = freezed,
    Object? about = freezed,
    Object? imageUrl = freezed,
    Object? availableSlots = freezed,
    Object? videoConsultationFee = freezed,
    Object? clinicVisitFee = freezed,
    Object? isOnline = null,
  }) {
    return _then(_Doctor(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      specialization: null == specialization
          ? _self.specialization
          : specialization // ignore: cast_nullable_to_non_nullable
              as String,
      experienceYears: null == experienceYears
          ? _self.experienceYears
          : experienceYears // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      nextAvailable: null == nextAvailable
          ? _self.nextAvailable
          : nextAvailable // ignore: cast_nullable_to_non_nullable
              as String,
      hospital: freezed == hospital
          ? _self.hospital
          : hospital // ignore: cast_nullable_to_non_nullable
              as String?,
      reviews: freezed == reviews
          ? _self.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as int?,
      patients: freezed == patients
          ? _self.patients
          : patients // ignore: cast_nullable_to_non_nullable
              as int?,
      about: freezed == about
          ? _self.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      availableSlots: freezed == availableSlots
          ? _self._availableSlots
          : availableSlots // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      videoConsultationFee: freezed == videoConsultationFee
          ? _self.videoConsultationFee
          : videoConsultationFee // ignore: cast_nullable_to_non_nullable
              as double?,
      clinicVisitFee: freezed == clinicVisitFee
          ? _self.clinicVisitFee
          : clinicVisitFee // ignore: cast_nullable_to_non_nullable
              as double?,
      isOnline: null == isOnline
          ? _self.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
