// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentRecord {
  String get transactionId;
  double get amount;
  String get currency;
  String get shippingMethod;
  double get shippingCost;
  ShippingAddress get shippingAddress;
  List<OrderItem> get items;

  /// Create a copy of PaymentRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaymentRecordCopyWith<PaymentRecord> get copyWith =>
      _$PaymentRecordCopyWithImpl<PaymentRecord>(
          this as PaymentRecord, _$identity);

  /// Serializes this PaymentRecord to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaymentRecord &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.shippingMethod, shippingMethod) ||
                other.shippingMethod == shippingMethod) &&
            (identical(other.shippingCost, shippingCost) ||
                other.shippingCost == shippingCost) &&
            (identical(other.shippingAddress, shippingAddress) ||
                other.shippingAddress == shippingAddress) &&
            const DeepCollectionEquality().equals(other.items, items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      transactionId,
      amount,
      currency,
      shippingMethod,
      shippingCost,
      shippingAddress,
      const DeepCollectionEquality().hash(items));

  @override
  String toString() {
    return 'PaymentRecord(transactionId: $transactionId, amount: $amount, currency: $currency, shippingMethod: $shippingMethod, shippingCost: $shippingCost, shippingAddress: $shippingAddress, items: $items)';
  }
}

/// @nodoc
abstract mixin class $PaymentRecordCopyWith<$Res> {
  factory $PaymentRecordCopyWith(
          PaymentRecord value, $Res Function(PaymentRecord) _then) =
      _$PaymentRecordCopyWithImpl;
  @useResult
  $Res call(
      {String transactionId,
      double amount,
      String currency,
      String shippingMethod,
      double shippingCost,
      ShippingAddress shippingAddress,
      List<OrderItem> items});

  $ShippingAddressCopyWith<$Res> get shippingAddress;
}

/// @nodoc
class _$PaymentRecordCopyWithImpl<$Res>
    implements $PaymentRecordCopyWith<$Res> {
  _$PaymentRecordCopyWithImpl(this._self, this._then);

  final PaymentRecord _self;
  final $Res Function(PaymentRecord) _then;

  /// Create a copy of PaymentRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = null,
    Object? amount = null,
    Object? currency = null,
    Object? shippingMethod = null,
    Object? shippingCost = null,
    Object? shippingAddress = null,
    Object? items = null,
  }) {
    return _then(_self.copyWith(
      transactionId: null == transactionId
          ? _self.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      shippingMethod: null == shippingMethod
          ? _self.shippingMethod
          : shippingMethod // ignore: cast_nullable_to_non_nullable
              as String,
      shippingCost: null == shippingCost
          ? _self.shippingCost
          : shippingCost // ignore: cast_nullable_to_non_nullable
              as double,
      shippingAddress: null == shippingAddress
          ? _self.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as ShippingAddress,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
    ));
  }

  /// Create a copy of PaymentRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShippingAddressCopyWith<$Res> get shippingAddress {
    return $ShippingAddressCopyWith<$Res>(_self.shippingAddress, (value) {
      return _then(_self.copyWith(shippingAddress: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PaymentRecord].
extension PaymentRecordPatterns on PaymentRecord {
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
    TResult Function(_PaymentRecord value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PaymentRecord() when $default != null:
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
    TResult Function(_PaymentRecord value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentRecord():
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
    TResult? Function(_PaymentRecord value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentRecord() when $default != null:
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
            String transactionId,
            double amount,
            String currency,
            String shippingMethod,
            double shippingCost,
            ShippingAddress shippingAddress,
            List<OrderItem> items)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PaymentRecord() when $default != null:
        return $default(
            _that.transactionId,
            _that.amount,
            _that.currency,
            _that.shippingMethod,
            _that.shippingCost,
            _that.shippingAddress,
            _that.items);
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
            String transactionId,
            double amount,
            String currency,
            String shippingMethod,
            double shippingCost,
            ShippingAddress shippingAddress,
            List<OrderItem> items)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentRecord():
        return $default(
            _that.transactionId,
            _that.amount,
            _that.currency,
            _that.shippingMethod,
            _that.shippingCost,
            _that.shippingAddress,
            _that.items);
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
            String transactionId,
            double amount,
            String currency,
            String shippingMethod,
            double shippingCost,
            ShippingAddress shippingAddress,
            List<OrderItem> items)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentRecord() when $default != null:
        return $default(
            _that.transactionId,
            _that.amount,
            _that.currency,
            _that.shippingMethod,
            _that.shippingCost,
            _that.shippingAddress,
            _that.items);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PaymentRecord extends PaymentRecord {
  const _PaymentRecord(
      {required this.transactionId,
      required this.amount,
      required this.currency,
      required this.shippingMethod,
      required this.shippingCost,
      required this.shippingAddress,
      required final List<OrderItem> items})
      : _items = items,
        super._();
  factory _PaymentRecord.fromJson(Map<String, dynamic> json) =>
      _$PaymentRecordFromJson(json);

  @override
  final String transactionId;
  @override
  final double amount;
  @override
  final String currency;
  @override
  final String shippingMethod;
  @override
  final double shippingCost;
  @override
  final ShippingAddress shippingAddress;
  final List<OrderItem> _items;
  @override
  List<OrderItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  /// Create a copy of PaymentRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PaymentRecordCopyWith<_PaymentRecord> get copyWith =>
      __$PaymentRecordCopyWithImpl<_PaymentRecord>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PaymentRecordToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaymentRecord &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.shippingMethod, shippingMethod) ||
                other.shippingMethod == shippingMethod) &&
            (identical(other.shippingCost, shippingCost) ||
                other.shippingCost == shippingCost) &&
            (identical(other.shippingAddress, shippingAddress) ||
                other.shippingAddress == shippingAddress) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      transactionId,
      amount,
      currency,
      shippingMethod,
      shippingCost,
      shippingAddress,
      const DeepCollectionEquality().hash(_items));

  @override
  String toString() {
    return 'PaymentRecord(transactionId: $transactionId, amount: $amount, currency: $currency, shippingMethod: $shippingMethod, shippingCost: $shippingCost, shippingAddress: $shippingAddress, items: $items)';
  }
}

/// @nodoc
abstract mixin class _$PaymentRecordCopyWith<$Res>
    implements $PaymentRecordCopyWith<$Res> {
  factory _$PaymentRecordCopyWith(
          _PaymentRecord value, $Res Function(_PaymentRecord) _then) =
      __$PaymentRecordCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String transactionId,
      double amount,
      String currency,
      String shippingMethod,
      double shippingCost,
      ShippingAddress shippingAddress,
      List<OrderItem> items});

  @override
  $ShippingAddressCopyWith<$Res> get shippingAddress;
}

