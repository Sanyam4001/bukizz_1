import 'package:bukizz/data/repository/banners/banners.dart';
import 'package:bukizz/data/repository/product/general_product.dart';
import 'package:bukizz/utils/dimensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../../../Notifications/notifications.dart';
import '../../../../../../../constants/colors.dart';
import '../../../../../../../widgets/containers/Reusable_ColouredBox.dart';
import '../../../../../../../widgets/review widget/review.dart';
import '../../../../../../../widgets/text and textforms/Reusable_text.dart';
import '../../../../../../../widgets/text and textforms/expandable_text_widget.dart';
import '../../../checkout/checkout1.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();

List setText=['Bag','Classmate Notebook'];
class GeneralProductDescriptionScreen extends StatefulWidget {
  static const route = '/bag description';
  const GeneralProductDescriptionScreen({super.key});

  @override
  State<GeneralProductDescriptionScreen> createState() => _GeneralProductDescriptionScreenState();
}

class _GeneralProductDescriptionScreenState extends State<GeneralProductDescriptionScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Dimensions dimensions=Dimensions(context);
    return Consumer<GeneralProductRepository>(builder: (context , value , child){
      return Scaffold(
        appBar: AppBar(
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //image for pageview container
              Container(
                width: dimensions.screenWidth,
                height: dimensions.height16 * 13.75,
                child: PageView.builder(
                  itemCount: value.selectedProduct.variation[value.selectedVariationIndex].image.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Image(
                          image: CachedNetworkImageProvider(value.selectedProduct.variation[value.selectedVariationIndex].image[index]
                      )
                    ),
                    );
                  },
                ),
              ),

              //book description container
              Container(
                // height: 60.sp,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: dimensions.width24,
                      vertical: dimensions.height8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 345,
                        child: Text(
                          value.selectedProduct.name,
                          style: TextStyle(
                            color: Color(0xFF121212),
                            fontSize: 20,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: dimensions.height24 / 2,
                      ),
                      Row(
                        children: [
                          //discount text
                          ReusableText(
                            text: '20% Off',
                            fontSize: 16,
                            color: Color(0xFF058FFF),
                            fontWeight: FontWeight.w700,
                            height: 0.11,
                          ),
                          SizedBox(
                            width: dimensions.width24 / 4,
                          ),
                          //listing price
                          Text(
                            'Rs ${value.selectedProduct.variation[value.selectedVariationIndex].price}',
                            style: TextStyle(
                              color: Color(0xFF7A7A7A),
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),

                          SizedBox(
                            width: dimensions.width24 / 4,
                          ),
                          //discounted price
                          Text(
                            'Rs ${value.selectedProduct.variation[value.selectedVariationIndex].salePrice}',
                            style: TextStyle(
                              color: Color(0xFF121212),
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: dimensions.height24 / 3,
              ),
              //expandable text
              ExpandableTextWidget(
                  title: "Description",
                  text: value.selectedProduct.description,),
              SizedBox(
                height: dimensions.height24 / 3,
              ),

              // accesories
              ReusableColoredBox(
                width: dimensions.screenWidth,
                height: dimensions.height8 * 27,
                backgroundColor: Colors.white,
                borderColor: Color(0xFFE8E8E8),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: dimensions.width24,
                      vertical: dimensions.height16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //complete your set with -> text
                      ReusableText(
                        text: 'You May also like',
                        fontSize: 18,
                        height: 0.09,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF121212),
                      ),
                      SizedBox(
                        height: dimensions.height16,
                      ),
                      Container(
                        height: dimensions.height151,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(right: dimensions.width16),
                              child: ReusableColoredBox(
                                width: dimensions.width169,
                                height: dimensions.height172,
                                backgroundColor: Colors.white,
                                borderColor: Colors.transparent,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Image container
                                    Container(
                                      width: dimensions.width169,
                                      height: dimensions.height86,
                                      child: Image(
                                          image: AssetImage('assets/stationary/${index+1}.jpg')
                                      ),
                                    ),

                                    // Book roll text hardcoded
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: dimensions.height8,
                                        left: dimensions.width24 / 2,
                                      ),
                                      child: ReusableText(
                                        text: setText[index],
                                        fontSize: 12,
                                        height: 0.11,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF03045E),
                                      ),
                                    ),

                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: dimensions.height8 * 2,
                                        left: dimensions.width24 / 2,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          ReusableText(
                                            text: '₹ 150',
                                            fontSize: 12,
                                            height: 0.11,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF03045E),
                                          ),

                                          // Plus minus button functional
                                          ReusableColoredBox(
                                            width: dimensions.width80 / 1.25,
                                            height: dimensions.height24,
                                            backgroundColor: Colors.white,
                                            borderColor: Colors.black,
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                GestureDetector(
                                                  child: Icon(Icons.remove),
                                                  onTap: () {
                                                    setState(() {
                                                      // if (setCartQuantities[
                                                      // index] >
                                                      //     0) {
                                                      //   setCartQuantities[
                                                      //   index]--;
                                                      // }
                                                    });
                                                  },
                                                ),
                                                ReusableText(
                                                  text:
                                                  '0',
                                                  fontSize: 12,
                                                  height: 0.10,
                                                ),
                                                GestureDetector(
                                                  child: Icon(Icons.add),
                                                  onTap: () {
                                                    setState(() {
                                                      // setCartQuantities[index]++;
                                                    });
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: dimensions.height24 / 3,
              ),

              ReviewListWidget(),
            ],
          ),
        ),
        //todo  add it after publishing
        // bottomNavigationBar: Container(
        //   height: dimensions.height8 * 9,
        //   width: dimensions.screenWidth,
        //   color: Colors.white,
        //   child: Padding(
        //     padding: const EdgeInsets.symmetric(
        //       horizontal: 24,
        //     ),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         InkWell(
        //           onTap: () {
        //
        //           },
        //           child: Container(
        //             height: dimensions.height8 * 6,
        //             width: dimensions.width146,
        //             decoration: ShapeDecoration(
        //               shape: RoundedRectangleBorder(
        //                 side: BorderSide(width: 0.50, color: Color(0xFF00579E)),
        //                 borderRadius: BorderRadius.circular(100),
        //               ),
        //             ),
        //             child: Row(
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               children: [
        //                 ReusableText(
        //                   text: 'Add to Cart',
        //                   fontSize: 16,
        //                   height: 0.11,
        //                   fontWeight: FontWeight.w700,
        //                   color: Color(0xFF00579E),
        //                 ),
        //                 Icon(
        //                   Icons.shopping_cart,
        //                   color: Color(0xFF00579E),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //         InkWell(
        //           onTap: () {
        //             Notifications.showBigTextNotifications(title: 'new notification', body: 'test', fln: flutterLocalNotificationsPlugin);
        //             // print('buy button is tapped');
        //             // Navigator.push(
        //             //   context,
        //             //   MaterialPageRoute(builder: (context) => Checkout1()),
        //             // );
        //           },
        //           child: Container(
        //             height: dimensions.height8 * 6,
        //             width: dimensions.width146,
        //             decoration: BoxDecoration(
        //               borderRadius: BorderRadius.circular(100),
        //               color: Color(0xFF058FFF),
        //             ),
        //             child: Center(
        //               child: ReusableText(
        //                 text: 'Buy Now',
        //                 fontSize: 16,
        //                 height: 0.11,
        //                 fontWeight: FontWeight.w700,
        //                 color: Colors.white,
        //               ),
        //             ),
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // ),
      );
    },);
  }
}