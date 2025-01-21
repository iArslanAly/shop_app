import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/cart_provider.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key, required this.product});
  final Map<String, Object> product;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final List<int> sizes = [7, 8, 9, 10, 11];
  void onTap() {
    // If size is not 0, add the product to the cart
    if (selectedSize != 0) {
      Provider.of<CartProvider>(context, listen: false).addProduct(
        {
          'id': widget.product['id'],
          'title': widget.product['title'],
          'price': widget.product['price'],
          'image': widget.product['image'],
          'size': selectedSize,
        },
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Product Added Successfully')),
      );
    }

    // If size is 0, show a cool Material Banner
    if (selectedSize == 0) {
      ScaffoldMessenger.of(context).showMaterialBanner(
        MaterialBanner(
          content: Row(
            children: [
              Icon(Icons.warning_amber_outlined, color: Colors.white),
              SizedBox(width: 10),
              Text(
                'Please select a valid size!',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          backgroundColor: const Color.fromARGB(255, 246, 91, 91),
          elevation: 10,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Color.fromARGB(255, 246, 91, 91),
                backgroundColor: Colors.white, // Text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Rounded button
                ),
              ),
              onPressed: () {
                // Dismiss the banner
                ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
              },
              child: Text(
                'DISMISS',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      );
    }
  }

  int selectedSize = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details '),
      ),
      body: Column(
        children: [
          Text(
            widget.product['title'] as String,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image(
              image: AssetImage(
                widget.product['image'] as String,
              ),
              height: 150,
              width: 250,
            ),
          ),
          Spacer(
            flex: 2,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.inversePrimary,
              borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
            ),
            child: Column(
              children: [
                Text(
                  '\$${widget.product['price']}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 10),
                SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.product['sizes'] as List<int>).length,
                    itemBuilder: (context, index) {
                      final size =
                          (widget.product['sizes'] as List<int>)[index];

                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = size;
                            });
                          },
                          child: Chip(
                            backgroundColor: selectedSize == size
                                ? Theme.of(context).colorScheme.primary
                                : null,
                            label: Text(
                              size.toString(),
                              style: TextStyle(
                                color: selectedSize == size
                                    ? Colors.white
                                    : Colors.black,
                                fontStyle: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.fontStyle ??
                                    FontStyle.normal,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      onTap();
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 10,
                      children: [
                        Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                        Text(
                          'Add to Cart',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
