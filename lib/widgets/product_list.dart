import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/global_variable.dart';
import 'package:shop_app/widgets/product_card.dart';
import 'package:shop_app/pages/product_detail_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filter = ['Bata', 'Nike', 'Adiddas', 'Service', 'Puma'];
  late String selectedFilter;
  @override
  void initState() {
    selectedFilter = filter[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
        borderSide: BorderSide(color: const Color.fromARGB(53, 0, 0, 0)),
        borderRadius: BorderRadius.horizontal(left: Radius.circular(50)));
    return Column(
      children: [
        SafeArea(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Shoes\nCollection',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.5,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    border: border,
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    prefixIconColor: Theme.of(context).primaryColor,
                    focusedBorder: border,
                    enabledBorder: border,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 60,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filter.length,
              itemBuilder: (context, index) {
                final filters = filter[index];
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = filters;
                      });
                    },
                    child: Chip(
                      side: BorderSide(
                          color: const Color.fromARGB(5, 22, 21, 21)),
                      backgroundColor: selectedFilter == filters
                          ? Theme.of(context).primaryColor
                          : const Color.fromARGB(12, 22, 21, 21),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      label: Text(
                        filters,
                        style: TextStyle(
                          color: selectedFilter == filters
                              ? const Color.fromARGB(255, 250, 250, 250)
                              : Theme.of(context).primaryColor,
                        ),
                      ),
                      elevation: 5,
                    ),
                  ),
                );
              }),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: product.length,
            itemBuilder: (context, index) {
              final products = product[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return ProductDetailPage(product: product[0]);
                  }));
                },
                child: ProductCArd(
                  backgroundColor: index.isEven
                      ? Color.fromARGB(49, 71, 180, 154)
                      : const Color.fromARGB(61, 238, 219, 219),
                  title: products['title'] as String,
                  price: "120.0",
                  image: products['image'] as String,
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
