// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_message_use_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdateMessageParams _$UpdateMessageParamsFromJson(Map<String, dynamic> json) {
  return _UpdateMessageParams.fromJson(json);
}

/// @nodoc
mixin _$UpdateMessageParams {
  int get messageId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateMessageParamsCopyWith<UpdateMessageParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateMessageParamsCopyWith<$Res> {
  factory $UpdateMessageParamsCopyWith(
          UpdateMessageParams value, $Res Function(UpdateMessageParams) then) =
      _$UpdateMessageParamsCopyWithImpl<$Res, UpdateMessageParams>;
  @useResult
  $Res call({int messageId, String content});
}

/// @nodoc
class _$UpdateMessageParamsCopyWithImpl<$Res, $Val extends UpdateMessageParams>
    implements $UpdateMessageParamsCopyWith<$Res> {
  _$UpdateMessageParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageId = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateMessageParamsImplCopyWith<$Res>
    implements $UpdateMessageParamsCopyWith<$Res> {
  factory _$$UpdateMessageParamsImplCopyWith(_$UpdateMessageParamsImpl value,
          $Res Function(_$UpdateMessageParamsImpl) then) =
      __$$UpdateMessageParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int messageId, String content});
}

/// @nodoc
class __$$UpdateMessageParamsImplCopyWithImpl<$Res>
    extends _$UpdateMessageParamsCopyWithImpl<$Res, _$UpdateMessageParamsImpl>
    implements _$$UpdateMessageParamsImplCopyWith<$Res> {
  __$$UpdateMessageParamsImplCopyWithImpl(_$UpdateMessageParamsImpl _value,
      $Res Function(_$UpdateMessageParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageId = null,
    Object? content = null,
  }) {
    return _then(_$UpdateMessageParamsImpl(
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateMessageParamsImpl extends _UpdateMessageParams {
  const _$UpdateMessageParamsImpl(
      {required this.messageId, required this.content})
      : super._();

  factory _$UpdateMessageParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateMessageParamsImplFromJson(json);

  @override
  final int messageId;
  @override
  final String content;

  @override
  String toString() {
    return 'UpdateMessageParams(messageId: $messageId, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateMessageParamsImpl &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, messageId, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateMessageParamsImplCopyWith<_$UpdateMessageParamsImpl> get copyWith =>
      __$$UpdateMessageParamsImplCopyWithImpl<_$UpdateMessageParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateMessageParamsImplToJson(
      this,
    );
  }
}

abstract class _UpdateMessageParams extends UpdateMessageParams {
  const factory _UpdateMessageParams(
      {required final int messageId,
      required final String content}) = _$UpdateMessageParamsImpl;
  const _UpdateMessageParams._() : super._();

  factory _UpdateMessageParams.fromJson(Map<String, dynamic> json) =
      _$UpdateMessageParamsImpl.fromJson;

  @override
  int get messageId;
  @override
  String get content;
  @override
  @JsonKey(ignore: true)
  _$$UpdateMessageParamsImplCopyWith<_$UpdateMessageParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
