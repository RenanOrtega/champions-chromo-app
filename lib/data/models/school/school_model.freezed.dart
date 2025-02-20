// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'school_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SchoolModel _$SchoolModelFromJson(Map<String, dynamic> json) {
  return _SchoolModel.fromJson(json);
}

/// @nodoc
mixin _$SchoolModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;

  /// Serializes this SchoolModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SchoolModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SchoolModelCopyWith<SchoolModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SchoolModelCopyWith<$Res> {
  factory $SchoolModelCopyWith(
          SchoolModel value, $Res Function(SchoolModel) then) =
      _$SchoolModelCopyWithImpl<$Res, SchoolModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      String email,
      String phone,
      String address,
      String city,
      String state});
}

/// @nodoc
class _$SchoolModelCopyWithImpl<$Res, $Val extends SchoolModel>
    implements $SchoolModelCopyWith<$Res> {
  _$SchoolModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SchoolModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? phone = null,
    Object? address = null,
    Object? city = null,
    Object? state = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SchoolModelImplCopyWith<$Res>
    implements $SchoolModelCopyWith<$Res> {
  factory _$$SchoolModelImplCopyWith(
          _$SchoolModelImpl value, $Res Function(_$SchoolModelImpl) then) =
      __$$SchoolModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String email,
      String phone,
      String address,
      String city,
      String state});
}

/// @nodoc
class __$$SchoolModelImplCopyWithImpl<$Res>
    extends _$SchoolModelCopyWithImpl<$Res, _$SchoolModelImpl>
    implements _$$SchoolModelImplCopyWith<$Res> {
  __$$SchoolModelImplCopyWithImpl(
      _$SchoolModelImpl _value, $Res Function(_$SchoolModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SchoolModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? phone = null,
    Object? address = null,
    Object? city = null,
    Object? state = null,
  }) {
    return _then(_$SchoolModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SchoolModelImpl implements _SchoolModel {
  const _$SchoolModelImpl(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.address,
      required this.city,
      required this.state});

  factory _$SchoolModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SchoolModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String email;
  @override
  final String phone;
  @override
  final String address;
  @override
  final String city;
  @override
  final String state;

  @override
  String toString() {
    return 'SchoolModel(id: $id, name: $name, email: $email, phone: $phone, address: $address, city: $city, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SchoolModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, email, phone, address, city, state);

  /// Create a copy of SchoolModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SchoolModelImplCopyWith<_$SchoolModelImpl> get copyWith =>
      __$$SchoolModelImplCopyWithImpl<_$SchoolModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SchoolModelImplToJson(
      this,
    );
  }
}

abstract class _SchoolModel implements SchoolModel {
  const factory _SchoolModel(
      {required final String id,
      required final String name,
      required final String email,
      required final String phone,
      required final String address,
      required final String city,
      required final String state}) = _$SchoolModelImpl;

  factory _SchoolModel.fromJson(Map<String, dynamic> json) =
      _$SchoolModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get email;
  @override
  String get phone;
  @override
  String get address;
  @override
  String get city;
  @override
  String get state;

  /// Create a copy of SchoolModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SchoolModelImplCopyWith<_$SchoolModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
