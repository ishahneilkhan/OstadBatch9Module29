import 'package:ecomers_app/app/screen_size.dart';
import 'package:ecomers_app/features/cart/controller/cart_list_controller.dart';
import 'package:ecomers_app/features/cart/controller/delete_cart_controller.dart';
import 'package:ecomers_app/features/cart/model/cart_list_model.dart';
import 'package:ecomers_app/features/product/model/product_list_model.dart';
import 'package:ecomers_app/features/common/ui/widgets/product_increment_decrement_button.dart';
import 'package:ecomers_app/features/common/ui/widgets/show_snackbar_message.dart';
import 'package:ecomers_app/features/product/ui/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItemWidget extends StatefulWidget {
  final CartModel cartModel;

  const CartItemWidget({super.key, required this.cartModel});

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartListController>(
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, ProductDetailsScreen.name, arguments: {'productId': widget.cartModel.product!.sId});
            },
            child: SizedBox(
              width: ScreenSize.width(context),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: (widget.cartModel.product?.photos != null &&
                            widget.cartModel.product!.photos!.isNotEmpty)
                            ? Image.network(
                          widget.cartModel.product!.photos![0],
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        )
                            : Container(
                          width: 80,
                          height: 80,
                          color: Colors.grey[300],
                          alignment: Alignment.center,
                          child: const Text(
                            "No Image Available",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 12, color: Colors.black54),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    widget.cartModel.product!.title.toString(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    _onTapDelete(context);
                                  },
                                  icon: const Icon(
                                      Icons.delete_outline, color: Colors.red),
                                ),
                              ],
                            ),
                            Text(
                              'Color: ${(widget.cartModel.product?.colors != null &&
                                  widget.cartModel.product!.colors!.isNotEmpty)
                                  ? widget.cartModel.product!.colors![0]
                                  : "N/A"}  | Size: ${(widget.cartModel.product
                                  ?.sizes != null && widget.cartModel.product!.sizes!
                                  .isNotEmpty)
                                  ? widget.cartModel.product!.sizes![0]
                                  : "N/A"}',
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.grey),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$${widget.cartModel.product!.currentPrice}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                                ProductIncrementDecrementButton(cartModel: widget.cartModel),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _onTapDelete(BuildContext context) async {
    bool success = await Get.find<DeleteCartController>().deleteCart(widget.cartModel.sId!);

    if (success) {
      Get.find<CartListController>().getCartList();
      showSnackBarMessage(context, 'Cart Deleted Successfully');
    } else {
      showSnackBarMessage(context, Get.find<DeleteCartController>().errorMessage!);
    }
  }
}
