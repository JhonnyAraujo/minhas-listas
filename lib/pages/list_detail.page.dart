import 'package:flutter/material.dart';
import 'package:minhas_listas/models/shopping_list.model.dart';

class ListDetail extends StatefulWidget {
  ShoppingList lista;

  ListDetail({super.key, required this.lista});

  @override
  State<ListDetail> createState() => _ListDetailState();
}

class _ListDetailState extends State<ListDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Atualizar",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: .symmetric(horizontal: 16, vertical: 8),
        child: ListView(
          children: [
            TextField(
              decoration: InputDecoration(
                contentPadding: .symmetric(vertical: 4),
                label: Text(
                  "Mercado",
                  style: TextStyle(fontSize: 24, fontWeight: .bold),
                ),
              ),
            ),
            Row(
              children: [
                Transform.scale(
                  scale: 1.5,
                  child: Checkbox(
                    value: true,
                    shape: const CircleBorder(),
                    side: BorderSide(color: Colors.blue, width: 2),
                    activeColor: Colors.lightGreen,
                    onChanged: (value) {},
                  ),
                ),
                const SizedBox(width: 8),
                const Text("Arroz", style: TextStyle(fontSize: 18)),
                const Spacer(),
                const Text("R\$ 2.99", style: TextStyle(fontSize: 18)),
              ],
            ),
            Row(
              children: [
                Transform.scale(
                  scale: 1.5,
                  child: Checkbox(
                    value: true,
                    shape: const CircleBorder(),
                    side: BorderSide(color: Colors.blue, width: 2),
                    activeColor: Colors.lightGreen,
                    onChanged: (value) {},
                  ),
                ),
                const SizedBox(width: 8),
                const Text("Feijão", style: TextStyle(fontSize: 18)),
                const Spacer(),
                const Text("R\$ 5.99", style: TextStyle(fontSize: 18)),
              ],
            ),
            Row(
              children: [
                Transform.scale(
                  scale: 1.5,
                  child: Checkbox(
                    value: false,
                    shape: const CircleBorder(),
                    side: BorderSide(color: Colors.blue, width: 2),
                    activeColor: Colors.lightGreen,
                    onChanged: (value) {},
                  ),
                ),
                const SizedBox(width: 8),
                const Text("Massa", style: TextStyle(fontSize: 18)),
                const Spacer(),
                const Text("R\$ 1.99", style: TextStyle(fontSize: 18)),
              ],
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text("Não marcados"),
                    Text("R\$ 0,00", style: TextStyle(color: Colors.blue)),
                  ],
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text("Marcados"),
                    Text(
                      "R\$ 0,00",
                      style: TextStyle(color: Colors.lightGreen),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        shape: const StadiumBorder(),
        label: Text("Adicionar"),
      ),
    );
  }
}
