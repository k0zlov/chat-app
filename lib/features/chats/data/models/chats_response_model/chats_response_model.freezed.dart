// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chats_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatsResponseModel _$ChatsResponseModelFromJson(Map<String, dynamic> json) {
  return _ChatsResponseModel.fromJson(json);
}

/// @nodoc
mixin _$ChatsResponseModel {
  @JsonKey(name: 'items')
  List<ChatModel> get chats => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatsResponseModelCopyWith<ChatsResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatsResponseModelCopyWith<$Res> {
  factory $ChatsResponseModelCopyWith(
          ChatsResponseModel value, $Res Function(ChatsResponseModel) then) =
      _$ChatsResponseModelCopyWithImpl<$Res, ChatsResponseModel>;
  @useResult
  $Res call({@JsonKey(name: 'items') List<ChatModel> chats});
}

/// @nodoc
class _$ChatsResponseModelCopyWithImpl<$Res, $Val extends ChatsResponseModel>
    implements $ChatsResponseModelCopyWith<$Res> {
  _$ChatsResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chats = null,
  }) {
    return _then(_value.copyWith(
      chats: null == chats
          ? _value.chats
          : chats // ignore: cast_nullable_to_non_nullable
              as List<ChatModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatsResponseModelImplCopyWith<$Res>
    implements $ChatsResponseModelCopyWith<$Res> {
  factory _$$ChatsResponseModelImplCopyWith(_$ChatsResponseModelImpl value,
          $Res Function(_$ChatsResponseModelImpl) then) =
      __$$ChatsResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'items') List<ChatModel> chats});
}

/// @nodoc
class __$$ChatsResponseModelImplCopyWithImpl<$Res>
    extends _$ChatsResponseModelCopyWithImpl<$Res, _$ChatsResponseModelImpl>
    implements _$$ChatsResponseModelImplCopyWith<$Res> {
  __$$ChatsResponseModelImplCopyWithImpl(_$ChatsResponseModelImpl _value,
      $Res Function(_$ChatsResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chats = null,
  }) {
    return _then(_$ChatsResponseModelImpl(
      chats: null == chats
          ? _value._chats
          : chats // ignore: cast_nullable_to_non_nullable
              as List<ChatModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatsResponseModelImpl extends _ChatsResponseModel {
  const _$ChatsResponseModelImpl(
      {@JsonKey(name: 'items') final List<ChatModel> chats = const []})
      : _chats = chats,
        super._();

  factory _$ChatsResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatsResponseModelImplFromJson(json);

  final List<ChatModel> _chats;
  @override
  @JsonKey(name: 'items')
  List<ChatModel> get chats {
    if (_chats is EqualUnmodifiableListView) return _chats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chats);
  }

  @override
  String toString() {
    return 'ChatsResponseModel(chats: $chats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatsResponseModelImpl &&
            const DeepCollectionEquality().equals(other._chats, _chats));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_chats));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatsResponseModelImplCopyWith<_$ChatsResponseModelImpl> get copyWith =>
      __$$ChatsResponseModelImplCopyWithImpl<_$ChatsResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatsResponseModelImplToJson(
      this,
    );
  }
}

abstract class _ChatsResponseModel extends ChatsResponseModel {
  const factory _ChatsResponseModel(
          {@JsonKey(name: 'items') final List<ChatModel> chats}) =
      _$ChatsResponseModelImpl;
  const _ChatsResponseModel._() : super._();

  factory _ChatsResponseModel.fromJson(Map<String, dynamic> json) =
      _$ChatsResponseModelImpl.fromJson;

  @override
  @JsonKey(name: 'items')
  List<ChatModel> get chats;
  @override
  @JsonKey(ignore: true)
  _$$ChatsResponseModelImplCopyWith<_$ChatsResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
