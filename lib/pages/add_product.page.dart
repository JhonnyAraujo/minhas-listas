import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Adicionar Item",
                style: TextStyle(fontSize: 24, fontWeight: .bold),
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                iconSize: 32,
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          Divider(thickness: 2),
          TextField(
            decoration: InputDecoration(
              label: Text("Nome do item"),
              border: .none,
            ),
          ),
          TextField(
            keyboardType: .number,
            decoration: InputDecoration(hintText: "R\$ 0,00", border: .none),
          ),
          Row(
            children: [
              Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Adicionar",
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
