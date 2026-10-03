import 'package:flutter/material.dart';
import 'order_form.dart';

void main() {
  runApp(const PlantifyApp());
}

class PlantifyApp extends StatelessWidget {
  const PlantifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plantify',

      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: const Color(0xFFF5F7F2),
      ),

      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // ---------------- APP BAR ----------------

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        title: const Text(
          '🌿 Plantify',
          style: TextStyle(
            color: Colors.green,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [

          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),

          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black,
            ),
          ),

        ],
      ),

      // ---------------- BODY ----------------

      body: SingleChildScrollView(

        child: Column(
          children: [

            // ==============================
            // HERO SECTION
            // ==============================

            Padding(
              padding: const EdgeInsets.all(16),

              child: Container(
                width: double.infinity,

                padding: const EdgeInsets.all(24),

                decoration: BoxDecoration(
                  color: const Color(0xFFDDEFD8),
                  borderRadius: BorderRadius.circular(22),
                ),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    const Text(
                      'Bring Nature\nInto Your Home 🌿',

                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      'Beautiful plants for every space.',

                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),

                    const SizedBox(height: 18),

                    Container(
                      padding:
                          const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 10,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius:
                            BorderRadius.circular(10),
                      ),

                      child: const Text(
                        'SHOP PLANTS →',

                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ==============================
            // CATEGORIES
            // ==============================

            const Align(
              alignment: Alignment.centerLeft,

              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 16),

                child: Text(
                  'Categories',

                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            SingleChildScrollView(

              scrollDirection: Axis.horizontal,

              padding:
                  const EdgeInsets.symmetric(horizontal: 16),

              child: Row(
                children: [

                  categoryCard(
                    '🌱',
                    'Indoor',
                  ),

                  categoryCard(
                    '🌵',
                    'Succulents',
                  ),

                  categoryCard(
                    '🌸',
                    'Flowers',
                  ),

                  categoryCard(
                    '🪴',
                    'Desk Plants',
                  ),

                ],
              ),
            ),

            const SizedBox(height: 25),

            // ==============================
            // POPULAR PLANTS
            // ==============================

            const Align(
              alignment: Alignment.centerLeft,

              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 16),

                child: Text(
                  'Popular Plants',

                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // ==============================
            // FIRST ROW
            // ==============================

            Row(
              children: [

                Expanded(
                  child: plantCard(
                    context,
                    '🌿',
                    'Money Plant',
                    '₹299',
                    true,
                  ),
                ),

                Expanded(
                  child: plantCard(
                    context,
                    '🪴',
                    'Snake Plant',
                    '₹399',
                    false,
                  ),
                ),

              ],
            ),

            // ==============================
            // SECOND ROW
            // ==============================

            Row(
              children: [

                Expanded(
                  child: plantCard(
                    context,
                    '🌵',
                    'Mini Cactus',
                    '₹199',
                    false,
                  ),
                ),

                Expanded(
                  child: plantCard(
                    context,
                    '🌸',
                    'Peace Lily',
                    '₹449',
                    true,
                  ),
                ),

              ],
            ),

            const SizedBox(height: 20),

            // ==============================
            // FOOTER
            // ==============================

            const Text(
              '© 2026 Plantify',

              style: TextStyle(
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}


// ======================================================
// CATEGORY CARD
// ======================================================

Widget categoryCard(
  String emoji,
  String name,
) {

  return Container(

    margin:
        const EdgeInsets.only(right: 12),

    padding:
        const EdgeInsets.symmetric(
      horizontal: 18,
      vertical: 14,
    ),

    decoration: BoxDecoration(
      color: Colors.white,

      borderRadius:
          BorderRadius.circular(15),

      boxShadow: [

        BoxShadow(
          color:
              Colors.black.withOpacity(0.05),

          blurRadius: 5,
        ),

      ],
    ),

    child: Column(

      children: [

        Text(
          emoji,

          style:
              const TextStyle(
            fontSize: 30,
          ),
        ),

        const SizedBox(height: 5),

        Text(
          name,

          style:
              const TextStyle(
            fontWeight:
                FontWeight.w500,
          ),
        ),

      ],
    ),
  );
}


// ======================================================
// PRODUCT CARD
// ======================================================

Widget plantCard(
  BuildContext context,
  String emoji,
  String name,
  String price,
  bool isNew,
) {

  return Container(

    margin:
        const EdgeInsets.all(8),

    padding:
        const EdgeInsets.all(12),

    decoration: BoxDecoration(

      color: Colors.white,

      borderRadius:
          BorderRadius.circular(18),

      boxShadow: [

        BoxShadow(
          color:
              Colors.black.withOpacity(0.05),

          blurRadius: 6,
        ),

      ],
    ),

    child: Column(

      crossAxisAlignment:
          CrossAxisAlignment.start,

      children: [

        // ==========================================
        // PRODUCT IMAGE + NEW BADGE
        // ==========================================

        Stack(

          children: [

            Container(

              height: 130,

              width: double.infinity,

              decoration: BoxDecoration(

                color:
                    const Color(0xFFEAF5E6),

                borderRadius:
                    BorderRadius.circular(15),
              ),

              child: Center(

                child: Text(

                  emoji,

                  style:
                      const TextStyle(
                    fontSize: 65,
                  ),
                ),
              ),
            ),

            // NEW BADGE

            if (isNew)

              Positioned(

                top: 8,
                left: 8,

                child: Container(

                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 5,
                  ),

                  decoration:
                      BoxDecoration(

                    color:
                        Colors.orange,

                    borderRadius:
                        BorderRadius.circular(8),
                  ),

                  child: const Text(

                    'NEW',

                    style: TextStyle(

                      color:
                          Colors.white,

                      fontSize: 11,

                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),

        const SizedBox(height: 10),

        // ==========================================
        // PRODUCT NAME
        // ==========================================

        Text(

          name,

          style: const TextStyle(

            fontSize: 17,

            fontWeight:
                FontWeight.bold,
          ),
        ),

        const SizedBox(height: 5),

        // ==========================================
        // PRICE
        // ==========================================

        Text(

          price,

          style: const TextStyle(

            fontSize: 16,

            color: Colors.green,

            fontWeight:
                FontWeight.bold,
          ),
        ),

        const SizedBox(height: 10),

        // ==========================================
        // ADD TO CART BUTTON
        // ==========================================

        SizedBox(

          width: double.infinity,

          child: ElevatedButton(

            onPressed: () {

              Navigator.push(

                context,

                MaterialPageRoute(

                  builder: (context) =>
                      const OrderForm(),
                ),
              );
            },

            style:
                ElevatedButton.styleFrom(

              backgroundColor:
                  Colors.green,

              foregroundColor:
                  Colors.white,

              padding:
                  const EdgeInsets.all(10),

              shape:
                  RoundedRectangleBorder(

                borderRadius:
                    BorderRadius.circular(10),
              ),
            ),

            child: const Text(

              'Add to Cart',

              style: TextStyle(

                fontWeight:
                    FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}