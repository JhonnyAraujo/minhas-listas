import 'package:flutter/material.dart';
import 'package:minhas_listas/pages/add_list.page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Minhas Listas"), centerTitle: true),
      body: Padding(
        padding: const .symmetric(horizontal: 16, vertical: 8),
        child: ListView(
          children: [
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(borderRadius: .circular(5)),
              child: ListTile(
                contentPadding: .symmetric(horizontal: 8, vertical: 4),
                title: Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text("Mercado"),
                    Text("0/0", style: TextStyle(color: Colors.lightGreen)),
                  ],
                ),
                subtitle: Padding(
                  padding: const .only(top: 16),
                  child: LinearProgressIndicator(value: 0.0),
                ),
              ),
            ),
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(borderRadius: .circular(5)),
              child: ListTile(
                contentPadding: .symmetric(horizontal: 8, vertical: 4),
                title: Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text("Trabalho"),
                    Text("0/0", style: TextStyle(color: Colors.lightGreen)),
                  ],
                ),
                subtitle: Padding(
                  padding: const .only(top: 16),
                  child: LinearProgressIndicator(value: 0.0),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddList()),
          );
        },
        shape: CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
