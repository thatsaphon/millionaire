import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:millionaire/models/inventories.dart';
import 'package:provider/provider.dart';

class SearchedNumberPage extends StatefulWidget {
  @override
  _SearchedNumberPageState createState() => _SearchedNumberPageState();
}

class _SearchedNumberPageState extends State<SearchedNumberPage> {
  List<int> bgColor = [50, 200];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ค้นหาเลข'),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 15),
          child: Consumer<SearchedInventories>(
            builder: (context, items, child) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      padding: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.purple),
                        color: Colors.orange[bgColor[index % 2]],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "${items.searchedInventories[index].number}",
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            "${items.searchedInventories[index].quantity}",
                            style: TextStyle(fontSize: 18),
                          ),
                          Icon(Icons.shopping_cart),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: items.searchedInventories.length);
            },
          ),
        ));
  }
}

// class searchedItems extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }

// }