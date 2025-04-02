// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sticker_collection_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StickerCollectionModel _$StickerCollectionModelFromJson(
    Map<String, dynamic> json) {
  return _StickerCollectionModel.fromJson(json);
}

/// @nodoc
mixin _$StickerCollectionModel {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  List<AlbumCollectionModel> get albums => throw _privateConstructorUsedError;

  /// Serializes this StickerCollectionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StickerCollectionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StickerCollectionModelCopyWith<StickerCollectionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StickerCollectionModelCopyWith<$Res> {
  factory $StickerCollectionModelCopyWith(StickerCollectionModel value,
          $Res Function(StickerCollectionModel) then) =
      _$StickerCollectionModelCopyWithImpl<$Res, StickerCollectionModel>;
  @useResult
  $Res call({String id, String userId, List<AlbumCollectionModel> albums});
}

/// @nodoc
class _$StickerCollectionModelCopyWithImpl<$Res,
        $Val extends StickerCollectionModel>
    implements $StickerCollectionModelCopyWith<$Res> {
  _$StickerCollectionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StickerCollectionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? albums = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      albums: null == albums
          ? _value.albums
          : albums // ignore: cast_nullable_to_non_nullable
              as List<AlbumCollectionModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StickerCollectionModelImplCopyWith<$Res>
    implements $StickerCollectionModelCopyWith<$Res> {
  factory _$$StickerCollectionModelImplCopyWith(
          _$StickerCollectionModelImpl value,
          $Res Function(_$StickerCollectionModelImpl) then) =
      __$$StickerCollectionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String userId, List<AlbumCollectionModel> albums});
}

