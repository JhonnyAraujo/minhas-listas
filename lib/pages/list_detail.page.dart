import 'package:flutter/material.dart';
import 'package:minhas_listas/models/product.model.dart';
import 'package:minhas_listas/models/shopping_list.model.dart';
import 'package:minhas_listas/pages/add_product.page.dart';

class ListDetail extends StatefulWidget {
  final ShoppingList lista;

  const ListDetail({super.key, required this.lista});

  @override
  State<ListDetail> createState() => _ListDetailState();
}

class _ListDetailState extends State<ListDetail> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void addProduct() async {
    final newProduct = await showModalBottomSheet<Product>(
      isScrollControlled: true,
      context: context,
      builder: (context) => const AddProduct(),
    );

    if (newProduct != null) {
      setState(() {
        widget.lista.products.add(newProduct);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double totalMarked = widget.lista.products
        .where((product) => product.isChecked)
        .fold(0.0, (soma, product) => soma + product.price);

    final double totalNotMarked = widget.lista.products
        .where((product) => !product.isChecked)
        .fold(0.0, (soma, product) => soma + product.price);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          TextButton(
            key: Key("updateListBtn"),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                Navigator.pop(context, widget.lista);
              }
            },
            child: Text(
              "Atualizar",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: .symmetric(horizontal: 16, vertical: 8),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: widget.lista.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 4),
                ),
                onChanged: (value) {
                  widget.lista.title = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Campo Obrigatorio!";
                  }
                },
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.lista.products.length,
                itemBuilder: (context, index) {
                  final Product product = widget.lista.products[index];

                  return Row(
                    children: [
                      Transform.scale(
                        scale: 1.5,
                        child: Checkbox(
                          key: Key("productCheckbox"),
                          value: product.isChecked,
                          shape: const CircleBorder(),
                          side: BorderSide(color: Colors.blue, width: 2),
                          activeColor: Colors.lightGreen,
                          onChanged: (value) {
                            setState(() {
                              product.isChecked = value!;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        product.name,
                        style: TextStyle(
                          fontSize: 18,
                          color: product.isChecked
                              ? Colors.black.withValues(alpha: 0.4)
                              : Colors.black,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "R\$ ${product.price.toStringAsFixed(2)}",
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text("Não marcados"),
                      Text(
                        "R\$ ${totalNotMarked.toStringAsFixed(2)}",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text("Marcados"),
                      Text(
                        "R\$ ${totalMarked.toStringAsFixed(2)}",
                        style: TextStyle(color: Colors.lightGreen),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        key: Key("addNewItemBtn"),
        onPressed: addProduct,
        shape: const StadiumBorder(),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        label: Text("Adicionar"),
      ),
    );
  }
}
