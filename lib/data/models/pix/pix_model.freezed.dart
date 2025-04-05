// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pix_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PixResponseModel _$PixResponseModelFromJson(Map<String, dynamic> json) {
  return _PixResponseModel.fromJson(json);
}

/// @nodoc
mixin _$PixResponseModel {
  String? get error => throw _privateConstructorUsedError;
  PixModel get data => throw _privateConstructorUsedError;

  /// Serializes this PixResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PixResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PixResponseModelCopyWith<PixResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PixResponseModelCopyWith<$Res> {
  factory $PixResponseModelCopyWith(
          PixResponseModel value, $Res Function(PixResponseModel) then) =
      _$PixResponseModelCopyWithImpl<$Res, PixResponseModel>;
  @useResult
  $Res call({String? error, PixModel data});

  $PixModelCopyWith<$Res> get data;
}

/// @nodoc
class _$PixResponseModelCopyWithImpl<$Res, $Val extends PixResponseModel>
    implements $PixResponseModelCopyWith<$Res> {
  _$PixResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PixResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as PixModel,
    ) as $Val);
  }

  /// Create a copy of PixResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PixModelCopyWith<$Res> get data {
    return $PixModelCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PixResponseModelImplCopyWith<$Res>
    implements $PixResponseModelCopyWith<$Res> {
  factory _$$PixResponseModelImplCopyWith(_$PixResponseModelImpl value,
          $Res Function(_$PixResponseModelImpl) then) =
      __$$PixResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? error, PixModel data});

  @override
  $PixModelCopyWith<$Res> get data;
}

