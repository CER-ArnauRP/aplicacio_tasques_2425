import 'package:flutter/material.dart';

class BotoDialog extends StatelessWidget {
  final String textBoto;
  final Function()? accioBoto;

  const BotoDialog({
    super.key,
    required this.textBoto,
    required this.accioBoto,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: accioBoto,
      color: Colors.teal[300],
      child: Text(textBoto),
    );
  }
}
