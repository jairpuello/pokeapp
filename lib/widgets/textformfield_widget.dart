import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final IconData? icon;
  final TextEditingController? controller;
  const TextFormFieldWidget({
    super.key,
    this.hintText,
    this.labelText,
    this.icon,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hintText?.isNotEmpty == true
            ? hintText
            : 'Ingrese el nombre o ID del Pokémon',
        labelText: labelText?.isNotEmpty == true ? labelText : 'Buscar Pokémon',
        prefixIcon: icon != null ? Icon(icon) : null,
      ),
    );
  }
}
