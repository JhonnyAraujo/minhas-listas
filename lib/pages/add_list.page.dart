import 'package:flutter/material.dart';

class AddList extends StatefulWidget {
  const AddList({super.key});

  @override
  State<AddList> createState() => _AddListState();
}

class _AddListState extends State<AddList> {
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
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Nome da lista"),
                  filled: true,
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
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
                      onPressed: () {},
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
