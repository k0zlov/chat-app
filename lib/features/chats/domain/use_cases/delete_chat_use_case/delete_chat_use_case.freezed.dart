// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_chat_use_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeleteChatParams _$DeleteChatParamsFromJson(Map<String, dynamic> json) {
  return _DeleteChatParams.fromJson(json);
}

/// @nodoc
mixin _$DeleteChatParams {
  int get chatId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeleteChatParamsCopyWith<DeleteChatParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteChatParamsCopyWith<$Res> {
  factory $DeleteChatParamsCopyWith(
          DeleteChatParams value, $Res Function(DeleteChatParams) then) =
      _$DeleteChatParamsCopyWithImpl<$Res, DeleteChatParams>;
  @useResult
  $Res call({int chatId});
}

/// @nodoc
class _$DeleteChatParamsCopyWithImpl<$Res, $Val extends DeleteChatParams>
    implements $DeleteChatParamsCopyWith<$Res> {
  _$DeleteChatParamsCopyWithImpl(this._value, this._then);

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
abstract class _$$DeleteChatParamsImplCopyWith<$Res>
    implements $DeleteChatParamsCopyWith<$Res> {
  factory _$$DeleteChatParamsImplCopyWith(_$DeleteChatParamsImpl value,
          $Res Function(_$DeleteChatParamsImpl) then) =
      __$$DeleteChatParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int chatId});
}

/// @nodoc
class __$$DeleteChatParamsImplCopyWithImpl<$Res>
    extends _$DeleteChatParamsCopyWithImpl<$Res, _$DeleteChatParamsImpl>
    implements _$$DeleteChatParamsImplCopyWith<$Res> {
  __$$DeleteChatParamsImplCopyWithImpl(_$DeleteChatParamsImpl _value,
      $Res Function(_$DeleteChatParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatId = null,
  }) {
    return _then(_$DeleteChatParamsImpl(
      chatId: null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeleteChatParamsImpl extends _DeleteChatParams {
  const _$DeleteChatParamsImpl({required this.chatId}) : super._();

  factory _$DeleteChatParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeleteChatParamsImplFromJson(json);

  @override
  final int chatId;

  @override
  String toString() {
    return 'DeleteChatParams(chatId: $chatId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteChatParamsImpl &&
            (identical(other.chatId, chatId) || other.chatId == chatId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, chatId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteChatParamsImplCopyWith<_$DeleteChatParamsImpl> get copyWith =>
      __$$DeleteChatParamsImplCopyWithImpl<_$DeleteChatParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeleteChatParamsImplToJson(
      this,
    );
  }
}

abstract class _DeleteChatParams extends DeleteChatParams {
  const factory _DeleteChatParams({required final int chatId}) =
      _$DeleteChatParamsImpl;
  const _DeleteChatParams._() : super._();

  factory _DeleteChatParams.fromJson(Map<String, dynamic> json) =
      _$DeleteChatParamsImpl.fromJson;

  @override
  int get chatId;
  @override
  @JsonKey(ignore: true)
  _$$DeleteChatParamsImplCopyWith<_$DeleteChatParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
