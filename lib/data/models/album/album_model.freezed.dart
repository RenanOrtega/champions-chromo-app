// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'album_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AlbumModel _$AlbumModelFromJson(Map<String, dynamic> json) {
  return _AlbumModel.fromJson(json);
}

/// @nodoc
mixin _$AlbumModel {
  String get id => throw _privateConstructorUsedError;
  String get schoolId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  DateTime get releaseDate => throw _privateConstructorUsedError;
  String get coverImage => throw _privateConstructorUsedError;
  List<StickerModel> get commonStickers => throw _privateConstructorUsedError;
  List<StickerModel> get frameStickers => throw _privateConstructorUsedError;
  List<StickerModel> get legendStickers => throw _privateConstructorUsedError;
  List<StickerModel> get a4Stickers => throw _privateConstructorUsedError;
  int get totalStickers => throw _privateConstructorUsedError;

  /// Serializes this AlbumModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AlbumModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AlbumModelCopyWith<AlbumModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumModelCopyWith<$Res> {
  factory $AlbumModelCopyWith(
          AlbumModel value, $Res Function(AlbumModel) then) =
      _$AlbumModelCopyWithImpl<$Res, AlbumModel>;
  @useResult
  $Res call(
      {String id,
      String schoolId,
      String name,
      double price,
      DateTime releaseDate,
      String coverImage,
      List<StickerModel> commonStickers,
      List<StickerModel> frameStickers,
      List<StickerModel> legendStickers,
      List<StickerModel> a4Stickers,
      int totalStickers});
}

/// @nodoc
class _$AlbumModelCopyWithImpl<$Res, $Val extends AlbumModel>
    implements $AlbumModelCopyWith<$Res> {
  _$AlbumModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AlbumModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? schoolId = null,
    Object? name = null,
    Object? price = null,
    Object? releaseDate = null,
    Object? coverImage = null,
    Object? commonStickers = null,
    Object? frameStickers = null,
    Object? legendStickers = null,
    Object? a4Stickers = null,
    Object? totalStickers = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      schoolId: null == schoolId
          ? _value.schoolId
          : schoolId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      coverImage: null == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as String,
      commonStickers: null == commonStickers
          ? _value.commonStickers
          : commonStickers // ignore: cast_nullable_to_non_nullable
              as List<StickerModel>,
      frameStickers: null == frameStickers
          ? _value.frameStickers
          : frameStickers // ignore: cast_nullable_to_non_nullable
              as List<StickerModel>,
      legendStickers: null == legendStickers
          ? _value.legendStickers
          : legendStickers // ignore: cast_nullable_to_non_nullable
              as List<StickerModel>,
      a4Stickers: null == a4Stickers
          ? _value.a4Stickers
          : a4Stickers // ignore: cast_nullable_to_non_nullable
              as List<StickerModel>,
      totalStickers: null == totalStickers
          ? _value.totalStickers
          : totalStickers // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AlbumModelImplCopyWith<$Res>
    implements $AlbumModelCopyWith<$Res> {
  factory _$$AlbumModelImplCopyWith(
          _$AlbumModelImpl value, $Res Function(_$AlbumModelImpl) then) =
      __$$AlbumModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String schoolId,
      String name,
      double price,
      DateTime releaseDate,
      String coverImage,
      List<StickerModel> commonStickers,
      List<StickerModel> frameStickers,
      List<StickerModel> legendStickers,
      List<StickerModel> a4Stickers,
      int totalStickers});
}