/// @nodoc
class __$$PixResponseModelImplCopyWithImpl<$Res>
    extends _$PixResponseModelCopyWithImpl<$Res, _$PixResponseModelImpl>
    implements _$$PixResponseModelImplCopyWith<$Res> {
  __$$PixResponseModelImplCopyWithImpl(_$PixResponseModelImpl _value,
      $Res Function(_$PixResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PixResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? data = null,
  }) {
    return _then(_$PixResponseModelImpl(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as PixModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PixResponseModelImpl implements _PixResponseModel {
  const _$PixResponseModelImpl({required this.error, required this.data});

  factory _$PixResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PixResponseModelImplFromJson(json);

  @override
  final String? error;
  @override
  final PixModel data;

  @override
  String toString() {
    return 'PixResponseModel(error: $error, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PixResponseModelImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, error, data);

  /// Create a copy of PixResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PixResponseModelImplCopyWith<_$PixResponseModelImpl> get copyWith =>
      __$$PixResponseModelImplCopyWithImpl<_$PixResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PixResponseModelImplToJson(
      this,
    );
  }
}

abstract class _PixResponseModel implements PixResponseModel {
  const factory _PixResponseModel(
      {required final String? error,
      required final PixModel data}) = _$PixResponseModelImpl;

  factory _PixResponseModel.fromJson(Map<String, dynamic> json) =
      _$PixResponseModelImpl.fromJson;

  @override
  String? get error;
  @override
  PixModel get data;

  /// Create a copy of PixResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PixResponseModelImplCopyWith<_$PixResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PixModel _$PixModelFromJson(Map<String, dynamic> json) {
  return _PixModel.fromJson(json);
}

/// @nodoc
mixin _$PixModel {
  String get id => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  bool get devMode => throw _privateConstructorUsedError;
  String get brCode => throw _privateConstructorUsedError;
  String get brCodeBase64 => throw _privateConstructorUsedError;
  int get platformFee => throw _privateConstructorUsedError;
  String get customerId => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  DateTime get expiresAt => throw _privateConstructorUsedError;

  /// Serializes this PixModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PixModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PixModelCopyWith<PixModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PixModelCopyWith<$Res> {
  factory $PixModelCopyWith(PixModel value, $Res Function(PixModel) then) =
      _$PixModelCopyWithImpl<$Res, PixModel>;
  @useResult
  $Res call(
      {String id,
      int amount,
      String status,
      bool devMode,
      String brCode,
      String brCodeBase64,
      int platformFee,
      String customerId,
      String description,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime expiresAt});
}

/// @nodoc
class _$PixModelCopyWithImpl<$Res, $Val extends PixModel>
    implements $PixModelCopyWith<$Res> {
  _$PixModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PixModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? status = null,
    Object? devMode = null,
    Object? brCode = null,
    Object? brCodeBase64 = null,
    Object? platformFee = null,
    Object? customerId = null,
    Object? description = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? expiresAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      devMode: null == devMode
          ? _value.devMode
          : devMode // ignore: cast_nullable_to_non_nullable
              as bool,
      brCode: null == brCode
          ? _value.brCode
          : brCode // ignore: cast_nullable_to_non_nullable
              as String,
      brCodeBase64: null == brCodeBase64
          ? _value.brCodeBase64
          : brCodeBase64 // ignore: cast_nullable_to_non_nullable
              as String,
      platformFee: null == platformFee
          ? _value.platformFee
          : platformFee // ignore: cast_nullable_to_non_nullable
              as int,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PixModelImplCopyWith<$Res>
    implements $PixModelCopyWith<$Res> {
  factory _$$PixModelImplCopyWith(
          _$PixModelImpl value, $Res Function(_$PixModelImpl) then) =
      __$$PixModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      int amount,
      String status,
      bool devMode,
      String brCode,
      String brCodeBase64,
      int platformFee,
      String customerId,
      String description,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime expiresAt});
}

/// @nodoc
class __$$PixModelImplCopyWithImpl<$Res>
    extends _$PixModelCopyWithImpl<$Res, _$PixModelImpl>
    implements _$$PixModelImplCopyWith<$Res> {
  __$$PixModelImplCopyWithImpl(
      _$PixModelImpl _value, $Res Function(_$PixModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PixModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? status = null,
    Object? devMode = null,
    Object? brCode = null,
    Object? brCodeBase64 = null,
    Object? platformFee = null,
    Object? customerId = null,
    Object? description = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? expiresAt = null,
  }) {
    return _then(_$PixModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      devMode: null == devMode
          ? _value.devMode
          : devMode // ignore: cast_nullable_to_non_nullable
              as bool,
      brCode: null == brCode
          ? _value.brCode
          : brCode // ignore: cast_nullable_to_non_nullable
              as String,
      brCodeBase64: null == brCodeBase64
          ? _value.brCodeBase64
          : brCodeBase64 // ignore: cast_nullable_to_non_nullable
              as String,
      platformFee: null == platformFee
          ? _value.platformFee
          : platformFee // ignore: cast_nullable_to_non_nullable
              as int,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PixModelImpl implements _PixModel {
  const _$PixModelImpl(
      {required this.id,
      required this.amount,
      required this.status,
      required this.devMode,
      required this.brCode,
      required this.brCodeBase64,
      required this.platformFee,
      required this.customerId,
      required this.description,
      required this.createdAt,
      required this.updatedAt,
      required this.expiresAt});

  factory _$PixModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PixModelImplFromJson(json);

  @override
  final String id;
  @override
  final int amount;
  @override
  final String status;
  @override
  final bool devMode;
  @override
  final String brCode;
  @override
  final String brCodeBase64;
  @override
  final int platformFee;
  @override
  final String customerId;
  @override
  final String description;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime expiresAt;

  @override
  String toString() {
    return 'PixModel(id: $id, amount: $amount, status: $status, devMode: $devMode, brCode: $brCode, brCodeBase64: $brCodeBase64, platformFee: $platformFee, customerId: $customerId, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, expiresAt: $expiresAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PixModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.devMode, devMode) || other.devMode == devMode) &&
            (identical(other.brCode, brCode) || other.brCode == brCode) &&
            (identical(other.brCodeBase64, brCodeBase64) ||
                other.brCodeBase64 == brCodeBase64) &&
            (identical(other.platformFee, platformFee) ||
                other.platformFee == platformFee) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      amount,
      status,
      devMode,
      brCode,
      brCodeBase64,
      platformFee,
      customerId,
      description,
      createdAt,
      updatedAt,
      expiresAt);

  /// Create a copy of PixModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PixModelImplCopyWith<_$PixModelImpl> get copyWith =>
      __$$PixModelImplCopyWithImpl<_$PixModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PixModelImplToJson(
      this,
    );
  }
}

abstract class _PixModel implements PixModel {
  const factory _PixModel(
      {required final String id,
      required final int amount,
      required final String status,
      required final bool devMode,
      required final String brCode,
      required final String brCodeBase64,
      required final int platformFee,
      required final String customerId,
      required final String description,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final DateTime expiresAt}) = _$PixModelImpl;

  factory _PixModel.fromJson(Map<String, dynamic> json) =
      _$PixModelImpl.fromJson;

  @override
  String get id;
  @override
  int get amount;
  @override
  String get status;
  @override
  bool get devMode;
  @override
  String get brCode;
  @override
  String get brCodeBase64;
  @override
  int get platformFee;
  @override
  String get customerId;
  @override
  String get description;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  DateTime get expiresAt;

  /// Create a copy of PixModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PixModelImplCopyWith<_$PixModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
