import 'package:flutter/material.dart';

class Ch6FormValidation extends StatefulWidget {
  const Ch6FormValidation({Key? key}) : super(key: key);
  static const String nameRoute = "/ch6_form_validation";

  @override
  State<Ch6FormValidation> createState() => _Ch6FormValidationState();
}

class _Ch6FormValidationState extends State<Ch6FormValidation> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final Order _order = Order();
  late TextEditingController _item;
  late TextEditingController _quantity;

  @override
  void initState() {
    super.initState();
    _item = TextEditingController();
    _quantity = TextEditingController();
  }

  @override
  void dispose() {
    _item.dispose();
    _quantity.dispose();
    super.dispose();
  }

  // String? _validateItemRequired(String? value) {
  //   return value!.isEmpty ? "item is required" : null;
  // }

  void _submitItem() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Validation"),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _item,
                onSaved: (newValue) => _order.quantity = _item.text,
                validator: (value) =>
                    value!.length >= 2 ? null : "value length less than 6",
                decoration: const InputDecoration(
                  labelText: "Items",
                  hintText: "Expresso",
                ),
              ),
              TextFormField(
                controller: _quantity,
                onSaved: (newValue) => _order.quantity = _quantity.text,
                validator: (value) => value!.isNotEmpty
                    ? null
                    : "Quantity must be greater than Zero",
                decoration: const InputDecoration(
                  labelText: "Quantity",
                  hintText: "1",
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: _submitItem,
                child: const Text("save"),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

class Order {
  late String item;
  late String quantity;
}
