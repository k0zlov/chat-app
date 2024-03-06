// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_participants_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatParticipantsResponse _$ChatParticipantsResponseFromJson(
    Map<String, dynamic> json) {
  return _ChatParticipantsResponse.fromJson(json);
}

/// @nodoc
mixin _$ChatParticipantsResponse {
  @JsonKey(name: 'items')
  List<ChatParticipantsModel> get chatParticipants =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatParticipantsResponseCopyWith<ChatParticipantsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatParticipantsResponseCopyWith<$Res> {
  factory $ChatParticipantsResponseCopyWith(ChatParticipantsResponse value,
          $Res Function(ChatParticipantsResponse) then) =
      _$ChatParticipantsResponseCopyWithImpl<$Res, ChatParticipantsResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'items') List<ChatParticipantsModel> chatParticipants});
}

/// @nodoc
class _$ChatParticipantsResponseCopyWithImpl<$Res,
        $Val extends ChatParticipantsResponse>
    implements $ChatParticipantsResponseCopyWith<$Res> {
  _$ChatParticipantsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatParticipants = null,
  }) {
    return _then(_value.copyWith(
      chatParticipants: null == chatParticipants
          ? _value.chatParticipants
          : chatParticipants // ignore: cast_nullable_to_non_nullable
              as List<ChatParticipantsModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatParticipantsResponseImplCopyWith<$Res>
    implements $ChatParticipantsResponseCopyWith<$Res> {
  factory _$$ChatParticipantsResponseImplCopyWith(
          _$ChatParticipantsResponseImpl value,
          $Res Function(_$ChatParticipantsResponseImpl) then) =
      __$$ChatParticipantsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'items') List<ChatParticipantsModel> chatParticipants});
}

