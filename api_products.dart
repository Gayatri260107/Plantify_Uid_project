import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiProduct {
  final int id;
  final String title;
  final double price;
  final String category;
  final String image;

  ApiProduct({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.image,
  });

  factory ApiProduct.fromJson(Map<String, dynamic> json) {
    return ApiProduct(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      category: json['category'],
      image: json['thumbnail'],
    );
  }
}

Future<List<ApiProduct>> fetchProducts() async {
  final response = await http.get(
    Uri.parse(
      'https://dummyjson.com/products?limit=6',
    ),
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);

    final List products = data['products'];

    return products
        .map(
          (product) => ApiProduct.fromJson(product),
        )
        .toList();
  }

  throw Exception('Failed to load products');
}

class ApiProductsPage extends StatefulWidget {
  const ApiProductsPage({super.key});

  @override
  State<ApiProductsPage> createState() =>
      _ApiProductsPageState();
}

class _ApiProductsPageState
    extends State<ApiProductsPage> {

  late Future<List<ApiProduct>> products;

  @override
  void initState() {
    super.initState();

    products = fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🌐 API Products'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),

      body: FutureBuilder<List<ApiProduct>>(
        future: products,

        builder: (context, snapshot) {

          if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text(
                'Unable to load products',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                ),
              ),
            );
          }

          final productList = snapshot.data!;

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: productList.length,

            itemBuilder: (context, index) {
              final product = productList[index];

              return Container(
                margin: const EdgeInsets.only(
                  bottom: 15,
                ),
                padding: const EdgeInsets.all(12),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(18),
                ),

                child: Row(
                  children: [

                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(12),

                      child: Image.network(
                        product.image,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(width: 15),

                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        children: [

                          Text(
                            product.title,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            product.category,
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            '₹${product.price.toStringAsFixed(2)}',
                            style: const TextStyle(
                              color: Colors.green,
                              fontSize: 17,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}