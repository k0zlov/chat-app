// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chats_response_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatsResponseEntity {
  List<ChatEntity> get chats => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatsResponseEntityCopyWith<ChatsResponseEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatsResponseEntityCopyWith<$Res> {
  factory $ChatsResponseEntityCopyWith(
          ChatsResponseEntity value, $Res Function(ChatsResponseEntity) then) =
      _$ChatsResponseEntityCopyWithImpl<$Res, ChatsResponseEntity>;
  @useResult
  $Res call({List<ChatEntity> chats});
}

/// @nodoc
class _$ChatsResponseEntityCopyWithImpl<$Res, $Val extends ChatsResponseEntity>
    implements $ChatsResponseEntityCopyWith<$Res> {
  _$ChatsResponseEntityCopyWithImpl(this._value, this._then);

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
              as List<ChatEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatsResponseEntityImplCopyWith<$Res>
    implements $ChatsResponseEntityCopyWith<$Res> {
  factory _$$ChatsResponseEntityImplCopyWith(_$ChatsResponseEntityImpl value,
          $Res Function(_$ChatsResponseEntityImpl) then) =
      __$$ChatsResponseEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ChatEntity> chats});
}

/// @nodoc
class __$$ChatsResponseEntityImplCopyWithImpl<$Res>
    extends _$ChatsResponseEntityCopyWithImpl<$Res, _$ChatsResponseEntityImpl>
    implements _$$ChatsResponseEntityImplCopyWith<$Res> {
  __$$ChatsResponseEntityImplCopyWithImpl(_$ChatsResponseEntityImpl _value,
      $Res Function(_$ChatsResponseEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chats = null,
  }) {
    return _then(_$ChatsResponseEntityImpl(
      chats: null == chats
          ? _value._chats
          : chats // ignore: cast_nullable_to_non_nullable
              as List<ChatEntity>,
    ));
  }
}

/// @nodoc

class _$ChatsResponseEntityImpl extends _ChatsResponseEntity {
  const _$ChatsResponseEntityImpl({final List<ChatEntity> chats = const []})
      : _chats = chats,
        super._();

  final List<ChatEntity> _chats;
  @override
  @JsonKey()
  List<ChatEntity> get chats {
    if (_chats is EqualUnmodifiableListView) return _chats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chats);
  }

  @override
  String toString() {
    return 'ChatsResponseEntity(chats: $chats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatsResponseEntityImpl &&
            const DeepCollectionEquality().equals(other._chats, _chats));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_chats));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatsResponseEntityImplCopyWith<_$ChatsResponseEntityImpl> get copyWith =>
      __$$ChatsResponseEntityImplCopyWithImpl<_$ChatsResponseEntityImpl>(
          this, _$identity);
}

abstract class _ChatsResponseEntity extends ChatsResponseEntity {
  const factory _ChatsResponseEntity({final List<ChatEntity> chats}) =
      _$ChatsResponseEntityImpl;
  const _ChatsResponseEntity._() : super._();

  @override
  List<ChatEntity> get chats;
  @override
  @JsonKey(ignore: true)
  _$$ChatsResponseEntityImplCopyWith<_$ChatsResponseEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
