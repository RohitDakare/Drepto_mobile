// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Product {
  String get name;
  String get description;
  String get detailedDescription;
  double get price;
  double get mrp;
  List<String> get images;
  String get category;
  List<String> get ingredients;
  List<String> get benefits;
  List<String> get sideEffects;
  String get developmentStory;
  String? get id;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductCopyWith<Product> get copyWith =>
      _$ProductCopyWithImpl<Product>(this as Product, _$identity);

  /// Serializes this Product to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Product &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.detailedDescription, detailedDescription) ||
                other.detailedDescription == detailedDescription) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.mrp, mrp) || other.mrp == mrp) &&
            const DeepCollectionEquality().equals(other.images, images) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality()
                .equals(other.ingredients, ingredients) &&
            const DeepCollectionEquality().equals(other.benefits, benefits) &&
            const DeepCollectionEquality()
                .equals(other.sideEffects, sideEffects) &&
            (identical(other.developmentStory, developmentStory) ||
                other.developmentStory == developmentStory) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      description,
      detailedDescription,
      price,
      mrp,
      const DeepCollectionEquality().hash(images),
      category,
      const DeepCollectionEquality().hash(ingredients),
      const DeepCollectionEquality().hash(benefits),
      const DeepCollectionEquality().hash(sideEffects),
      developmentStory,
      id);

  @override
  String toString() {
    return 'Product(name: $name, description: $description, detailedDescription: $detailedDescription, price: $price, mrp: $mrp, images: $images, category: $category, ingredients: $ingredients, benefits: $benefits, sideEffects: $sideEffects, developmentStory: $developmentStory, id: $id)';
  }
}

/// @nodoc
abstract mixin class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) _then) =
      _$ProductCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      String description,
      String detailedDescription,
      double price,
      double mrp,
      List<String> images,
      String category,
      List<String> ingredients,
      List<String> benefits,
      List<String> sideEffects,
      String developmentStory,
      String? id});
}

/// @nodoc
class _$ProductCopyWithImpl<$Res> implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._self, this._then);

  final Product _self;
  final $Res Function(Product) _then;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? detailedDescription = null,
    Object? price = null,
    Object? mrp = null,
    Object? images = null,
    Object? category = null,
    Object? ingredients = null,
    Object? benefits = null,
    Object? sideEffects = null,
    Object? developmentStory = null,
    Object? id = freezed,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      detailedDescription: null == detailedDescription
          ? _self.detailedDescription
          : detailedDescription // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      mrp: null == mrp
          ? _self.mrp
          : mrp // ignore: cast_nullable_to_non_nullable
              as double,
      images: null == images
          ? _self.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      ingredients: null == ingredients
          ? _self.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<String>,
      benefits: null == benefits
          ? _self.benefits
          : benefits // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sideEffects: null == sideEffects
          ? _self.sideEffects
          : sideEffects // ignore: cast_nullable_to_non_nullable
              as List<String>,
      developmentStory: null == developmentStory
          ? _self.developmentStory
          : developmentStory // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [Product].
