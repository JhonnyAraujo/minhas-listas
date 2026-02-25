import 'package:flutter/material.dart';
import 'package:minhas_listas/models/shopping_list.model.dart';
import 'package:minhas_listas/pages/add_list.page.dart';
import 'package:minhas_listas/pages/list_detail.page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<ShoppingList> listas = [];

  void addList() async {
    final newList = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddList()),
    );

    if (newList != null) {
      setState(() {
        listas.add(newList);
      });
    }
  }

  void updateList(ShoppingList lista, int index) async {
    final resultUpdate = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ListDetail(lista: lista)),
    );

    if (resultUpdate != null) {
      setState(() {
        if (resultUpdate is ShoppingList) {
          listas[index] = resultUpdate;
        } else {
          listas.removeAt(index);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: Key("appBarTitle"),
        title: Text("Minhas Listas", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.diamond),
            iconSize: 28,
            color: Colors.amber,
          ),
        ],
      ),
      body: listas.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/lista-de-compras.png",
                      key: Key("emptyListImage"),
                      width: 100,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Crie sua primeira lista \n Toque no botão azul",
                    ),
                  ],
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListView.builder(
                itemCount: listas.length,
                itemBuilder: (context, index) {
                  final ShoppingList listItem = listas[index];
                  return Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ListTile(
                      key: Key("shoppingListCard"),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(listItem.title),
                          Text(
                            "${listItem.products.where((product) => product.isChecked).length}/${listItem.products.length}",
                            style: TextStyle(color: Colors.lightGreen),
                          ),
                        ],
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: LinearProgressIndicator(
                          color: Colors.lightGreen,
                          value: listItem.products.isEmpty
                              ? 0.0
                              : listItem.products
                                        .where((product) => product.isChecked)
                                        .length /
                                    listItem.products.length,
                        ),
                      ),
                      onTap: () => updateList(listItem, index),
                    ),
                  );
                },
              ),
            ),
      floatingActionButton: FloatingActionButton(
        key: Key("addListBtn"),
        onPressed: addList,
        shape: CircleBorder(),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}
