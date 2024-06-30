// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_participants_response_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatParticipantsResponseEntity {
  @JsonKey(name: 'items')
  List<ChatParticipantEntity> get participants =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatParticipantsResponseEntityCopyWith<ChatParticipantsResponseEntity>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatParticipantsResponseEntityCopyWith<$Res> {
  factory $ChatParticipantsResponseEntityCopyWith(
          ChatParticipantsResponseEntity value,
          $Res Function(ChatParticipantsResponseEntity) then) =
      _$ChatParticipantsResponseEntityCopyWithImpl<$Res,
          ChatParticipantsResponseEntity>;
  @useResult
  $Res call({@JsonKey(name: 'items') List<ChatParticipantEntity> participants});
}

/// @nodoc
class _$ChatParticipantsResponseEntityCopyWithImpl<$Res,
        $Val extends ChatParticipantsResponseEntity>
    implements $ChatParticipantsResponseEntityCopyWith<$Res> {
  _$ChatParticipantsResponseEntityCopyWithImpl(this._value, this._then);

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
              as List<ChatParticipantEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatParticipantsResponseEntityImplCopyWith<$Res>
    implements $ChatParticipantsResponseEntityCopyWith<$Res> {
  factory _$$ChatParticipantsResponseEntityImplCopyWith(
          _$ChatParticipantsResponseEntityImpl value,
          $Res Function(_$ChatParticipantsResponseEntityImpl) then) =
      __$$ChatParticipantsResponseEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'items') List<ChatParticipantEntity> participants});
}

/// @nodoc
class __$$ChatParticipantsResponseEntityImplCopyWithImpl<$Res>
    extends _$ChatParticipantsResponseEntityCopyWithImpl<$Res,
        _$ChatParticipantsResponseEntityImpl>
    implements _$$ChatParticipantsResponseEntityImplCopyWith<$Res> {
  __$$ChatParticipantsResponseEntityImplCopyWithImpl(
      _$ChatParticipantsResponseEntityImpl _value,
      $Res Function(_$ChatParticipantsResponseEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? participants = null,
  }) {
    return _then(_$ChatParticipantsResponseEntityImpl(
      participants: null == participants
          ? _value._participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<ChatParticipantEntity>,
    ));
  }
}

/// @nodoc

class _$ChatParticipantsResponseEntityImpl
    extends _ChatParticipantsResponseEntity {
  const _$ChatParticipantsResponseEntityImpl(
      {@JsonKey(name: 'items')
      final List<ChatParticipantEntity> participants = const []})
      : _participants = participants,
        super._();

  final List<ChatParticipantEntity> _participants;
  @override
  @JsonKey(name: 'items')
  List<ChatParticipantEntity> get participants {
    if (_participants is EqualUnmodifiableListView) return _participants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_participants);
  }

  @override
  String toString() {
    return 'ChatParticipantsResponseEntity(participants: $participants)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatParticipantsResponseEntityImpl &&
            const DeepCollectionEquality()
                .equals(other._participants, _participants));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_participants));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatParticipantsResponseEntityImplCopyWith<
          _$ChatParticipantsResponseEntityImpl>
      get copyWith => __$$ChatParticipantsResponseEntityImplCopyWithImpl<
          _$ChatParticipantsResponseEntityImpl>(this, _$identity);
}

abstract class _ChatParticipantsResponseEntity
    extends ChatParticipantsResponseEntity {
  const factory _ChatParticipantsResponseEntity(
          {@JsonKey(name: 'items')
          final List<ChatParticipantEntity> participants}) =
      _$ChatParticipantsResponseEntityImpl;
  const _ChatParticipantsResponseEntity._() : super._();

  @override
  @JsonKey(name: 'items')
  List<ChatParticipantEntity> get participants;
  @override
  @JsonKey(ignore: true)
  _$$ChatParticipantsResponseEntityImplCopyWith<
          _$ChatParticipantsResponseEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
