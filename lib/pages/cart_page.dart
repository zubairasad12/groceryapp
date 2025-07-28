import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:groceryshopbymitchkoko/model/cart_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Cart")),
      body: Consumer<CartModel>(
        builder: (context, value, child) {
          double totalPrice = value.cartItems.fold(
            0,
                (sum, item) => sum + double.parse(item[1]),
          );

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: value.cartItems.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        leading: Image.asset(value.cartItems[index][2], width: 50),
                        title: Text(value.cartItems[index][0]),
                        subtitle: Text("\$${value.cartItems[index][1]}"),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            Provider.of<CartModel>(context, listen: false)
                                .removeFromCart(index);
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Total + Pay Now
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Total:",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text("\$${totalPrice.toStringAsFixed(2)}",
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  "lib/images/mastercard.png",
                                  height: 100,
                                ),
                                const SizedBox(height: 20),
                                const Text(
                                  "You have paid the bill",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 12),
                      ),
                      child: const Text("Pay Now"),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