/// @nodoc
class __$PaymentRecordCopyWithImpl<$Res>
    implements _$PaymentRecordCopyWith<$Res> {
  __$PaymentRecordCopyWithImpl(this._self, this._then);

  final _PaymentRecord _self;
  final $Res Function(_PaymentRecord) _then;

  /// Create a copy of PaymentRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? transactionId = null,
    Object? amount = null,
    Object? currency = null,
    Object? shippingMethod = null,
    Object? shippingCost = null,
    Object? shippingAddress = null,
    Object? items = null,
  }) {
    return _then(_PaymentRecord(
      transactionId: null == transactionId
          ? _self.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      shippingMethod: null == shippingMethod
          ? _self.shippingMethod
          : shippingMethod // ignore: cast_nullable_to_non_nullable
              as String,
      shippingCost: null == shippingCost
          ? _self.shippingCost
          : shippingCost // ignore: cast_nullable_to_non_nullable
              as double,
      shippingAddress: null == shippingAddress
          ? _self.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as ShippingAddress,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
    ));
  }

  /// Create a copy of PaymentRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShippingAddressCopyWith<$Res> get shippingAddress {
    return $ShippingAddressCopyWith<$Res>(_self.shippingAddress, (value) {
      return _then(_self.copyWith(shippingAddress: value));
    });
  }
}

/// @nodoc
mixin _$RazorpayTransaction {
  String get razorpayOrderId;
  double get amount;
  String get currency;
  String get receipt;
  Map<String, dynamic>? get notes;

  /// Create a copy of RazorpayTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RazorpayTransactionCopyWith<RazorpayTransaction> get copyWith =>
      _$RazorpayTransactionCopyWithImpl<RazorpayTransaction>(
          this as RazorpayTransaction, _$identity);

  /// Serializes this RazorpayTransaction to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RazorpayTransaction &&
            (identical(other.razorpayOrderId, razorpayOrderId) ||
                other.razorpayOrderId == razorpayOrderId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.receipt, receipt) || other.receipt == receipt) &&
            const DeepCollectionEquality().equals(other.notes, notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, razorpayOrderId, amount,
      currency, receipt, const DeepCollectionEquality().hash(notes));

  @override
  String toString() {
    return 'RazorpayTransaction(razorpayOrderId: $razorpayOrderId, amount: $amount, currency: $currency, receipt: $receipt, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class $RazorpayTransactionCopyWith<$Res> {
  factory $RazorpayTransactionCopyWith(
          RazorpayTransaction value, $Res Function(RazorpayTransaction) _then) =
      _$RazorpayTransactionCopyWithImpl;
  @useResult
  $Res call(
      {String razorpayOrderId,
      double amount,
      String currency,
      String receipt,
      Map<String, dynamic>? notes});
}

