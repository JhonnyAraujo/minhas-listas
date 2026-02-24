import 'package:flutter/material.dart';
import 'package:minhas_listas/models/shopping_list.model.dart';
import 'package:minhas_listas/pages/list_detail.page.dart';

class AddList extends StatefulWidget {
  const AddList({super.key});

  @override
  State<AddList> createState() => _AddListState();
}

class _AddListState extends State<AddList> {
  final TextEditingController titleController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  addList() {
    if (!formKey.currentState!.validate()) return;

    final ShoppingList lista = ShoppingList(title: titleController.text);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ListDetail(lista: lista)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const .symmetric(horizontal: 16, vertical: 64),
        child: Center(
          child: Column(
            children: [
              Spacer(),
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Nome da lista"),
                  filled: true,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Campo Obrigatorio!";
                  }
                },
              ),
              Spacer(),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context, AddList());
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.white),
                      ),
                      child: const Text(
                        "Voltar",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: FilledButton(
                      onPressed: addList,
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      child: const Text(
                        "Criar",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