/// @nodoc
class __$$AlbumModelImplCopyWithImpl<$Res>
    extends _$AlbumModelCopyWithImpl<$Res, _$AlbumModelImpl>
    implements _$$AlbumModelImplCopyWith<$Res> {
  __$$AlbumModelImplCopyWithImpl(
      _$AlbumModelImpl _value, $Res Function(_$AlbumModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AlbumModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? schoolId = null,
    Object? name = null,
    Object? price = null,
    Object? releaseDate = null,
    Object? coverImage = null,
    Object? commonStickers = null,
    Object? frameStickers = null,
    Object? legendStickers = null,
    Object? a4Stickers = null,
    Object? totalStickers = null,
  }) {
    return _then(_$AlbumModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      schoolId: null == schoolId
          ? _value.schoolId
          : schoolId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      coverImage: null == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as String,
      commonStickers: null == commonStickers
          ? _value._commonStickers
          : commonStickers // ignore: cast_nullable_to_non_nullable
              as List<StickerModel>,
      frameStickers: null == frameStickers
          ? _value._frameStickers
          : frameStickers // ignore: cast_nullable_to_non_nullable
              as List<StickerModel>,
      legendStickers: null == legendStickers
          ? _value._legendStickers
          : legendStickers // ignore: cast_nullable_to_non_nullable
              as List<StickerModel>,
      a4Stickers: null == a4Stickers
          ? _value._a4Stickers
          : a4Stickers // ignore: cast_nullable_to_non_nullable
              as List<StickerModel>,
      totalStickers: null == totalStickers
          ? _value.totalStickers
          : totalStickers // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AlbumModelImpl implements _AlbumModel {
  const _$AlbumModelImpl(
      {required this.id,
      required this.schoolId,
      required this.name,
      required this.price,
      required this.releaseDate,
      required this.coverImage,
      required final List<StickerModel> commonStickers,
      required final List<StickerModel> frameStickers,
      required final List<StickerModel> legendStickers,
      required final List<StickerModel> a4Stickers,
      required this.totalStickers})
      : _commonStickers = commonStickers,
        _frameStickers = frameStickers,
        _legendStickers = legendStickers,
        _a4Stickers = a4Stickers;

  factory _$AlbumModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlbumModelImplFromJson(json);

  @override
  final String id;
  @override
  final String schoolId;
  @override
  final String name;
  @override
  final double price;
  @override
  final DateTime releaseDate;
  @override
  final String coverImage;
  final List<StickerModel> _commonStickers;
  @override
  List<StickerModel> get commonStickers {
    if (_commonStickers is EqualUnmodifiableListView) return _commonStickers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_commonStickers);
  }

  final List<StickerModel> _frameStickers;
  @override
  List<StickerModel> get frameStickers {
    if (_frameStickers is EqualUnmodifiableListView) return _frameStickers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_frameStickers);
  }

  final List<StickerModel> _legendStickers;
  @override
  List<StickerModel> get legendStickers {
    if (_legendStickers is EqualUnmodifiableListView) return _legendStickers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_legendStickers);
  }

  final List<StickerModel> _a4Stickers;
  @override
  List<StickerModel> get a4Stickers {
    if (_a4Stickers is EqualUnmodifiableListView) return _a4Stickers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_a4Stickers);
  }

  @override
  final int totalStickers;

  @override
  String toString() {
    return 'AlbumModel(id: $id, schoolId: $schoolId, name: $name, price: $price, releaseDate: $releaseDate, coverImage: $coverImage, commonStickers: $commonStickers, frameStickers: $frameStickers, legendStickers: $legendStickers, a4Stickers: $a4Stickers, totalStickers: $totalStickers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlbumModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.schoolId, schoolId) ||
                other.schoolId == schoolId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.coverImage, coverImage) ||
                other.coverImage == coverImage) &&
            const DeepCollectionEquality()
                .equals(other._commonStickers, _commonStickers) &&
            const DeepCollectionEquality()
                .equals(other._frameStickers, _frameStickers) &&
            const DeepCollectionEquality()
                .equals(other._legendStickers, _legendStickers) &&
            const DeepCollectionEquality()
                .equals(other._a4Stickers, _a4Stickers) &&
            (identical(other.totalStickers, totalStickers) ||
                other.totalStickers == totalStickers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      schoolId,
      name,
      price,
      releaseDate,
      coverImage,
      const DeepCollectionEquality().hash(_commonStickers),
      const DeepCollectionEquality().hash(_frameStickers),
      const DeepCollectionEquality().hash(_legendStickers),
      const DeepCollectionEquality().hash(_a4Stickers),
      totalStickers);

  /// Create a copy of AlbumModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AlbumModelImplCopyWith<_$AlbumModelImpl> get copyWith =>
      __$$AlbumModelImplCopyWithImpl<_$AlbumModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AlbumModelImplToJson(
      this,
    );
  }
}

