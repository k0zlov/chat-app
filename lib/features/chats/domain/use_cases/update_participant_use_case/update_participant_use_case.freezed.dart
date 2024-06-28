// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_participant_use_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdateParticipantParams _$UpdateParticipantParamsFromJson(
    Map<String, dynamic> json) {
  return _UpdateParticipantParams.fromJson(json);
}

/// @nodoc
mixin _$UpdateParticipantParams {
  int get chatId => throw _privateConstructorUsedError;
  int get targetId => throw _privateConstructorUsedError;
  ChatParticipantRole get role => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateParticipantParamsCopyWith<UpdateParticipantParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateParticipantParamsCopyWith<$Res> {
  factory $UpdateParticipantParamsCopyWith(UpdateParticipantParams value,
          $Res Function(UpdateParticipantParams) then) =
      _$UpdateParticipantParamsCopyWithImpl<$Res, UpdateParticipantParams>;
  @useResult
  $Res call({int chatId, int targetId, ChatParticipantRole role});
}

/// @nodoc
class _$UpdateParticipantParamsCopyWithImpl<$Res,
        $Val extends UpdateParticipantParams>
    implements $UpdateParticipantParamsCopyWith<$Res> {
  _$UpdateParticipantParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatId = null,
    Object? targetId = null,
    Object? role = null,
  }) {
    return _then(_value.copyWith(
      chatId: null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as int,
      targetId: null == targetId
          ? _value.targetId
          : targetId // ignore: cast_nullable_to_non_nullable
              as int,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as ChatParticipantRole,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateParticipantParamsImplCopyWith<$Res>
    implements $UpdateParticipantParamsCopyWith<$Res> {
  factory _$$UpdateParticipantParamsImplCopyWith(
          _$UpdateParticipantParamsImpl value,
          $Res Function(_$UpdateParticipantParamsImpl) then) =
      __$$UpdateParticipantParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int chatId, int targetId, ChatParticipantRole role});
}

/// @nodoc
class __$$UpdateParticipantParamsImplCopyWithImpl<$Res>
    extends _$UpdateParticipantParamsCopyWithImpl<$Res,
        _$UpdateParticipantParamsImpl>
    implements _$$UpdateParticipantParamsImplCopyWith<$Res> {
  __$$UpdateParticipantParamsImplCopyWithImpl(
      _$UpdateParticipantParamsImpl _value,
      $Res Function(_$UpdateParticipantParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatId = null,
    Object? targetId = null,
    Object? role = null,
  }) {
    return _then(_$UpdateParticipantParamsImpl(
      chatId: null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as int,
      targetId: null == targetId
          ? _value.targetId
          : targetId // ignore: cast_nullable_to_non_nullable
              as int,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as ChatParticipantRole,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateParticipantParamsImpl extends _UpdateParticipantParams {
  const _$UpdateParticipantParamsImpl(
      {required this.chatId, required this.targetId, required this.role})
      : super._();

  factory _$UpdateParticipantParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateParticipantParamsImplFromJson(json);

  @override
  final int chatId;
  @override
  final int targetId;
  @override
  final ChatParticipantRole role;

  @override
  String toString() {
    return 'UpdateParticipantParams(chatId: $chatId, targetId: $targetId, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateParticipantParamsImpl &&
            (identical(other.chatId, chatId) || other.chatId == chatId) &&
            (identical(other.targetId, targetId) ||
                other.targetId == targetId) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, chatId, targetId, role);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateParticipantParamsImplCopyWith<_$UpdateParticipantParamsImpl>
      get copyWith => __$$UpdateParticipantParamsImplCopyWithImpl<
          _$UpdateParticipantParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateParticipantParamsImplToJson(
      this,
    );
  }
}

abstract class _UpdateParticipantParams extends UpdateParticipantParams {
  const factory _UpdateParticipantParams(
      {required final int chatId,
      required final int targetId,
      required final ChatParticipantRole role}) = _$UpdateParticipantParamsImpl;
  const _UpdateParticipantParams._() : super._();

  factory _UpdateParticipantParams.fromJson(Map<String, dynamic> json) =
      _$UpdateParticipantParamsImpl.fromJson;

  @override
  int get chatId;
  @override
  int get targetId;
  @override
  ChatParticipantRole get role;
  @override
  @JsonKey(ignore: true)
  _$$UpdateParticipantParamsImplCopyWith<_$UpdateParticipantParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
