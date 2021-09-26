import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:millionaire/models/inventories.dart';
import 'package:provider/provider.dart';

class SearchedNumberPage extends StatefulWidget {
  @override
  _SearchedNumberPageState createState() => _SearchedNumberPageState();
}

class _SearchedNumberPageState extends State<SearchedNumberPage> {
  List<int> addToCartNumbers = [];
  List<int> bgColor = [50, 100];

  @override
  Widget build(BuildContext context) {
    print(addToCartNumbers.length);
    return Scaffold(
        appBar: AppBar(
          title: Text('ค้นหาเลข'),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 15),
          child: Consumer<Inventories>(
            builder: (context, items, child) {
              if (addToCartNumbers.length == 0) {
                addToCartNumbers = List.generate(
                    items.searchedInventories.length, (index) => 0);
              }
              List<int> cartItemQuantity =
                  List<int>.generate(addToCartNumbers.length, (index) {
                if (context.read<Inventories>().cart == null) {
                  return 0;
                }
                return 0;
                for (var i = 0;
                    i < context.read<Inventories>().cart.cartItems.length;
                    i++) {
                  for (var j = 0;
                      j <
                          context
                              .read<Inventories>()
                              .searchedInventories
                              .length;
                      j++) {
                    if (context.read<Inventories>().cart.cartItems[i].number ==
                        context.read<Inventories>().searchedInventories[j]) {
                      return context
                          .read<Inventories>()
                          .cart
                          .cartItems[i]
                          .quantity;
                    }
                  }
                }
                return 0;
              });
              return ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      height: 80,
                      // margin: EdgeInsets.symmetric(horizontal: 20),
                      // padding: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.purple),
                        color: Colors.purple[bgColor[index % 2]],
                        // borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "${items.searchedInventories[index].number}",
                            style: TextStyle(fontSize: 18),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "จำนวนในตะกร้า 0",
                                style: TextStyle(color: Colors.grey[800]),
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (addToCartNumbers[index] != 0) {
                                          addToCartNumbers[index]--;
                                        }
                                      });
                                    },
                                    child: Container(
                                      child: Icon(
                                        Icons.arrow_back_ios_rounded,
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(2),
                                    decoration:
                                        BoxDecoration(border: Border.all()),
                                    child: Text("${addToCartNumbers[index]}",
                                        style: TextStyle(fontSize: 18)),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      if (addToCartNumbers[index] <
                                          items.searchedInventories[index]
                                              .quantity) {
                                        setState(() {
                                          addToCartNumbers[index]++;
                                        });
                                      }
                                    },
                                    child: Container(
                                      child: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "จำนวนคงเหลือ ${items.searchedInventories[index].quantity}",
                                style: TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              if (context.read<Inventories>().cart != null) {
                                for (var i = 0;
                                    i <
                                        context
                                            .read<Inventories>()
                                            .cart
                                            .cartItems
                                            .length;
                                    i++) {
                                  if (items.searchedInventories[index].number ==
                                      context
                                          .read<Inventories>()
                                          .cart
                                          .cartItems[i]
                                          .number) {
                                    context
                                        .read<Inventories>()
                                        .cart
                                        .cartItems[i]
                                        .quantity = addToCartNumbers[index];
                                    break;
                                  }
                                  if (addToCartNumbers[index] > 0 &&
                                      i ==
                                          context
                                                  .read<Inventories>()
                                                  .cart
                                                  .length -
                                              1) {
                                    context
                                        .read<Inventories>()
                                        .cart
                                        .cartItems
                                        .addAll(Inventory(
                                            number: items
                                                .searchedInventories[index]
                                                .number,
                                            quantity: addToCartNumbers[index]));
                                  }
                                }
                              }
                              if (context.read<Inventories>().cart == null) {
                                context.read<Inventories>().cart = new Cart(
                                    user: "test",
                                    cartItems: <Inventory>[
                                      Inventory(
                                          number: items
                                              .searchedInventories[index]
                                              .number,
                                          quantity: addToCartNumbers[index])
                                    ]);
                              }
                              print(context.read<Inventories>().cart.user);
                              print(context
                                  .read<Inventories>()
                                  .cart
                                  .cartItems[0]
                                  .number);
                              print(context
                                  .read<Inventories>()
                                  .cart
                                  .cartItems[0]
                                  .quantity);
                            },
                            child: Icon(
                              Icons.shopping_cart,
                            ),
                          ),
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