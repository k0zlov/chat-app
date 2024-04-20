// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'join_chat_use_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

JoinChatParams _$JoinChatParamsFromJson(Map<String, dynamic> json) {
  return _JoinChatParams.fromJson(json);
}

/// @nodoc
mixin _$JoinChatParams {
  int get chatId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JoinChatParamsCopyWith<JoinChatParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JoinChatParamsCopyWith<$Res> {
  factory $JoinChatParamsCopyWith(
          JoinChatParams value, $Res Function(JoinChatParams) then) =
      _$JoinChatParamsCopyWithImpl<$Res, JoinChatParams>;
  @useResult
  $Res call({int chatId});
}

/// @nodoc
class _$JoinChatParamsCopyWithImpl<$Res, $Val extends JoinChatParams>
    implements $JoinChatParamsCopyWith<$Res> {
  _$JoinChatParamsCopyWithImpl(this._value, this._then);

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
abstract class _$$JoinChatParamsImplCopyWith<$Res>
    implements $JoinChatParamsCopyWith<$Res> {
  factory _$$JoinChatParamsImplCopyWith(_$JoinChatParamsImpl value,
          $Res Function(_$JoinChatParamsImpl) then) =
      __$$JoinChatParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int chatId});
}

/// @nodoc
class __$$JoinChatParamsImplCopyWithImpl<$Res>
    extends _$JoinChatParamsCopyWithImpl<$Res, _$JoinChatParamsImpl>
    implements _$$JoinChatParamsImplCopyWith<$Res> {
  __$$JoinChatParamsImplCopyWithImpl(
      _$JoinChatParamsImpl _value, $Res Function(_$JoinChatParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatId = null,
  }) {
    return _then(_$JoinChatParamsImpl(
      chatId: null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JoinChatParamsImpl extends _JoinChatParams {
  const _$JoinChatParamsImpl({this.chatId = -1}) : super._();

  factory _$JoinChatParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$JoinChatParamsImplFromJson(json);

  @override
  @JsonKey()
  final int chatId;

  @override
  String toString() {
    return 'JoinChatParams(chatId: $chatId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JoinChatParamsImpl &&
            (identical(other.chatId, chatId) || other.chatId == chatId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, chatId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JoinChatParamsImplCopyWith<_$JoinChatParamsImpl> get copyWith =>
      __$$JoinChatParamsImplCopyWithImpl<_$JoinChatParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JoinChatParamsImplToJson(
      this,
    );
  }
}

abstract class _JoinChatParams extends JoinChatParams {
  const factory _JoinChatParams({final int chatId}) = _$JoinChatParamsImpl;
  const _JoinChatParams._() : super._();

  factory _JoinChatParams.fromJson(Map<String, dynamic> json) =
      _$JoinChatParamsImpl.fromJson;

  @override
  int get chatId;
  @override
  @JsonKey(ignore: true)
  _$$JoinChatParamsImplCopyWith<_$JoinChatParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
