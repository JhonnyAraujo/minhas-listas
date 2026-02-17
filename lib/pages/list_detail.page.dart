import 'package:flutter/material.dart';

class ListDetail extends StatefulWidget {
  const ListDetail({super.key});

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
        child: Column(
          crossAxisAlignment: .start,
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
