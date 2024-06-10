// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'archive_chat_use_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ArchiveChatParams _$ArchiveChatParamsFromJson(Map<String, dynamic> json) {
  return _ArchiveChatParams.fromJson(json);
}

/// @nodoc
mixin _$ArchiveChatParams {
  bool get isArchived => throw _privateConstructorUsedError;
  int get chatId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArchiveChatParamsCopyWith<ArchiveChatParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArchiveChatParamsCopyWith<$Res> {
  factory $ArchiveChatParamsCopyWith(
          ArchiveChatParams value, $Res Function(ArchiveChatParams) then) =
      _$ArchiveChatParamsCopyWithImpl<$Res, ArchiveChatParams>;
  @useResult
  $Res call({bool isArchived, int chatId});
}

/// @nodoc
class _$ArchiveChatParamsCopyWithImpl<$Res, $Val extends ArchiveChatParams>
    implements $ArchiveChatParamsCopyWith<$Res> {
  _$ArchiveChatParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isArchived = null,
    Object? chatId = null,
  }) {
    return _then(_value.copyWith(
      isArchived: null == isArchived
          ? _value.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool,
      chatId: null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArchiveChatParamsImplCopyWith<$Res>
    implements $ArchiveChatParamsCopyWith<$Res> {
  factory _$$ArchiveChatParamsImplCopyWith(_$ArchiveChatParamsImpl value,
          $Res Function(_$ArchiveChatParamsImpl) then) =
      __$$ArchiveChatParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isArchived, int chatId});
}

/// @nodoc
class __$$ArchiveChatParamsImplCopyWithImpl<$Res>
    extends _$ArchiveChatParamsCopyWithImpl<$Res, _$ArchiveChatParamsImpl>
    implements _$$ArchiveChatParamsImplCopyWith<$Res> {
  __$$ArchiveChatParamsImplCopyWithImpl(_$ArchiveChatParamsImpl _value,
      $Res Function(_$ArchiveChatParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isArchived = null,
    Object? chatId = null,
  }) {
    return _then(_$ArchiveChatParamsImpl(
      isArchived: null == isArchived
          ? _value.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
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
class _$ArchiveChatParamsImpl extends _ArchiveChatParams {
  const _$ArchiveChatParamsImpl({required this.isArchived, this.chatId = -1})
      : super._();

  factory _$ArchiveChatParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArchiveChatParamsImplFromJson(json);

  @override
  final bool isArchived;
  @override
  @JsonKey()
  final int chatId;

  @override
  String toString() {
    return 'ArchiveChatParams(isArchived: $isArchived, chatId: $chatId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArchiveChatParamsImpl &&
            (identical(other.isArchived, isArchived) ||
                other.isArchived == isArchived) &&
            (identical(other.chatId, chatId) || other.chatId == chatId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isArchived, chatId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArchiveChatParamsImplCopyWith<_$ArchiveChatParamsImpl> get copyWith =>
      __$$ArchiveChatParamsImplCopyWithImpl<_$ArchiveChatParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArchiveChatParamsImplToJson(
      this,
    );
  }
}

abstract class _ArchiveChatParams extends ArchiveChatParams {
  const factory _ArchiveChatParams(
      {required final bool isArchived,
      final int chatId}) = _$ArchiveChatParamsImpl;
  const _ArchiveChatParams._() : super._();

  factory _ArchiveChatParams.fromJson(Map<String, dynamic> json) =
      _$ArchiveChatParamsImpl.fromJson;

  @override
  bool get isArchived;
  @override
  int get chatId;
  @override
  @JsonKey(ignore: true)
  _$$ArchiveChatParamsImplCopyWith<_$ArchiveChatParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
