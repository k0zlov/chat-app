// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_chats_use_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SearchChatsParams _$SearchChatsParamsFromJson(Map<String, dynamic> json) {
  return _SearchChatsParams.fromJson(json);
}

/// @nodoc
mixin _$SearchChatsParams {
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchChatsParamsCopyWith<SearchChatsParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchChatsParamsCopyWith<$Res> {
  factory $SearchChatsParamsCopyWith(
          SearchChatsParams value, $Res Function(SearchChatsParams) then) =
      _$SearchChatsParamsCopyWithImpl<$Res, SearchChatsParams>;
  @useResult
  $Res call({String title});
}

/// @nodoc
class _$SearchChatsParamsCopyWithImpl<$Res, $Val extends SearchChatsParams>
    implements $SearchChatsParamsCopyWith<$Res> {
  _$SearchChatsParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchChatsParamsImplCopyWith<$Res>
    implements $SearchChatsParamsCopyWith<$Res> {
  factory _$$SearchChatsParamsImplCopyWith(_$SearchChatsParamsImpl value,
          $Res Function(_$SearchChatsParamsImpl) then) =
      __$$SearchChatsParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title});
}

/// @nodoc
class __$$SearchChatsParamsImplCopyWithImpl<$Res>
    extends _$SearchChatsParamsCopyWithImpl<$Res, _$SearchChatsParamsImpl>
    implements _$$SearchChatsParamsImplCopyWith<$Res> {
  __$$SearchChatsParamsImplCopyWithImpl(_$SearchChatsParamsImpl _value,
      $Res Function(_$SearchChatsParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
  }) {
    return _then(_$SearchChatsParamsImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchChatsParamsImpl extends _SearchChatsParams {
  const _$SearchChatsParamsImpl({this.title = ''}) : super._();

  factory _$SearchChatsParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchChatsParamsImplFromJson(json);

  @override
  @JsonKey()
  final String title;

  @override
  String toString() {
    return 'SearchChatsParams(title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchChatsParamsImpl &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchChatsParamsImplCopyWith<_$SearchChatsParamsImpl> get copyWith =>
      __$$SearchChatsParamsImplCopyWithImpl<_$SearchChatsParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchChatsParamsImplToJson(
      this,
    );
  }
}

abstract class _SearchChatsParams extends SearchChatsParams {
  const factory _SearchChatsParams({final String title}) =
      _$SearchChatsParamsImpl;
  const _SearchChatsParams._() : super._();

  factory _SearchChatsParams.fromJson(Map<String, dynamic> json) =
      _$SearchChatsParamsImpl.fromJson;

  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$SearchChatsParamsImplCopyWith<_$SearchChatsParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