/// @nodoc
class __$$StickerCollectionModelImplCopyWithImpl<$Res>
    extends _$StickerCollectionModelCopyWithImpl<$Res,
        _$StickerCollectionModelImpl>
    implements _$$StickerCollectionModelImplCopyWith<$Res> {
  __$$StickerCollectionModelImplCopyWithImpl(
      _$StickerCollectionModelImpl _value,
      $Res Function(_$StickerCollectionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StickerCollectionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? albums = null,
  }) {
    return _then(_$StickerCollectionModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      albums: null == albums
          ? _value._albums
          : albums // ignore: cast_nullable_to_non_nullable
              as List<AlbumCollectionModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StickerCollectionModelImpl implements _StickerCollectionModel {
  const _$StickerCollectionModelImpl(
      {required this.id,
      required this.userId,
      required final List<AlbumCollectionModel> albums})
      : _albums = albums;

  factory _$StickerCollectionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StickerCollectionModelImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  final List<AlbumCollectionModel> _albums;
  @override
  List<AlbumCollectionModel> get albums {
    if (_albums is EqualUnmodifiableListView) return _albums;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_albums);
  }

  @override
  String toString() {
    return 'StickerCollectionModel(id: $id, userId: $userId, albums: $albums)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StickerCollectionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(other._albums, _albums));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, userId, const DeepCollectionEquality().hash(_albums));

  /// Create a copy of StickerCollectionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StickerCollectionModelImplCopyWith<_$StickerCollectionModelImpl>
      get copyWith => __$$StickerCollectionModelImplCopyWithImpl<
          _$StickerCollectionModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StickerCollectionModelImplToJson(
      this,
    );
  }
}

abstract class _StickerCollectionModel implements StickerCollectionModel {
  const factory _StickerCollectionModel(
          {required final String id,
          required final String userId,
          required final List<AlbumCollectionModel> albums}) =
      _$StickerCollectionModelImpl;

  factory _StickerCollectionModel.fromJson(Map<String, dynamic> json) =
      _$StickerCollectionModelImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  List<AlbumCollectionModel> get albums;

  /// Create a copy of StickerCollectionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StickerCollectionModelImplCopyWith<_$StickerCollectionModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AlbumCollectionModel _$AlbumCollectionModelFromJson(Map<String, dynamic> json) {
  return _AlbumCollectionModel.fromJson(json);
}

/// @nodoc
mixin _$AlbumCollectionModel {
  String get albumId => throw _privateConstructorUsedError;
  List<int> get ownedCommonStickers => throw _privateConstructorUsedError;
  List<int> get ownedFrameStickers => throw _privateConstructorUsedError;
  List<int> get ownedLegendStickers => throw _privateConstructorUsedError;
  List<int> get ownedA4Stickers => throw _privateConstructorUsedError;

  /// Serializes this AlbumCollectionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AlbumCollectionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AlbumCollectionModelCopyWith<AlbumCollectionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumCollectionModelCopyWith<$Res> {
  factory $AlbumCollectionModelCopyWith(AlbumCollectionModel value,
          $Res Function(AlbumCollectionModel) then) =
      _$AlbumCollectionModelCopyWithImpl<$Res, AlbumCollectionModel>;
  @useResult
  $Res call(
      {String albumId,
      List<int> ownedCommonStickers,
      List<int> ownedFrameStickers,
      List<int> ownedLegendStickers,
      List<int> ownedA4Stickers});
}

/// @nodoc
class _$AlbumCollectionModelCopyWithImpl<$Res,
        $Val extends AlbumCollectionModel>
    implements $AlbumCollectionModelCopyWith<$Res> {
  _$AlbumCollectionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AlbumCollectionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? albumId = null,
    Object? ownedCommonStickers = null,
    Object? ownedFrameStickers = null,
    Object? ownedLegendStickers = null,
    Object? ownedA4Stickers = null,
  }) {
    return _then(_value.copyWith(
      albumId: null == albumId
          ? _value.albumId
          : albumId // ignore: cast_nullable_to_non_nullable
              as String,
      ownedCommonStickers: null == ownedCommonStickers
          ? _value.ownedCommonStickers
          : ownedCommonStickers // ignore: cast_nullable_to_non_nullable
              as List<int>,
      ownedFrameStickers: null == ownedFrameStickers
          ? _value.ownedFrameStickers
          : ownedFrameStickers // ignore: cast_nullable_to_non_nullable
              as List<int>,
      ownedLegendStickers: null == ownedLegendStickers
          ? _value.ownedLegendStickers
          : ownedLegendStickers // ignore: cast_nullable_to_non_nullable
              as List<int>,
      ownedA4Stickers: null == ownedA4Stickers
          ? _value.ownedA4Stickers
          : ownedA4Stickers // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AlbumCollectionModelImplCopyWith<$Res>
    implements $AlbumCollectionModelCopyWith<$Res> {
  factory _$$AlbumCollectionModelImplCopyWith(_$AlbumCollectionModelImpl value,
          $Res Function(_$AlbumCollectionModelImpl) then) =
      __$$AlbumCollectionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String albumId,
      List<int> ownedCommonStickers,
      List<int> ownedFrameStickers,
      List<int> ownedLegendStickers,
      List<int> ownedA4Stickers});
}

/// @nodoc
class __$$AlbumCollectionModelImplCopyWithImpl<$Res>
    extends _$AlbumCollectionModelCopyWithImpl<$Res, _$AlbumCollectionModelImpl>
    implements _$$AlbumCollectionModelImplCopyWith<$Res> {
  __$$AlbumCollectionModelImplCopyWithImpl(_$AlbumCollectionModelImpl _value,
      $Res Function(_$AlbumCollectionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AlbumCollectionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? albumId = null,
    Object? ownedCommonStickers = null,
    Object? ownedFrameStickers = null,
    Object? ownedLegendStickers = null,
    Object? ownedA4Stickers = null,
  }) {
    return _then(_$AlbumCollectionModelImpl(
      albumId: null == albumId
          ? _value.albumId
          : albumId // ignore: cast_nullable_to_non_nullable
              as String,
      ownedCommonStickers: null == ownedCommonStickers
          ? _value._ownedCommonStickers
          : ownedCommonStickers // ignore: cast_nullable_to_non_nullable
              as List<int>,
      ownedFrameStickers: null == ownedFrameStickers
          ? _value._ownedFrameStickers
          : ownedFrameStickers // ignore: cast_nullable_to_non_nullable
              as List<int>,
      ownedLegendStickers: null == ownedLegendStickers
          ? _value._ownedLegendStickers
          : ownedLegendStickers // ignore: cast_nullable_to_non_nullable
              as List<int>,
      ownedA4Stickers: null == ownedA4Stickers
          ? _value._ownedA4Stickers
          : ownedA4Stickers // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AlbumCollectionModelImpl implements _AlbumCollectionModel {
  const _$AlbumCollectionModelImpl(
      {required this.albumId,
      required final List<int> ownedCommonStickers,
      required final List<int> ownedFrameStickers,
      required final List<int> ownedLegendStickers,
      required final List<int> ownedA4Stickers})
      : _ownedCommonStickers = ownedCommonStickers,
        _ownedFrameStickers = ownedFrameStickers,
        _ownedLegendStickers = ownedLegendStickers,
        _ownedA4Stickers = ownedA4Stickers;

  factory _$AlbumCollectionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlbumCollectionModelImplFromJson(json);

  @override
  final String albumId;
  final List<int> _ownedCommonStickers;
  @override
  List<int> get ownedCommonStickers {
    if (_ownedCommonStickers is EqualUnmodifiableListView)
      return _ownedCommonStickers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ownedCommonStickers);
  }

  final List<int> _ownedFrameStickers;
  @override
  List<int> get ownedFrameStickers {
    if (_ownedFrameStickers is EqualUnmodifiableListView)
      return _ownedFrameStickers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ownedFrameStickers);
  }

  final List<int> _ownedLegendStickers;
  @override
  List<int> get ownedLegendStickers {
    if (_ownedLegendStickers is EqualUnmodifiableListView)
      return _ownedLegendStickers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ownedLegendStickers);
  }

  final List<int> _ownedA4Stickers;
  @override
  List<int> get ownedA4Stickers {
    if (_ownedA4Stickers is EqualUnmodifiableListView) return _ownedA4Stickers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ownedA4Stickers);
  }

  @override
  String toString() {
    return 'AlbumCollectionModel(albumId: $albumId, ownedCommonStickers: $ownedCommonStickers, ownedFrameStickers: $ownedFrameStickers, ownedLegendStickers: $ownedLegendStickers, ownedA4Stickers: $ownedA4Stickers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlbumCollectionModelImpl &&
            (identical(other.albumId, albumId) || other.albumId == albumId) &&
            const DeepCollectionEquality()
                .equals(other._ownedCommonStickers, _ownedCommonStickers) &&
            const DeepCollectionEquality()
                .equals(other._ownedFrameStickers, _ownedFrameStickers) &&
            const DeepCollectionEquality()
                .equals(other._ownedLegendStickers, _ownedLegendStickers) &&
            const DeepCollectionEquality()
                .equals(other._ownedA4Stickers, _ownedA4Stickers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      albumId,
      const DeepCollectionEquality().hash(_ownedCommonStickers),
      const DeepCollectionEquality().hash(_ownedFrameStickers),
      const DeepCollectionEquality().hash(_ownedLegendStickers),
      const DeepCollectionEquality().hash(_ownedA4Stickers));

  /// Create a copy of AlbumCollectionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AlbumCollectionModelImplCopyWith<_$AlbumCollectionModelImpl>
      get copyWith =>
          __$$AlbumCollectionModelImplCopyWithImpl<_$AlbumCollectionModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AlbumCollectionModelImplToJson(
      this,
    );
  }
}

abstract class _AlbumCollectionModel implements AlbumCollectionModel {
  const factory _AlbumCollectionModel(
      {required final String albumId,
      required final List<int> ownedCommonStickers,
      required final List<int> ownedFrameStickers,
      required final List<int> ownedLegendStickers,
      required final List<int> ownedA4Stickers}) = _$AlbumCollectionModelImpl;

  factory _AlbumCollectionModel.fromJson(Map<String, dynamic> json) =
      _$AlbumCollectionModelImpl.fromJson;

  @override
  String get albumId;
  @override
  List<int> get ownedCommonStickers;
  @override
  List<int> get ownedFrameStickers;
  @override
  List<int> get ownedLegendStickers;
  @override
  List<int> get ownedA4Stickers;

  /// Create a copy of AlbumCollectionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AlbumCollectionModelImplCopyWith<_$AlbumCollectionModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
