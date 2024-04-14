import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_entity.freezed.dart';

@freezed
class ContactEntity with _$ContactEntity {
  const factory ContactEntity({
    @Default(-1) int id,
    @Default('') String name,
    @Default('') String email,
  }) = _ContactEntity;

  const ContactEntity._();
}
