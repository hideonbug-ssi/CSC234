// import 'package:flutter/material.dart';

// class Product {
//   const Product({required this.name});

//   final String name;
// }

// typedef CartChangedCallback = Function(Product product, bool inCart);

// class ShoppingListItem extends StatelessWidget {
//   ShoppingListItem({
//     required this.product,
//     required this.inCart,
//     required this.onCartChanged,
//   }) : super(key: ObjectKey(product));

//   final Product product;
//   final bool inCart;
//   final CartChangedCallback onCartChanged;

//   Color _getColor(BuildContext context) {

//     return inCart //
//         ? Colors.black54
//         : Theme.of(context).primaryColor;
//   }

//   TextStyle? _getTextStyle(BuildContext context) {
//     if (!inCart) return null;

//     return const TextStyle(
//       color: Colors.black54,
//       decoration: TextDecoration.lineThrough,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       onTap: () {
//         onCartChanged(product, inCart);
//       },
//       leading: CircleAvatar(
//         backgroundColor: _getColor(context),
//         child: Text(product.name[0]),
//       ),
//       title: Text(
//         product.name,
//         style: _getTextStyle(context),
//       ),
//     );
//   }
// }

// class ShoppingList extends StatefulWidget {
//   const ShoppingList({required this.products, super.key});

//   final List<Product> products;

//   @override
//   State<ShoppingList> createState() => _ShoppingListState();
// }

// class _ShoppingListState extends State<ShoppingList> {
//   final _shoppingCart = <Product>{};

//   void _handleCartChanged(Product product, bool inCart) {
//     setState(() {
//       if (!inCart) {
//         _shoppingCart.add(product);
//       } else {
//         _shoppingCart.remove(product);
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Shopping List'),
//       ),
//       body: ListView(
//         padding: const EdgeInsets.symmetric(vertical: 8),
//         children: widget.products.map((product) {
//           return ShoppingListItem(
//             product: product,
//             inCart: _shoppingCart.contains(product),
//             onCartChanged: _handleCartChanged,
//           );
//         }).toList(),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(const MaterialApp(
//     title: 'Shopping App',
//     home: ShoppingList(
//       products: [
//         Product(name: 'Eggs'),
//         Product(name: 'Flour'),
//         Product(name: 'Chocolate chips'),
//       ],
//     ),
//   ));
// }

// // class Product {
// //   const Product({required this.name});

// //   final String name;
// // }

// // typedef CartChangedCallback = Function(Product product, bool inCart);

// // class ShoppingListItem extends StatelessWidget {
// //   ShoppingListItem({
// //     required this.product,
// //     required this.inCart,
// //     required this.onCartChanged,
// //   }) : super(key: ObjectKey(product));

// //   final Product product;
// //   final bool inCart;
// //   final CartChangedCallback onCartChanged;

// //   Color _getColor(BuildContext context) {
// //     // The theme depends on the BuildContext because different
// //     // parts of the tree can have different themes.
// //     // The BuildContext indicates where the build is
// //     // taking place and therefore which theme to use.

// //     return inCart //
// //         ? Colors.black54
// //         : Theme.of(context).primaryColor;
// //   }

// //   TextStyle? _getTextStyle(BuildContext context) {
// //     if (!inCart) return null;

// //     return const TextStyle(
// //       color: Colors.black54,
// //       decoration: TextDecoration.lineThrough,
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return ListTile(
// //       onTap: () {
// //         onCartChanged(product, inCart);
// //       },
// //       leading: CircleAvatar(
// //         backgroundColor: _getColor(context),
// //         child: Text(product.name[0]),
// //       ),
// //       title: Text(product.name, style: _getTextStyle(context)),
// //     );
// //   }
// // }

// // void main() {
// //   runApp(
// //     MaterialApp(
// //       home: Scaffold(
// //         body: Center(
// //           child: ShoppingListItem(
// //             product: const Product(name: 'Chips'),
// //             inCart: true,
// //             onCartChanged: (product, inCart) {},
// //           ),
// //         ),
// //       ),
// //     ),
// //   );
// // }

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Retrieve Text Input',
      home: MyCustomForm(),
    );
  }
}

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _MyCustomFormState extends State<MyCustomForm> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Retrieve Text Input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: TextField(
          controller: myController,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Retrieve the text the that user has entered by using the
                // TextEditingController.
                content: Text(myController.text),
              );
            },
          );
        },
        tooltip: 'Show me the value!',
        child: const Icon(Icons.text_fields),
      ),
    );
  }
}

