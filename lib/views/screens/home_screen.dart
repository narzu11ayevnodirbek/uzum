import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uzum/viewmodels/product_viewmodel.dart';
import 'package:uzum/views/screens/details_screen.dart';
import 'package:uzum/views/widgets/custom_button_filled.dart';

class HomeScreen extends StatelessWidget {
  final viewmodel = Get.put(ProductViewModel());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => NotificationListener<ScrollNotification>(
          onNotification: (scrollInfo) {
            if (scrollInfo.metrics.pixels ==
                scrollInfo.metrics.maxScrollExtent) {
              viewmodel.fetchProducts();
            }
            return false;
          },
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                backgroundColor: Colors.white,
                centerTitle: true,
                title: const Text(
                  "Products",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    if (index == viewmodel.products.length) {
                      return viewmodel.hasMore.value
                          ? const Center(child: CircularProgressIndicator())
                          : const SizedBox.shrink();
                    }

                    final product = viewmodel.products[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailsScreen(product: product),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: const Color(0xFFFAFAFC),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 7,
                              offset: const Offset(0, 4),
                              color: const Color(0xFF000000).withOpacity(0.05),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.network(
                              product.image,
                              width: double.infinity,
                              height: 112,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Placeholder(
                                  fallbackHeight: 112,
                                  fallbackWidth: double.infinity,
                                );
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.all(13),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.title,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    "\$${product.price}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  CustomButtonFilled(
                                    title: "Add to cart",
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }, childCount: viewmodel.products.length + 1),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 13,
                    childAspectRatio: 170 / 230,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
