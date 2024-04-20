// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leave_chat_use_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LeaveChatParams _$LeaveChatParamsFromJson(Map<String, dynamic> json) {
  return _LeaveChatParams.fromJson(json);
}

/// @nodoc
mixin _$LeaveChatParams {
  int get chatId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeaveChatParamsCopyWith<LeaveChatParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaveChatParamsCopyWith<$Res> {
  factory $LeaveChatParamsCopyWith(
          LeaveChatParams value, $Res Function(LeaveChatParams) then) =
      _$LeaveChatParamsCopyWithImpl<$Res, LeaveChatParams>;
  @useResult
  $Res call({int chatId});
}

/// @nodoc
class _$LeaveChatParamsCopyWithImpl<$Res, $Val extends LeaveChatParams>
    implements $LeaveChatParamsCopyWith<$Res> {
  _$LeaveChatParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatId = null,
  }) {
    return _then(_value.copyWith(
      chatId: null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeaveChatParamsImplCopyWith<$Res>
    implements $LeaveChatParamsCopyWith<$Res> {
  factory _$$LeaveChatParamsImplCopyWith(_$LeaveChatParamsImpl value,
          $Res Function(_$LeaveChatParamsImpl) then) =
      __$$LeaveChatParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int chatId});
}

/// @nodoc
class __$$LeaveChatParamsImplCopyWithImpl<$Res>
    extends _$LeaveChatParamsCopyWithImpl<$Res, _$LeaveChatParamsImpl>
    implements _$$LeaveChatParamsImplCopyWith<$Res> {
  __$$LeaveChatParamsImplCopyWithImpl(
      _$LeaveChatParamsImpl _value, $Res Function(_$LeaveChatParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatId = null,
  }) {
    return _then(_$LeaveChatParamsImpl(
      chatId: null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeaveChatParamsImpl extends _LeaveChatParams {
  const _$LeaveChatParamsImpl({this.chatId = -1}) : super._();

  factory _$LeaveChatParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeaveChatParamsImplFromJson(json);

  @override
  @JsonKey()
  final int chatId;

  @override
  String toString() {
    return 'LeaveChatParams(chatId: $chatId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaveChatParamsImpl &&
            (identical(other.chatId, chatId) || other.chatId == chatId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, chatId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaveChatParamsImplCopyWith<_$LeaveChatParamsImpl> get copyWith =>
      __$$LeaveChatParamsImplCopyWithImpl<_$LeaveChatParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeaveChatParamsImplToJson(
      this,
    );
  }
}

abstract class _LeaveChatParams extends LeaveChatParams {
  const factory _LeaveChatParams({final int chatId}) = _$LeaveChatParamsImpl;
  const _LeaveChatParams._() : super._();

  factory _LeaveChatParams.fromJson(Map<String, dynamic> json) =
      _$LeaveChatParamsImpl.fromJson;

  @override
  int get chatId;
  @override
  @JsonKey(ignore: true)
  _$$LeaveChatParamsImplCopyWith<_$LeaveChatParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
