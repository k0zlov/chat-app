import 'package:flutter/material.dart';
/// A custom snack-bar widget designed specifically for displaying error messages.
///
/// This snack-bar enhances the visual representation of error messages by using
/// a distinct red color scheme and custom styling. It inherits from Flutter's
/// [SnackBar] class and provides predefined configurations that are tailored for error
/// display scenarios.
///
/// The snack-bar dismisses horizontally and remains visible for 5 seconds, offering
/// ample time for the user to read the message. The inclusion of a close icon,
/// colored in black, adds a user-friendly touch by allowing manual dismissal of
/// the snack-bar.
///
/// Usage:
/// ```dart
/// ScaffoldMessenger.of(context).showSnackBar(ErrorSnackBar(
///   errorMessage: 'An error occurred. Please try again.',
/// ));
/// ```
class ErrorSnackBar extends SnackBar {
  /// Creates an [ErrorSnackBar] with a customized appearance and behavior suited for
  /// displaying error messages.
  ///
  /// [errorMessage] is required to specify the text message the snack-bar will display.
  /// This string should succinctly describe the error or issue encountered.
  ///
  /// The [key] argument is used to control how one widget replaces another widget in the tree.
  /// It's optional and can be used to uniquely identify this snack-bar widget.
  ErrorSnackBar({required String errorMessage, super.key})
      : super(
          dismissDirection: DismissDirection.horizontal,
          duration: const Duration(seconds: 5),
          closeIconColor: Colors.black,
          content: Text(
            errorMessage,
            style: const TextStyle(color: Colors.black),
          ),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: const BorderSide(color: Colors.red),
          ),
          backgroundColor: Colors.redAccent,
          showCloseIcon: true,
          margin: const EdgeInsets.symmetric(
            vertical: 40,
            horizontal: 20,
          ),
        );
}
