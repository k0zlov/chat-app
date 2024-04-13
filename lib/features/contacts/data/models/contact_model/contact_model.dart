import 'package:chat_app/features/contacts/domain/entities/contact_entity/contact_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_model.freezed.dart';

part 'contact_model.g.dart';

@freezed
class ContactModel with _$ContactModel {
  const factory ContactModel({
    @Default(-1) int id,
    @Default('') String name,
    @Default('') String email,
  }) = _ContactModel;

  const ContactModel._();

  factory ContactModel.fromJson(Map<String, dynamic> json) =>
      _$ContactModelFromJson(json);

  ContactEntity toEntity() {
    return ContactEntity(
      name: name,
      email: email,
    );
  }
}
