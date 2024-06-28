// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_message_use_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeleteMessageParams _$DeleteMessageParamsFromJson(Map<String, dynamic> json) {
  return _DeleteMessageParams.fromJson(json);
}

/// @nodoc
mixin _$DeleteMessageParams {
  int get messageId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeleteMessageParamsCopyWith<DeleteMessageParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteMessageParamsCopyWith<$Res> {
  factory $DeleteMessageParamsCopyWith(
          DeleteMessageParams value, $Res Function(DeleteMessageParams) then) =
      _$DeleteMessageParamsCopyWithImpl<$Res, DeleteMessageParams>;
  @useResult
  $Res call({int messageId});
}

/// @nodoc
class _$DeleteMessageParamsCopyWithImpl<$Res, $Val extends DeleteMessageParams>
    implements $DeleteMessageParamsCopyWith<$Res> {
  _$DeleteMessageParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageId = null,
  }) {
    return _then(_value.copyWith(
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeleteMessageParamsImplCopyWith<$Res>
    implements $DeleteMessageParamsCopyWith<$Res> {
  factory _$$DeleteMessageParamsImplCopyWith(_$DeleteMessageParamsImpl value,
          $Res Function(_$DeleteMessageParamsImpl) then) =
      __$$DeleteMessageParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int messageId});
}

/// @nodoc
class __$$DeleteMessageParamsImplCopyWithImpl<$Res>
    extends _$DeleteMessageParamsCopyWithImpl<$Res, _$DeleteMessageParamsImpl>
    implements _$$DeleteMessageParamsImplCopyWith<$Res> {
  __$$DeleteMessageParamsImplCopyWithImpl(_$DeleteMessageParamsImpl _value,
      $Res Function(_$DeleteMessageParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageId = null,
  }) {
    return _then(_$DeleteMessageParamsImpl(
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeleteMessageParamsImpl extends _DeleteMessageParams {
  const _$DeleteMessageParamsImpl({required this.messageId}) : super._();

  factory _$DeleteMessageParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeleteMessageParamsImplFromJson(json);

  @override
  final int messageId;

  @override
  String toString() {
    return 'DeleteMessageParams(messageId: $messageId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteMessageParamsImpl &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, messageId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteMessageParamsImplCopyWith<_$DeleteMessageParamsImpl> get copyWith =>
      __$$DeleteMessageParamsImplCopyWithImpl<_$DeleteMessageParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeleteMessageParamsImplToJson(
      this,
    );
  }
}

abstract class _DeleteMessageParams extends DeleteMessageParams {
  const factory _DeleteMessageParams({required final int messageId}) =
      _$DeleteMessageParamsImpl;
  const _DeleteMessageParams._() : super._();

  factory _DeleteMessageParams.fromJson(Map<String, dynamic> json) =
      _$DeleteMessageParamsImpl.fromJson;

  @override
  int get messageId;
  @override
  @JsonKey(ignore: true)
  _$$DeleteMessageParamsImplCopyWith<_$DeleteMessageParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