/// @nodoc
class _$RazorpayTransactionCopyWithImpl<$Res>
    implements $RazorpayTransactionCopyWith<$Res> {
  _$RazorpayTransactionCopyWithImpl(this._self, this._then);

  final RazorpayTransaction _self;
  final $Res Function(RazorpayTransaction) _then;

  /// Create a copy of RazorpayTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? razorpayOrderId = null,
    Object? amount = null,
    Object? currency = null,
    Object? receipt = null,
    Object? notes = freezed,
  }) {
    return _then(_self.copyWith(
      razorpayOrderId: null == razorpayOrderId
          ? _self.razorpayOrderId
          : razorpayOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      receipt: null == receipt
          ? _self.receipt
          : receipt // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [RazorpayTransaction].
extension RazorpayTransactionPatterns on RazorpayTransaction {
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
    TResult Function(_RazorpayTransaction value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RazorpayTransaction() when $default != null:
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
    TResult Function(_RazorpayTransaction value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RazorpayTransaction():
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
    TResult? Function(_RazorpayTransaction value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RazorpayTransaction() when $default != null:
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
    TResult Function(String razorpayOrderId, double amount, String currency,
            String receipt, Map<String, dynamic>? notes)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RazorpayTransaction() when $default != null:
        return $default(_that.razorpayOrderId, _that.amount, _that.currency,
            _that.receipt, _that.notes);
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
    TResult Function(String razorpayOrderId, double amount, String currency,
            String receipt, Map<String, dynamic>? notes)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RazorpayTransaction():
        return $default(_that.razorpayOrderId, _that.amount, _that.currency,
            _that.receipt, _that.notes);
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
    TResult? Function(String razorpayOrderId, double amount, String currency,
            String receipt, Map<String, dynamic>? notes)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RazorpayTransaction() when $default != null:
        return $default(_that.razorpayOrderId, _that.amount, _that.currency,
            _that.receipt, _that.notes);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _RazorpayTransaction extends RazorpayTransaction {
  const _RazorpayTransaction(
      {required this.razorpayOrderId,
      required this.amount,
      required this.currency,
      required this.receipt,
      final Map<String, dynamic>? notes})
      : _notes = notes,
        super._();
  factory _RazorpayTransaction.fromJson(Map<String, dynamic> json) =>
      _$RazorpayTransactionFromJson(json);

  @override
  final String razorpayOrderId;
  @override
  final double amount;
  @override
  final String currency;
  @override
  final String receipt;
  final Map<String, dynamic>? _notes;
  @override
  Map<String, dynamic>? get notes {
    final value = _notes;
    if (value == null) return null;
    if (_notes is EqualUnmodifiableMapView) return _notes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Create a copy of RazorpayTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RazorpayTransactionCopyWith<_RazorpayTransaction> get copyWith =>
      __$RazorpayTransactionCopyWithImpl<_RazorpayTransaction>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RazorpayTransactionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RazorpayTransaction &&
            (identical(other.razorpayOrderId, razorpayOrderId) ||
                other.razorpayOrderId == razorpayOrderId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.receipt, receipt) || other.receipt == receipt) &&
            const DeepCollectionEquality().equals(other._notes, _notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, razorpayOrderId, amount,
      currency, receipt, const DeepCollectionEquality().hash(_notes));

  @override
  String toString() {
    return 'RazorpayTransaction(razorpayOrderId: $razorpayOrderId, amount: $amount, currency: $currency, receipt: $receipt, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class _$RazorpayTransactionCopyWith<$Res>
    implements $RazorpayTransactionCopyWith<$Res> {
  factory _$RazorpayTransactionCopyWith(_RazorpayTransaction value,
          $Res Function(_RazorpayTransaction) _then) =
      __$RazorpayTransactionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String razorpayOrderId,
      double amount,
      String currency,
      String receipt,
      Map<String, dynamic>? notes});
}

/// @nodoc
class __$RazorpayTransactionCopyWithImpl<$Res>
    implements _$RazorpayTransactionCopyWith<$Res> {
  __$RazorpayTransactionCopyWithImpl(this._self, this._then);

  final _RazorpayTransaction _self;
  final $Res Function(_RazorpayTransaction) _then;

  /// Create a copy of RazorpayTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? razorpayOrderId = null,
    Object? amount = null,
    Object? currency = null,
    Object? receipt = null,
    Object? notes = freezed,
  }) {
    return _then(_RazorpayTransaction(
      razorpayOrderId: null == razorpayOrderId
          ? _self.razorpayOrderId
          : razorpayOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      receipt: null == receipt
          ? _self.receipt
          : receipt // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _self._notes
          : notes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

// dart format on
