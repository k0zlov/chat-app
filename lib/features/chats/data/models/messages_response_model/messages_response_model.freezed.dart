// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'messages_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MessagesResponseModel _$MessagesResponseModelFromJson(
    Map<String, dynamic> json) {
  return _MessagesResponseModel.fromJson(json);
}

/// @nodoc
mixin _$MessagesResponseModel {
  @JsonKey(name: 'items')
  List<MessageModel> get messages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessagesResponseModelCopyWith<MessagesResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessagesResponseModelCopyWith<$Res> {
  factory $MessagesResponseModelCopyWith(MessagesResponseModel value,
          $Res Function(MessagesResponseModel) then) =
      _$MessagesResponseModelCopyWithImpl<$Res, MessagesResponseModel>;
  @useResult
  $Res call({@JsonKey(name: 'items') List<MessageModel> messages});
}

/// @nodoc
class _$MessagesResponseModelCopyWithImpl<$Res,
        $Val extends MessagesResponseModel>
    implements $MessagesResponseModelCopyWith<$Res> {
  _$MessagesResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
  }) {
    return _then(_value.copyWith(
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<MessageModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessagesResponseModelImplCopyWith<$Res>
    implements $MessagesResponseModelCopyWith<$Res> {
  factory _$$MessagesResponseModelImplCopyWith(
          _$MessagesResponseModelImpl value,
          $Res Function(_$MessagesResponseModelImpl) then) =
      __$$MessagesResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'items') List<MessageModel> messages});
}

/// @nodoc
class __$$MessagesResponseModelImplCopyWithImpl<$Res>
    extends _$MessagesResponseModelCopyWithImpl<$Res,
        _$MessagesResponseModelImpl>
    implements _$$MessagesResponseModelImplCopyWith<$Res> {
  __$$MessagesResponseModelImplCopyWithImpl(_$MessagesResponseModelImpl _value,
      $Res Function(_$MessagesResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
  }) {
    return _then(_$MessagesResponseModelImpl(
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<MessageModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessagesResponseModelImpl extends _MessagesResponseModel {
  const _$MessagesResponseModelImpl(
      {@JsonKey(name: 'items') final List<MessageModel> messages = const []})
      : _messages = messages,
        super._();

  factory _$MessagesResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessagesResponseModelImplFromJson(json);

  final List<MessageModel> _messages;
  @override
  @JsonKey(name: 'items')
  List<MessageModel> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'MessagesResponseModel(messages: $messages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessagesResponseModelImpl &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_messages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessagesResponseModelImplCopyWith<_$MessagesResponseModelImpl>
      get copyWith => __$$MessagesResponseModelImplCopyWithImpl<
          _$MessagesResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessagesResponseModelImplToJson(
      this,
    );
  }
}

abstract class _MessagesResponseModel extends MessagesResponseModel {
  const factory _MessagesResponseModel(
          {@JsonKey(name: 'items') final List<MessageModel> messages}) =
      _$MessagesResponseModelImpl;
  const _MessagesResponseModel._() : super._();

  factory _MessagesResponseModel.fromJson(Map<String, dynamic> json) =
      _$MessagesResponseModelImpl.fromJson;

  @override
  @JsonKey(name: 'items')
  List<MessageModel> get messages;
  @override
  @JsonKey(ignore: true)
  _$$MessagesResponseModelImplCopyWith<_$MessagesResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
