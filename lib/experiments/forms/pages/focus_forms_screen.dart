import 'package:flutter/material.dart';

/// [FORMS]
///
/// What is a difference between TextFormField and TextField?
/// it are same but different  [TextFormField] work with [Form] widget
///
/// How Get data from [Form] Widget ?
///  by [Form.of(context)] or define key [GlobalKey<FormState> _formKey = GlobalKey<FormState>();]
///
/// Can use same FocusedNode with  multi [TextFormField]?
///   No , it is unique for each [TextFormField]
///
/// How Use Focus in Flutter?
///  some widget come with build on it and can pass [FocusNode] to it only such as [TextFormField]
///  if u want to focus to widget  use [Focus] widget
///
/// What is difference between [Focus.of(context)] and [FocusScope.of(context)]?
/// - Focus.of(context): Used to control focus on a single widget, like a single text field.
///  - FocusScope.of(context): Used to manage focus across a group of widgets, like navigating between multiple form fields.
///  In short: The first is for individual focus, and the second is for managing focus among multiple widgets.
///
///  What is definition of [FocusScope - FocusScopeNode - FocusNode - Focus Tree - Focus Traversal] ?
/// - [FocusScope]: A widget that manages focus within a specific scope.
/// - [FocusScopeNode]: Manages the focus within a FocusScope widget.
/// - [FocusNode]: Represents a single focusable element.
/// - [Focus Tree]: A hierarchical structure of FocusNodes that determines the order of focus traversal.
/// - [Focus Traversal]: The process of moving focus between different focusable elements using the keyboard or other input methods.

class FocusFormsScreen extends StatelessWidget {
  const FocusFormsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Long Forms')),
      body: Form(
        child: Column(
          children: [
            TextFormField(
              autofocus: true,
              decoration: const InputDecoration(
                hintText: 'Enter Your First Name',
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter Your First Name',
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter Your First',
              ),
            ),
            Focus(
              // skipTraversal: by default it is false
              // Skips the element in focus navigation, but it can still be focused programmatically.
              skipTraversal: false,
              // canRequestFocus: Completely disables focus on the element.
              // canRequestFocus: false,
              onFocusChange: (value) {
                print("Focus: $value");
              },
              child: Builder(
                builder: (context) {
                  return Text(
                    "Can Focus it ${Focus.of(context).hasFocus}",
                    style: TextStyle(color: Focus.of(context).hasFocus ? Colors.yellow : null),
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                  onPressed: () {
                    FocusScope.of(context).nextFocus();
                  },
                  child: const Text('next Focus'),
                )),
                const SizedBox(width: 20),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      FocusScope.of(context).previousFocus();
                    },
                    child: const Text('previous Focus'),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class AppInputTheme {
  InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
        /// Borders
        ///
        // [Default] value if borders are null
        border: InputBorder.none,
        // Enabled and not showing error
        enabledBorder: _buildBorder(Colors.white),
        // Has error but not focus
        errorBorder: _buildBorder(Colors.red),
        // Has error and focus
        focusedErrorBorder: _buildBorder(Colors.red),
        // Enabled and focused
        focusedBorder: _buildBorder(Colors.yellow),
        // Disabled
        disabledBorder: _buildBorder(Colors.grey[400]!),

        /// Padding
        ///
        // isDense seems to do nothing if you pass padding in
        isDense: false,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

        /// Other
        ///
        // "always" put the label at the top
        // floatingLabelBehavior: FloatingLabelBehavior.never,
        // This can be useful for putting TextFields in a row.
        // However,it might be more desirable to wrap with Flexible
        // to make them grow to the available width.
        // constraints: const BoxConstraints(maxWidth: 150),

        /// TextStyles
        suffixStyle: _builtTextStyle(Colors.black),
        counterStyle: _builtTextStyle(Colors.grey, size: 12.0),
        floatingLabelStyle: _builtTextStyle(Colors.black),
        // Make error and helper the same size,so that the field
        // does not grow in height when there is an error text
        errorStyle: _builtTextStyle(Colors.red, size: 12.0),
        helperStyle: _builtTextStyle(Colors.black, size: 12.0),
        hintStyle: _builtTextStyle(Colors.grey),
        labelStyle: _builtTextStyle(Colors.black),
        prefixStyle: _builtTextStyle(Colors.black),
      );

  OutlineInputBorder _buildBorder(Color color, {double width = 1}) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(color: color, width: width),
    );
  }

  TextStyle _builtTextStyle(Color color, {double size = 16.07}) {
    return TextStyle(
      color: color,
      fontSize: size,
    );
  }
}
