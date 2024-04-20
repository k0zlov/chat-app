// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_participants_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatParticipantsResponseModel _$ChatParticipantsResponseModelFromJson(
    Map<String, dynamic> json) {
  return _ChatParticipantsResponseModel.fromJson(json);
}

/// @nodoc
mixin _$ChatParticipantsResponseModel {
  @JsonKey(name: 'items')
  List<ChatParticipantModel> get participants =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatParticipantsResponseModelCopyWith<ChatParticipantsResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatParticipantsResponseModelCopyWith<$Res> {
  factory $ChatParticipantsResponseModelCopyWith(
          ChatParticipantsResponseModel value,
          $Res Function(ChatParticipantsResponseModel) then) =
      _$ChatParticipantsResponseModelCopyWithImpl<$Res,
          ChatParticipantsResponseModel>;
  @useResult
  $Res call({@JsonKey(name: 'items') List<ChatParticipantModel> participants});
}

/// @nodoc
class _$ChatParticipantsResponseModelCopyWithImpl<$Res,
        $Val extends ChatParticipantsResponseModel>
    implements $ChatParticipantsResponseModelCopyWith<$Res> {
  _$ChatParticipantsResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? participants = null,
  }) {
    return _then(_value.copyWith(
      participants: null == participants
          ? _value.participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<ChatParticipantModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatParticipantsResponseModelImplCopyWith<$Res>
    implements $ChatParticipantsResponseModelCopyWith<$Res> {
  factory _$$ChatParticipantsResponseModelImplCopyWith(
          _$ChatParticipantsResponseModelImpl value,
          $Res Function(_$ChatParticipantsResponseModelImpl) then) =
      __$$ChatParticipantsResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'items') List<ChatParticipantModel> participants});
}

/// @nodoc
class __$$ChatParticipantsResponseModelImplCopyWithImpl<$Res>
    extends _$ChatParticipantsResponseModelCopyWithImpl<$Res,
        _$ChatParticipantsResponseModelImpl>
    implements _$$ChatParticipantsResponseModelImplCopyWith<$Res> {
  __$$ChatParticipantsResponseModelImplCopyWithImpl(
      _$ChatParticipantsResponseModelImpl _value,
      $Res Function(_$ChatParticipantsResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? participants = null,
  }) {
    return _then(_$ChatParticipantsResponseModelImpl(
      participants: null == participants
          ? _value._participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<ChatParticipantModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatParticipantsResponseModelImpl
    extends _ChatParticipantsResponseModel {
  const _$ChatParticipantsResponseModelImpl(
      {@JsonKey(name: 'items')
      final List<ChatParticipantModel> participants = const []})
      : _participants = participants,
        super._();

  factory _$ChatParticipantsResponseModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ChatParticipantsResponseModelImplFromJson(json);

  final List<ChatParticipantModel> _participants;
  @override
  @JsonKey(name: 'items')
  List<ChatParticipantModel> get participants {
    if (_participants is EqualUnmodifiableListView) return _participants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_participants);
  }

  @override
  String toString() {
    return 'ChatParticipantsResponseModel(participants: $participants)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatParticipantsResponseModelImpl &&
            const DeepCollectionEquality()
                .equals(other._participants, _participants));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_participants));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatParticipantsResponseModelImplCopyWith<
          _$ChatParticipantsResponseModelImpl>
      get copyWith => __$$ChatParticipantsResponseModelImplCopyWithImpl<
          _$ChatParticipantsResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatParticipantsResponseModelImplToJson(
      this,
    );
  }
}

abstract class _ChatParticipantsResponseModel
    extends ChatParticipantsResponseModel {
  const factory _ChatParticipantsResponseModel(
          {@JsonKey(name: 'items')
          final List<ChatParticipantModel> participants}) =
      _$ChatParticipantsResponseModelImpl;
  const _ChatParticipantsResponseModel._() : super._();

  factory _ChatParticipantsResponseModel.fromJson(Map<String, dynamic> json) =
      _$ChatParticipantsResponseModelImpl.fromJson;

  @override
  @JsonKey(name: 'items')
  List<ChatParticipantModel> get participants;
  @override
  @JsonKey(ignore: true)
  _$$ChatParticipantsResponseModelImplCopyWith<
          _$ChatParticipantsResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