/// @nodoc
class __$$ChatParticipantsResponseImplCopyWithImpl<$Res>
    extends _$ChatParticipantsResponseCopyWithImpl<$Res,
        _$ChatParticipantsResponseImpl>
    implements _$$ChatParticipantsResponseImplCopyWith<$Res> {
  __$$ChatParticipantsResponseImplCopyWithImpl(
      _$ChatParticipantsResponseImpl _value,
      $Res Function(_$ChatParticipantsResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatParticipants = null,
  }) {
    return _then(_$ChatParticipantsResponseImpl(
      chatParticipants: null == chatParticipants
          ? _value._chatParticipants
          : chatParticipants // ignore: cast_nullable_to_non_nullable
              as List<ChatParticipantsModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatParticipantsResponseImpl extends _ChatParticipantsResponse {
  const _$ChatParticipantsResponseImpl(
      {@JsonKey(name: 'items')
      final List<ChatParticipantsModel> chatParticipants = const []})
      : _chatParticipants = chatParticipants,
        super._();

  factory _$ChatParticipantsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatParticipantsResponseImplFromJson(json);

  final List<ChatParticipantsModel> _chatParticipants;
  @override
  @JsonKey(name: 'items')
  List<ChatParticipantsModel> get chatParticipants {
    if (_chatParticipants is EqualUnmodifiableListView)
      return _chatParticipants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chatParticipants);
  }

  @override
  String toString() {
    return 'ChatParticipantsResponse(chatParticipants: $chatParticipants)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatParticipantsResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._chatParticipants, _chatParticipants));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_chatParticipants));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatParticipantsResponseImplCopyWith<_$ChatParticipantsResponseImpl>
      get copyWith => __$$ChatParticipantsResponseImplCopyWithImpl<
          _$ChatParticipantsResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatParticipantsResponseImplToJson(
      this,
    );
  }
}

abstract class _ChatParticipantsResponse extends ChatParticipantsResponse {
  const factory _ChatParticipantsResponse(
          {@JsonKey(name: 'items')
          final List<ChatParticipantsModel> chatParticipants}) =
      _$ChatParticipantsResponseImpl;
  const _ChatParticipantsResponse._() : super._();

  factory _ChatParticipantsResponse.fromJson(Map<String, dynamic> json) =
      _$ChatParticipantsResponseImpl.fromJson;

  @override
  @JsonKey(name: 'items')
  List<ChatParticipantsModel> get chatParticipants;
  @override
  @JsonKey(ignore: true)
  _$$ChatParticipantsResponseImplCopyWith<_$ChatParticipantsResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ChatParticipantsModel _$ChatParticipantsModelFromJson(
    Map<String, dynamic> json) {
  return _ChatParticipantsModel.fromJson(json);
}

/// @nodoc
mixin _$ChatParticipantsModel {
  @JsonKey(name: 'chat_id')
  int get chatId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  @JsonKey(name: 'joined_at')
  String get joinedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatParticipantsModelCopyWith<ChatParticipantsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatParticipantsModelCopyWith<$Res> {
  factory $ChatParticipantsModelCopyWith(ChatParticipantsModel value,
          $Res Function(ChatParticipantsModel) then) =
      _$ChatParticipantsModelCopyWithImpl<$Res, ChatParticipantsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'chat_id') int chatId,
      @JsonKey(name: 'user_id') int userId,
      String role,
      @JsonKey(name: 'joined_at') String joinedAt});
}

/// @nodoc
class _$ChatParticipantsModelCopyWithImpl<$Res,
        $Val extends ChatParticipantsModel>
    implements $ChatParticipantsModelCopyWith<$Res> {
  _$ChatParticipantsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatId = null,
    Object? userId = null,
    Object? role = null,
    Object? joinedAt = null,
  }) {
    return _then(_value.copyWith(
      chatId: null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      joinedAt: null == joinedAt
          ? _value.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatParticipantsModelImplCopyWith<$Res>
    implements $ChatParticipantsModelCopyWith<$Res> {
  factory _$$ChatParticipantsModelImplCopyWith(
          _$ChatParticipantsModelImpl value,
          $Res Function(_$ChatParticipantsModelImpl) then) =
      __$$ChatParticipantsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'chat_id') int chatId,
      @JsonKey(name: 'user_id') int userId,
      String role,
      @JsonKey(name: 'joined_at') String joinedAt});
}

/// @nodoc
class __$$ChatParticipantsModelImplCopyWithImpl<$Res>
    extends _$ChatParticipantsModelCopyWithImpl<$Res,
        _$ChatParticipantsModelImpl>
    implements _$$ChatParticipantsModelImplCopyWith<$Res> {
  __$$ChatParticipantsModelImplCopyWithImpl(_$ChatParticipantsModelImpl _value,
      $Res Function(_$ChatParticipantsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatId = null,
    Object? userId = null,
    Object? role = null,
    Object? joinedAt = null,
  }) {
    return _then(_$ChatParticipantsModelImpl(
      chatId: null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      joinedAt: null == joinedAt
          ? _value.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatParticipantsModelImpl extends _ChatParticipantsModel {
  const _$ChatParticipantsModelImpl(
      {@JsonKey(name: 'chat_id') this.chatId = 0,
      @JsonKey(name: 'user_id') this.userId = 0,
      this.role = '',
      @JsonKey(name: 'joined_at') this.joinedAt = ''})
      : super._();

  factory _$ChatParticipantsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatParticipantsModelImplFromJson(json);

  @override
  @JsonKey(name: 'chat_id')
  final int chatId;
  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  @JsonKey()
  final String role;
  @override
  @JsonKey(name: 'joined_at')
  final String joinedAt;

  @override
  String toString() {
    return 'ChatParticipantsModel(chatId: $chatId, userId: $userId, role: $role, joinedAt: $joinedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatParticipantsModelImpl &&
            (identical(other.chatId, chatId) || other.chatId == chatId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.joinedAt, joinedAt) ||
                other.joinedAt == joinedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, chatId, userId, role, joinedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatParticipantsModelImplCopyWith<_$ChatParticipantsModelImpl>
      get copyWith => __$$ChatParticipantsModelImplCopyWithImpl<
          _$ChatParticipantsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatParticipantsModelImplToJson(
      this,
    );
  }
}

abstract class _ChatParticipantsModel extends ChatParticipantsModel {
  const factory _ChatParticipantsModel(
          {@JsonKey(name: 'chat_id') final int chatId,
          @JsonKey(name: 'user_id') final int userId,
          final String role,
          @JsonKey(name: 'joined_at') final String joinedAt}) =
      _$ChatParticipantsModelImpl;
  const _ChatParticipantsModel._() : super._();

  factory _ChatParticipantsModel.fromJson(Map<String, dynamic> json) =
      _$ChatParticipantsModelImpl.fromJson;

  @override
  @JsonKey(name: 'chat_id')
  int get chatId;
  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  String get role;
  @override
  @JsonKey(name: 'joined_at')
  String get joinedAt;
  @override
  @JsonKey(ignore: true)
  _$$ChatParticipantsModelImplCopyWith<_$ChatParticipantsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
