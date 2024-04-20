// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_chat_use_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateChatParams _$CreateChatParamsFromJson(Map<String, dynamic> json) {
  return _CreateChatParams.fromJson(json);
}

/// @nodoc
mixin _$CreateChatParams {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateChatParamsCopyWith<CreateChatParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateChatParamsCopyWith<$Res> {
  factory $CreateChatParamsCopyWith(
          CreateChatParams value, $Res Function(CreateChatParams) then) =
      _$CreateChatParamsCopyWithImpl<$Res, CreateChatParams>;
  @useResult
  $Res call({String title, String description});
}

/// @nodoc
class _$CreateChatParamsCopyWithImpl<$Res, $Val extends CreateChatParams>
    implements $CreateChatParamsCopyWith<$Res> {
  _$CreateChatParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateChatParamsImplCopyWith<$Res>
    implements $CreateChatParamsCopyWith<$Res> {
  factory _$$CreateChatParamsImplCopyWith(_$CreateChatParamsImpl value,
          $Res Function(_$CreateChatParamsImpl) then) =
      __$$CreateChatParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String description});
}

/// @nodoc
class __$$CreateChatParamsImplCopyWithImpl<$Res>
    extends _$CreateChatParamsCopyWithImpl<$Res, _$CreateChatParamsImpl>
    implements _$$CreateChatParamsImplCopyWith<$Res> {
  __$$CreateChatParamsImplCopyWithImpl(_$CreateChatParamsImpl _value,
      $Res Function(_$CreateChatParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
  }) {
    return _then(_$CreateChatParamsImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateChatParamsImpl extends _CreateChatParams {
  const _$CreateChatParamsImpl({this.title = '', this.description = ''})
      : super._();

  factory _$CreateChatParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateChatParamsImplFromJson(json);

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String description;

  @override
  String toString() {
    return 'CreateChatParams(title: $title, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateChatParamsImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateChatParamsImplCopyWith<_$CreateChatParamsImpl> get copyWith =>
      __$$CreateChatParamsImplCopyWithImpl<_$CreateChatParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateChatParamsImplToJson(
      this,
    );
  }
}

abstract class _CreateChatParams extends CreateChatParams {
  const factory _CreateChatParams(
      {final String title, final String description}) = _$CreateChatParamsImpl;
  const _CreateChatParams._() : super._();

  factory _CreateChatParams.fromJson(Map<String, dynamic> json) =
      _$CreateChatParamsImpl.fromJson;

  @override
  String get title;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$CreateChatParamsImplCopyWith<_$CreateChatParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
