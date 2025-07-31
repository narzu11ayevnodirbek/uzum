import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uzum/models/product_model.dart';
import 'package:uzum/viewmodels/product_viewmodel.dart';
import 'package:uzum/views/widgets/custom_button_filled.dart';
import 'package:uzum/views/widgets/custom_button_outlined.dart';

class DetailsScreen extends StatelessWidget {
  final viewmodel = Get.put(ProductViewModel());
  final ProductModel product;

  DetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Details product"),
        centerTitle: true,
      ),
      bottomNavigationBar: IntrinsicHeight(
        child: Container(
          padding: EdgeInsets.only(top: 14, right: 21, left: 21, bottom: 43),
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Color(0xFFF0F2F1))),
          ),
          child: Row(
            spacing: 15,
            children: [
              Expanded(
                child: CustomButtonFilled(
                  title: "Add to cart",
                  onPressed: () {},
                ),
              ),
              Expanded(
                child: CustomButtonOutlined(
                  title: "Buy Now",
                  onPressed: () {},
                  color: Color(0xFFF0F2F1),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product.image,
              width: double.infinity,
              height: 286,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Placeholder(
                  fallbackWidth: double.infinity,
                  fallbackHeight: 286,
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 9),
                  Text(
                    product.title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "\$ ${product.price}",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Choose the color",
                    style: TextStyle(color: Color(0xFF939393)),
                  ),
                  const SizedBox(height: 9),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 11,
                      children: List.generate(product.colors.length, (index) {
                        return Container(
                          width: 61,
                          height: 41,
                          decoration: BoxDecoration(
                            color: _getColorFromName(product.colors[index]),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        );
                      }),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.symmetric(
                        horizontal: BorderSide(color: Color(0xFFF0F2F1)),
                      ),
                    ),
                    child: Row(
                      spacing: 12,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey[300],
                          backgroundImage:
                              (product.shopImage != null &&
                                  product.shopImage!.isNotEmpty)
                              ? NetworkImage(product.shopImage!)
                              : null,
                          child:
                              (product.shopImage == null ||
                                  product.shopImage!.isEmpty)
                              ? Icon(Icons.store, color: Colors.white, size: 30)
                              : null,
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.shopName,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              product.lastSeen,
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF939393),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        CustomButtonOutlined(title: "Follow", onPressed: () {}),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Description of product",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 9),
                  Row(children: [Expanded(child: Text(product.description))]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getColorFromName(String colorName) {
    switch (colorName.toLowerCase()) {
      case 'red':
        return Colors.red;
      case 'blue':
        return Colors.blue;
      case 'green':
        return Colors.green;
      case 'black':
        return Colors.black;
      case 'white':
        return Colors.white;
      case 'yellow':
        return Colors.yellow;
      case 'grey':
        return Colors.grey;
      default:
        return Colors.grey.shade300;
    }
  }
}
