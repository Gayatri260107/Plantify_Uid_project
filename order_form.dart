import 'package:flutter/material.dart';

class OrderForm extends StatefulWidget {
  const OrderForm({super.key});

  @override
  State<OrderForm> createState() => _OrderFormState();
}

class _OrderFormState extends State<OrderForm>
    with SingleTickerProviderStateMixin {

  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  // ==============================
  // ANIMATION
  // ==============================

  late AnimationController animationController;
  late Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Animation controller
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    // Fade from invisible to visible
    fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(animationController);

    // Start animation
    animationController.forward();
  }

  @override
  void dispose() {

    // Dispose animation controller
    animationController.dispose();

    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();

    super.dispose();
  }

  // ==============================
  // FORM SUBMISSION
  // ==============================

  void submitForm() {
    if (_formKey.currentState!.validate()) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Order placed successfully! 🌿',
          ),
        ),
      );
    }
  }

  // ==============================
  // UI
  // ==============================

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      // ==============================
      // APP BAR
      // ==============================

      appBar: AppBar(
        title: const Text(
          'Place Your Order',
        ),

        backgroundColor: Colors.green,

        foregroundColor: Colors.white,
      ),

      // ==============================
      // BODY
      // ==============================

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(20),

        child: FadeTransition(

          // Apply fade animation
          opacity: fadeAnimation,

          child: Form(

            key: _formKey,

            child: Column(

              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                // ==============================
                // TITLE
                // ==============================

                const Text(
                  '🌿 Order Details',

                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 25),

                // ==============================
                // NAME
                // ==============================

                TextFormField(

                  controller: nameController,

                  decoration: InputDecoration(

                    labelText: 'Full Name',

                    prefixIcon:
                        const Icon(Icons.person),

                    border:
                        OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(12),
                    ),
                  ),

                  validator: (value) {

                    if (value == null ||
                        value.trim().isEmpty) {

                      return 'Please enter your name';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 18),

                // ==============================
                // EMAIL
                // ==============================

                TextFormField(

                  controller: emailController,

                  keyboardType:
                      TextInputType.emailAddress,

                  decoration: InputDecoration(

                    labelText: 'Email',

                    prefixIcon:
                        const Icon(Icons.email),

                    border:
                        OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(12),
                    ),
                  ),

                  validator: (value) {

                    if (value == null ||
                        value.trim().isEmpty) {

                      return 'Please enter your email';
                    }

                    if (!value.contains('@')) {

                      return 'Please enter a valid email';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 18),

                // ==============================
                // PHONE
                // ==============================

                TextFormField(

                  controller: phoneController,

                  keyboardType:
                      TextInputType.phone,

                  decoration: InputDecoration(

                    labelText: 'Phone Number',

                    prefixIcon:
                        const Icon(Icons.phone),

                    border:
                        OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(12),
                    ),
                  ),

                  validator: (value) {

                    if (value == null ||
                        value.trim().isEmpty) {

                      return 'Please enter your phone number';
                    }

                    if (value.length < 10) {

                      return 'Enter a valid phone number';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 18),

                // ==============================
                // ADDRESS
                // ==============================

                TextFormField(

                  controller: addressController,

                  maxLines: 3,

                  decoration: InputDecoration(

                    labelText: 'Delivery Address',

                    prefixIcon:
                        const Icon(Icons.home),

                    border:
                        OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(12),
                    ),
                  ),

                  validator: (value) {

                    if (value == null ||
                        value.trim().isEmpty) {

                      return 'Please enter your address';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 30),

                // ==============================
                // SUBMIT BUTTON
                // ==============================

                SizedBox(

                  width: double.infinity,

                  height: 52,

                  child: ElevatedButton(

                    onPressed: submitForm,

                    style:
                        ElevatedButton.styleFrom(

                      backgroundColor:
                          Colors.green,

                      foregroundColor:
                          Colors.white,

                      shape:
                          RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(12),
                      ),
                    ),

                    child: const Text(

                      'PLACE ORDER',

                      style: TextStyle(

                        fontSize: 16,

                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}