abstract class _AlbumModel implements AlbumModel {
  const factory _AlbumModel(
      {required final String id,
      required final String schoolId,
      required final String name,
      required final double price,
      required final DateTime releaseDate,
      required final String coverImage,
      required final List<StickerModel> commonStickers,
      required final List<StickerModel> frameStickers,
      required final List<StickerModel> legendStickers,
      required final List<StickerModel> a4Stickers,
      required final int totalStickers}) = _$AlbumModelImpl;

  factory _AlbumModel.fromJson(Map<String, dynamic> json) =
      _$AlbumModelImpl.fromJson;

  @override
  String get id;
  @override
  String get schoolId;
  @override
  String get name;
  @override
  double get price;
  @override
  DateTime get releaseDate;
  @override
  String get coverImage;
  @override
  List<StickerModel> get commonStickers;
  @override
  List<StickerModel> get frameStickers;
  @override
  List<StickerModel> get legendStickers;
  @override
  List<StickerModel> get a4Stickers;
  @override
  int get totalStickers;

  /// Create a copy of AlbumModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AlbumModelImplCopyWith<_$AlbumModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StickerModel _$StickerModelFromJson(Map<String, dynamic> json) {
  return _StickerModel.fromJson(json);
}

/// @nodoc
mixin _$StickerModel {
  int get number => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this StickerModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StickerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StickerModelCopyWith<StickerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StickerModelCopyWith<$Res> {
  factory $StickerModelCopyWith(
          StickerModel value, $Res Function(StickerModel) then) =
      _$StickerModelCopyWithImpl<$Res, StickerModel>;
  @useResult
  $Res call({int number, String name});
}

/// @nodoc
class _$StickerModelCopyWithImpl<$Res, $Val extends StickerModel>
    implements $StickerModelCopyWith<$Res> {
  _$StickerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StickerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StickerModelImplCopyWith<$Res>
    implements $StickerModelCopyWith<$Res> {
  factory _$$StickerModelImplCopyWith(
          _$StickerModelImpl value, $Res Function(_$StickerModelImpl) then) =
      __$$StickerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int number, String name});
}

/// @nodoc
class __$$StickerModelImplCopyWithImpl<$Res>
    extends _$StickerModelCopyWithImpl<$Res, _$StickerModelImpl>
    implements _$$StickerModelImplCopyWith<$Res> {
  __$$StickerModelImplCopyWithImpl(
      _$StickerModelImpl _value, $Res Function(_$StickerModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StickerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? name = null,
  }) {
    return _then(_$StickerModelImpl(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StickerModelImpl implements _StickerModel {
  const _$StickerModelImpl({required this.number, required this.name});

  factory _$StickerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StickerModelImplFromJson(json);

  @override
  final int number;
  @override
  final String name;

  @override
  String toString() {
    return 'StickerModel(number: $number, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StickerModelImpl &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, number, name);

  /// Create a copy of StickerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StickerModelImplCopyWith<_$StickerModelImpl> get copyWith =>
      __$$StickerModelImplCopyWithImpl<_$StickerModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StickerModelImplToJson(
      this,
    );
  }
}

abstract class _StickerModel implements StickerModel {
  const factory _StickerModel(
      {required final int number,
      required final String name}) = _$StickerModelImpl;

  factory _StickerModel.fromJson(Map<String, dynamic> json) =
      _$StickerModelImpl.fromJson;

  @override
  int get number;
  @override
  String get name;

  /// Create a copy of StickerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StickerModelImplCopyWith<_$StickerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
