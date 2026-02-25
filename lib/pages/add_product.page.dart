import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:minhas_listas/models/product.model.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void addProduct() {
    if (!formKey.currentState!.validate()) return;

    String textPrice = priceController.text;

    String textPriceEUA = textPrice.replaceAll(",", ".");

    final double priceConvert = double.tryParse(textPriceEUA) ?? 0.0;

    final product = Product(name: nameController.text, price: priceConvert);

    Navigator.pop(context, product);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .only(
        left: 16,
        right: 16,
        top: 8,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  "Adicionar Item",
                  style: TextStyle(fontSize: 24, fontWeight: .bold),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  iconSize: 32,
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            Divider(thickness: 2),
            TextFormField(
              key: Key("inputItem"),
              controller: nameController,
              decoration: InputDecoration(
                label: Text("Nome do item"),
                border: .none,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Campo Obrigatorio!";
                }
              },
            ),
            TextField(
              key: Key("inputValue"),
              controller: priceController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]')),
              ],
              decoration: InputDecoration(hintText: "R\$ 0,00", border: .none),
            ),
            Row(
              children: [
                Spacer(),
                TextButton(
                  key: Key("addItemBtn"),
                  onPressed: addProduct,
                  child: Text(
                    "Adicionar",
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
