const baseIconsPath = 'assets/icons';

enum AppIcons {
  askQuestion('$baseIconsPath/ask_question.png'),
  telegramFaq('$baseIconsPath/telegram_faq.png'),
  telegramFeatures('$baseIconsPath/bulb.png'),
  changePhoto('$baseIconsPath/change_photo.png'),
  savedMessages('$baseIconsPath/saved_messages.png'),
  resentCalls('$baseIconsPath/recent_calls.png'),
  devices('$baseIconsPath/devices.png'),
  chatFolders('$baseIconsPath/chat_folders.png'),
  notificationsAndSounds('$baseIconsPath/notifications_and_sounds.png'),
  privacyAndSecurity('$baseIconsPath/privacy_and_security.png'),
  dataAndStorage('$baseIconsPath/data_and_storage.png'),
  appearance('$baseIconsPath/appearance.png'),
  powerSaving('$baseIconsPath/power_saving.png'),
  language('$baseIconsPath/language.png');


  const AppIcons(this.path);

  final String path;
}
