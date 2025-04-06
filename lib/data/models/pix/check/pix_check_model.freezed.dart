// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pix_check_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PixCheckModel _$PixCheckModelFromJson(Map<String, dynamic> json) {
  return _PixCheckModel.fromJson(json);
}

/// @nodoc
mixin _$PixCheckModel {
  String? get error => throw _privateConstructorUsedError;
  PixStatusModel get data => throw _privateConstructorUsedError;

  /// Serializes this PixCheckModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PixCheckModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PixCheckModelCopyWith<PixCheckModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PixCheckModelCopyWith<$Res> {
  factory $PixCheckModelCopyWith(
          PixCheckModel value, $Res Function(PixCheckModel) then) =
      _$PixCheckModelCopyWithImpl<$Res, PixCheckModel>;
  @useResult
  $Res call({String? error, PixStatusModel data});

  $PixStatusModelCopyWith<$Res> get data;
}

/// @nodoc
class _$PixCheckModelCopyWithImpl<$Res, $Val extends PixCheckModel>
    implements $PixCheckModelCopyWith<$Res> {
  _$PixCheckModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PixCheckModel
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
              as PixStatusModel,
    ) as $Val);
  }

  /// Create a copy of PixCheckModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PixStatusModelCopyWith<$Res> get data {
    return $PixStatusModelCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PixCheckModelImplCopyWith<$Res>
    implements $PixCheckModelCopyWith<$Res> {
  factory _$$PixCheckModelImplCopyWith(
          _$PixCheckModelImpl value, $Res Function(_$PixCheckModelImpl) then) =
      __$$PixCheckModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? error, PixStatusModel data});

  @override
  $PixStatusModelCopyWith<$Res> get data;
}

/// @nodoc
class __$$PixCheckModelImplCopyWithImpl<$Res>
    extends _$PixCheckModelCopyWithImpl<$Res, _$PixCheckModelImpl>
    implements _$$PixCheckModelImplCopyWith<$Res> {
  __$$PixCheckModelImplCopyWithImpl(
      _$PixCheckModelImpl _value, $Res Function(_$PixCheckModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PixCheckModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? data = null,
  }) {
    return _then(_$PixCheckModelImpl(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as PixStatusModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PixCheckModelImpl implements _PixCheckModel {
  const _$PixCheckModelImpl({required this.error, required this.data});

  factory _$PixCheckModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PixCheckModelImplFromJson(json);

  @override
  final String? error;
  @override
  final PixStatusModel data;

  @override
  String toString() {
    return 'PixCheckModel(error: $error, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PixCheckModelImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, error, data);

  /// Create a copy of PixCheckModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PixCheckModelImplCopyWith<_$PixCheckModelImpl> get copyWith =>
      __$$PixCheckModelImplCopyWithImpl<_$PixCheckModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PixCheckModelImplToJson(
      this,
    );
  }
}

abstract class _PixCheckModel implements PixCheckModel {
  const factory _PixCheckModel(
      {required final String? error,
      required final PixStatusModel data}) = _$PixCheckModelImpl;

  factory _PixCheckModel.fromJson(Map<String, dynamic> json) =
      _$PixCheckModelImpl.fromJson;

  @override
  String? get error;
  @override
  PixStatusModel get data;

  /// Create a copy of PixCheckModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PixCheckModelImplCopyWith<_$PixCheckModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PixStatusModel _$PixStatusModelFromJson(Map<String, dynamic> json) {
  return _PixStatusModel.fromJson(json);
}

/// @nodoc
mixin _$PixStatusModel {
  String get status => throw _privateConstructorUsedError;
  DateTime get expiresAt => throw _privateConstructorUsedError;

  /// Serializes this PixStatusModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PixStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PixStatusModelCopyWith<PixStatusModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PixStatusModelCopyWith<$Res> {
  factory $PixStatusModelCopyWith(
          PixStatusModel value, $Res Function(PixStatusModel) then) =
      _$PixStatusModelCopyWithImpl<$Res, PixStatusModel>;
  @useResult
  $Res call({String status, DateTime expiresAt});
}

/// @nodoc
class _$PixStatusModelCopyWithImpl<$Res, $Val extends PixStatusModel>
    implements $PixStatusModelCopyWith<$Res> {
  _$PixStatusModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PixStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? expiresAt = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PixStatusModelImplCopyWith<$Res>
    implements $PixStatusModelCopyWith<$Res> {
  factory _$$PixStatusModelImplCopyWith(_$PixStatusModelImpl value,
          $Res Function(_$PixStatusModelImpl) then) =
      __$$PixStatusModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, DateTime expiresAt});
}

/// @nodoc
class __$$PixStatusModelImplCopyWithImpl<$Res>
    extends _$PixStatusModelCopyWithImpl<$Res, _$PixStatusModelImpl>
    implements _$$PixStatusModelImplCopyWith<$Res> {
  __$$PixStatusModelImplCopyWithImpl(
      _$PixStatusModelImpl _value, $Res Function(_$PixStatusModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PixStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? expiresAt = null,
  }) {
    return _then(_$PixStatusModelImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PixStatusModelImpl implements _PixStatusModel {
  const _$PixStatusModelImpl({required this.status, required this.expiresAt});

  factory _$PixStatusModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PixStatusModelImplFromJson(json);

  @override
  final String status;
  @override
  final DateTime expiresAt;

  @override
  String toString() {
    return 'PixStatusModel(status: $status, expiresAt: $expiresAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PixStatusModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, expiresAt);

  /// Create a copy of PixStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PixStatusModelImplCopyWith<_$PixStatusModelImpl> get copyWith =>
      __$$PixStatusModelImplCopyWithImpl<_$PixStatusModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PixStatusModelImplToJson(
      this,
    );
  }
}

abstract class _PixStatusModel implements PixStatusModel {
  const factory _PixStatusModel(
      {required final String status,
      required final DateTime expiresAt}) = _$PixStatusModelImpl;

  factory _PixStatusModel.fromJson(Map<String, dynamic> json) =
      _$PixStatusModelImpl.fromJson;

  @override
  String get status;
  @override
  DateTime get expiresAt;

  /// Create a copy of PixStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PixStatusModelImplCopyWith<_$PixStatusModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
