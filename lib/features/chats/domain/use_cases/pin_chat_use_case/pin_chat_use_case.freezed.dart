// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pin_chat_use_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PinChatParams _$PinChatParamsFromJson(Map<String, dynamic> json) {
  return _PinChatParams.fromJson(json);
}

/// @nodoc
mixin _$PinChatParams {
  bool get isPinned => throw _privateConstructorUsedError;
  int get chatId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PinChatParamsCopyWith<PinChatParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PinChatParamsCopyWith<$Res> {
  factory $PinChatParamsCopyWith(
          PinChatParams value, $Res Function(PinChatParams) then) =
      _$PinChatParamsCopyWithImpl<$Res, PinChatParams>;
  @useResult
  $Res call({bool isPinned, int chatId});
}

/// @nodoc
class _$PinChatParamsCopyWithImpl<$Res, $Val extends PinChatParams>
    implements $PinChatParamsCopyWith<$Res> {
  _$PinChatParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPinned = null,
    Object? chatId = null,
  }) {
    return _then(_value.copyWith(
      isPinned: null == isPinned
          ? _value.isPinned
          : isPinned // ignore: cast_nullable_to_non_nullable
              as bool,
      chatId: null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PinChatParamsImplCopyWith<$Res>
    implements $PinChatParamsCopyWith<$Res> {
  factory _$$PinChatParamsImplCopyWith(
          _$PinChatParamsImpl value, $Res Function(_$PinChatParamsImpl) then) =
      __$$PinChatParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isPinned, int chatId});
}

/// @nodoc
class __$$PinChatParamsImplCopyWithImpl<$Res>
    extends _$PinChatParamsCopyWithImpl<$Res, _$PinChatParamsImpl>
    implements _$$PinChatParamsImplCopyWith<$Res> {
  __$$PinChatParamsImplCopyWithImpl(
      _$PinChatParamsImpl _value, $Res Function(_$PinChatParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPinned = null,
    Object? chatId = null,
  }) {
    return _then(_$PinChatParamsImpl(
      isPinned: null == isPinned
          ? _value.isPinned
          : isPinned // ignore: cast_nullable_to_non_nullable
              as bool,
      chatId: null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PinChatParamsImpl extends _PinChatParams {
  const _$PinChatParamsImpl({required this.isPinned, this.chatId = -1})
      : super._();

  factory _$PinChatParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PinChatParamsImplFromJson(json);

  @override
  final bool isPinned;
  @override
  @JsonKey()
  final int chatId;

  @override
  String toString() {
    return 'PinChatParams(isPinned: $isPinned, chatId: $chatId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PinChatParamsImpl &&
            (identical(other.isPinned, isPinned) ||
                other.isPinned == isPinned) &&
            (identical(other.chatId, chatId) || other.chatId == chatId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isPinned, chatId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PinChatParamsImplCopyWith<_$PinChatParamsImpl> get copyWith =>
      __$$PinChatParamsImplCopyWithImpl<_$PinChatParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PinChatParamsImplToJson(
      this,
    );
  }
}

abstract class _PinChatParams extends PinChatParams {
  const factory _PinChatParams(
      {required final bool isPinned, final int chatId}) = _$PinChatParamsImpl;
  const _PinChatParams._() : super._();

  factory _PinChatParams.fromJson(Map<String, dynamic> json) =
      _$PinChatParamsImpl.fromJson;

  @override
  bool get isPinned;
  @override
  int get chatId;
  @override
  @JsonKey(ignore: true)
  _$$PinChatParamsImplCopyWith<_$PinChatParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