extension ProductPatterns on Product {
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
    TResult Function(_Product value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Product() when $default != null:
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
    TResult Function(_Product value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Product():
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
    TResult? Function(_Product value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Product() when $default != null:
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
            String name,
            String description,
            String detailedDescription,
            double price,
            double mrp,
            List<String> images,
            String category,
            List<String> ingredients,
            List<String> benefits,
            List<String> sideEffects,
            String developmentStory,
            String? id)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Product() when $default != null:
        return $default(
            _that.name,
            _that.description,
            _that.detailedDescription,
            _that.price,
            _that.mrp,
            _that.images,
            _that.category,
            _that.ingredients,
            _that.benefits,
            _that.sideEffects,
            _that.developmentStory,
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
            String name,
            String description,
            String detailedDescription,
            double price,
            double mrp,
            List<String> images,
            String category,
            List<String> ingredients,
            List<String> benefits,
            List<String> sideEffects,
            String developmentStory,
            String? id)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Product():
        return $default(
            _that.name,
            _that.description,
            _that.detailedDescription,
            _that.price,
            _that.mrp,
            _that.images,
            _that.category,
            _that.ingredients,
            _that.benefits,
            _that.sideEffects,
            _that.developmentStory,
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
            String name,
            String description,
            String detailedDescription,
            double price,
            double mrp,
            List<String> images,
            String category,
            List<String> ingredients,
            List<String> benefits,
            List<String> sideEffects,
            String developmentStory,
            String? id)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Product() when $default != null:
        return $default(
            _that.name,
            _that.description,
            _that.detailedDescription,
            _that.price,
            _that.mrp,
            _that.images,
            _that.category,
            _that.ingredients,
            _that.benefits,
            _that.sideEffects,
            _that.developmentStory,
            _that.id);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Product extends Product {
  const _Product(
      {required this.name,
      required this.description,
      required this.detailedDescription,
      required this.price,
      required this.mrp,
      required final List<String> images,
      required this.category,
      required final List<String> ingredients,
      required final List<String> benefits,
      required final List<String> sideEffects,
      required this.developmentStory,
      this.id})
      : _images = images,
        _ingredients = ingredients,
        _benefits = benefits,
        _sideEffects = sideEffects,
        super._();
  factory _Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  @override
  final String name;
  @override
  final String description;
  @override
  final String detailedDescription;
  @override
  final double price;
  @override
  final double mrp;
  final List<String> _images;
  @override
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  final String category;
  final List<String> _ingredients;
  @override
  List<String> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  final List<String> _benefits;
  @override
  List<String> get benefits {
    if (_benefits is EqualUnmodifiableListView) return _benefits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_benefits);
  }

  final List<String> _sideEffects;
  @override
  List<String> get sideEffects {
    if (_sideEffects is EqualUnmodifiableListView) return _sideEffects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sideEffects);
  }

  @override
  final String developmentStory;
  @override
  final String? id;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProductCopyWith<_Product> get copyWith =>
      __$ProductCopyWithImpl<_Product>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProductToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Product &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.detailedDescription, detailedDescription) ||
                other.detailedDescription == detailedDescription) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.mrp, mrp) || other.mrp == mrp) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients) &&
            const DeepCollectionEquality().equals(other._benefits, _benefits) &&
            const DeepCollectionEquality()
                .equals(other._sideEffects, _sideEffects) &&
            (identical(other.developmentStory, developmentStory) ||
                other.developmentStory == developmentStory) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      description,
      detailedDescription,
      price,
      mrp,
      const DeepCollectionEquality().hash(_images),
      category,
      const DeepCollectionEquality().hash(_ingredients),
      const DeepCollectionEquality().hash(_benefits),
      const DeepCollectionEquality().hash(_sideEffects),
      developmentStory,
      id);

  @override
  String toString() {
    return 'Product(name: $name, description: $description, detailedDescription: $detailedDescription, price: $price, mrp: $mrp, images: $images, category: $category, ingredients: $ingredients, benefits: $benefits, sideEffects: $sideEffects, developmentStory: $developmentStory, id: $id)';
  }
}

/// @nodoc
abstract mixin class _$ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$ProductCopyWith(_Product value, $Res Function(_Product) _then) =
      __$ProductCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name,
      String description,
      String detailedDescription,
      double price,
      double mrp,
      List<String> images,
      String category,
      List<String> ingredients,
      List<String> benefits,
      List<String> sideEffects,
      String developmentStory,
      String? id});
}

/// @nodoc
class __$ProductCopyWithImpl<$Res> implements _$ProductCopyWith<$Res> {
  __$ProductCopyWithImpl(this._self, this._then);

  final _Product _self;
  final $Res Function(_Product) _then;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? detailedDescription = null,
    Object? price = null,
    Object? mrp = null,
    Object? images = null,
    Object? category = null,
    Object? ingredients = null,
    Object? benefits = null,
    Object? sideEffects = null,
    Object? developmentStory = null,
    Object? id = freezed,
  }) {
    return _then(_Product(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      detailedDescription: null == detailedDescription
          ? _self.detailedDescription
          : detailedDescription // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      mrp: null == mrp
          ? _self.mrp
          : mrp // ignore: cast_nullable_to_non_nullable
              as double,
      images: null == images
          ? _self._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      ingredients: null == ingredients
          ? _self._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<String>,
      benefits: null == benefits
          ? _self._benefits
          : benefits // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sideEffects: null == sideEffects
          ? _self._sideEffects
          : sideEffects // ignore: cast_nullable_to_non_nullable
              as List<String>,
      developmentStory: null == developmentStory
          ? _self.developmentStory
          : developmentStory // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
