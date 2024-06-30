// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_chat_use_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdateChatParams _$UpdateChatParamsFromJson(Map<String, dynamic> json) {
  return _UpdateChatParams.fromJson(json);
}

/// @nodoc
mixin _$UpdateChatParams {
  int get chatId => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get chatType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateChatParamsCopyWith<UpdateChatParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateChatParamsCopyWith<$Res> {
  factory $UpdateChatParamsCopyWith(
          UpdateChatParams value, $Res Function(UpdateChatParams) then) =
      _$UpdateChatParamsCopyWithImpl<$Res, UpdateChatParams>;
  @useResult
  $Res call({int chatId, String? title, String? description, String? chatType});
}

/// @nodoc
class _$UpdateChatParamsCopyWithImpl<$Res, $Val extends UpdateChatParams>
    implements $UpdateChatParamsCopyWith<$Res> {
  _$UpdateChatParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatId = null,
    Object? title = freezed,
    Object? description = freezed,
    Object? chatType = freezed,
  }) {
    return _then(_value.copyWith(
      chatId: null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      chatType: freezed == chatType
          ? _value.chatType
          : chatType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateChatParamsImplCopyWith<$Res>
    implements $UpdateChatParamsCopyWith<$Res> {
  factory _$$UpdateChatParamsImplCopyWith(_$UpdateChatParamsImpl value,
          $Res Function(_$UpdateChatParamsImpl) then) =
      __$$UpdateChatParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int chatId, String? title, String? description, String? chatType});
}

/// @nodoc
class __$$UpdateChatParamsImplCopyWithImpl<$Res>
    extends _$UpdateChatParamsCopyWithImpl<$Res, _$UpdateChatParamsImpl>
    implements _$$UpdateChatParamsImplCopyWith<$Res> {
  __$$UpdateChatParamsImplCopyWithImpl(_$UpdateChatParamsImpl _value,
      $Res Function(_$UpdateChatParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatId = null,
    Object? title = freezed,
    Object? description = freezed,
    Object? chatType = freezed,
  }) {
    return _then(_$UpdateChatParamsImpl(
      chatId: null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      chatType: freezed == chatType
          ? _value.chatType
          : chatType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateChatParamsImpl extends _UpdateChatParams {
  const _$UpdateChatParamsImpl(
      {required this.chatId,
      this.title = null,
      this.description = null,
      this.chatType = null})
      : super._();

  factory _$UpdateChatParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateChatParamsImplFromJson(json);

  @override
  final int chatId;
  @override
  @JsonKey()
  final String? title;
  @override
  @JsonKey()
  final String? description;
  @override
  @JsonKey()
  final String? chatType;

  @override
  String toString() {
    return 'UpdateChatParams(chatId: $chatId, title: $title, description: $description, chatType: $chatType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateChatParamsImpl &&
            (identical(other.chatId, chatId) || other.chatId == chatId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.chatType, chatType) ||
                other.chatType == chatType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, chatId, title, description, chatType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateChatParamsImplCopyWith<_$UpdateChatParamsImpl> get copyWith =>
      __$$UpdateChatParamsImplCopyWithImpl<_$UpdateChatParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateChatParamsImplToJson(
      this,
    );
  }
}

abstract class _UpdateChatParams extends UpdateChatParams {
  const factory _UpdateChatParams(
      {required final int chatId,
      final String? title,
      final String? description,
      final String? chatType}) = _$UpdateChatParamsImpl;
  const _UpdateChatParams._() : super._();

  factory _UpdateChatParams.fromJson(Map<String, dynamic> json) =
      _$UpdateChatParamsImpl.fromJson;

  @override
  int get chatId;
  @override
  String? get title;
  @override
  String? get description;
  @override
  String? get chatType;
  @override
  @JsonKey(ignore: true)
  _$$UpdateChatParamsImplCopyWith<_$UpdateChatParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
