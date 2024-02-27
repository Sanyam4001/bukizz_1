import 'package:bukizz/constants/font_family.dart';
import 'package:bukizz/constants/strings.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';
import 'package:bukizz/data/providers/cart_provider.dart';
import 'package:bukizz/data/providers/school_repository.dart';
import 'package:bukizz/data/repository/product/product_view_repository.dart';
import 'package:bukizz/ui/screens/HomeView/Ecommerce/main_screen.dart';
import 'package:bukizz/widgets/text%20and%20textforms/Reusable_text.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../../constants/colors.dart';
import '../../../../../../constants/constants.dart';
import '../../../../../../data/providers/bottom_nav_bar_provider.dart';
import '../../../../../../data/providers/stationary_provider.dart';
import '../../../../../../data/repository/cart_view_repository.dart';
import '../../../../../../utils/dimensions.dart';
import '../../../../../../widgets/containers/Reusable_ColouredBox.dart';
import '../../../../../../widgets/review widget/review.dart';
import '../../../../../../widgets/text and textforms/expandable_text_widget.dart';
import '../../checkout/checkout1.dart';


class UniformDescriptionScreen extends StatefulWidget {
  static const String route = '/uniform';
  const UniformDescriptionScreen({super.key});

  @override
  State<UniformDescriptionScreen> createState() =>
      _UniformDescriptionScreenState();
}

class _UniformDescriptionScreenState extends State<UniformDescriptionScreen> {
  bool productAdded = false;
  bool sizeChart=false;
  TextEditingController pinController = TextEditingController();

  @override
  void initState() {
    super.initState();
    pinController.text = AppConstants.userData.address.pinCode;
    checkDeliverable();
  }

  @override
  Widget build(BuildContext context) {
    var schoolData = context.read<SchoolDataProvider>();
    var stationaryData = context.read<StationaryProvider>();
    Dimensions dimensions = Dimensions(context);
    return Consumer<ProductViewRepository>(
      builder: (context, value, child) {

        // print(value.selectedProduct.variation);
        return Scaffold(
          appBar: AppBar(
            title: Text(schoolData.selectedSchool.name),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                //image for pageview container
                Container(
                  width: dimensions.screenWidth,
                  height: dimensions.height16 * 13.75,
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        // child: Image.asset('assets/school/perticular bookset/book.png',fit: BoxFit.contain,),
                        child: CachedNetworkImage(
                          imageUrl: value.data.image.first,
                        ),
                      ),
                      // Container(
                      //   child: Image.asset('assets/school/perticular bookset/book.png',fit: BoxFit.contain,),
                      // ),
                    ],
                  ),
                ),

                //book description container
                Container(
                  // height: dimensions.height8 * 13,
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
                            value.productName,
                            style: const TextStyle(
                              color: Color(0xFF121212),
                              fontSize: 20,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: dimensions.height24 / 4,
                        ),
                        Row(
                          children: [
                            //discount text
                            ReusableText(
                              text:
                              '${(((value.selectedProduct.variation[value.getSelectedSetDataIndex.toString()]![value.getSelectedStreamDataIndex.toString()]!.price - value.selectedProduct.variation[value.getSelectedSetDataIndex.toString()]![value.getSelectedStreamDataIndex.toString()]!.salePrice) * 100 / value.selectedProduct.variation[value.getSelectedSetDataIndex.toString()]![value.getSelectedStreamDataIndex.toString()]!.price).round().toString())}% Off',
                              fontSize: 20,
                              color: Color(0xFF058FFF),
                              fontWeight: FontWeight.w700,
                              height: 0.11,
                              fontFamily: FontFamily.nunito,
                            ),
                            SizedBox(
                              width: dimensions.width24 / 4,
                            ),
                            //listing price
                            Text(
// '',
                              value.selectedProduct.variation[value.getSelectedSetDataIndex.toString()]![value.getSelectedStreamDataIndex.toString()]!.price.toString(),
                              style: const TextStyle(
                                color: Color(0xFF7A7A7A),
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                decoration: TextDecoration.lineThrough,
                                fontFamily: 'nunito',

                              ),
                            ),

                            SizedBox(
                              width: dimensions.width24 / 4,
                            ),
                            //discounted price
                            Text(
                              value.selectedProduct.variation[value.getSelectedSetDataIndex.toString()]![value.getSelectedStreamDataIndex.toString()]!.salePrice.toString(),
                              style: const TextStyle(
                                color: Color(0xFF121212),
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                // fontFamily: 'nunito'
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),

                // ProductButtons(title: "Set", length: 2, selectedIndex: 0,),
                value.selectedProduct.set.isNotEmpty
                    ? Container(
                        alignment: Alignment.topCenter,
                        color: Colors.white,
                        width: dimensions.screenWidth,
                        height: dimensions.height36*2.5,
                        padding: EdgeInsets.symmetric(horizontal: dimensions.width24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: dimensions.height10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ReusableText(text: 'Size: 30', fontSize: 16,fontWeight: FontWeight.w700,),
                                SizedBox(width: dimensions.width16,),
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      sizeChart=!sizeChart;
                                    });
                                  },
                                  child: Container(
                                    width: 25.w,
                                    height: 15.sp,
                                    child: ReusableText(text: 'Size Chart', fontSize: 16,color: Color(0xFF058FFF),fontWeight: FontWeight.w500,),
                                  ),
                                ),


                              ],
                            ),
                            SizedBox(height: dimensions.height8,),
                            if(sizeChart)
                              Container(
                                  width: dimensions.screenWidth,
                                  height: 25.sp,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 4,
                                      itemBuilder: (context,index){
                                        return Container(

                                          decoration: BoxDecoration(
                                              border: Border.all(color: AppColors.black)
                                          ),
                                          margin: EdgeInsets.only(right: 16),
                                          width: dimensions.width10*5,
                                          height: dimensions.height10*2,
                                          child: Center(
                                            child: ReusableText(text: '32', fontSize: 16),
                                          ),
                                        );
                                      }
                                  )
                              )
                          ],
                        ),
                      )
                    : Container(),

                // SizedBox(height: 8,),
                value.selectedProduct.stream.isNotEmpty
                    ? Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(
                      horizontal: dimensions.width24,
                      vertical: dimensions.height8),
                  // height: dimensions.height10*8.2,
                  width: dimensions.screenWidth,
                  child: ListView.builder(
                      itemCount: value.selectedProduct.variation.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){
                        return Padding(
                          padding:  EdgeInsets.only(right: dimensions.width16),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  value.setSelectedSetData(index);
                                },
                                child: Container(
                                  decoration:BoxDecoration(
                                      border:Border.all(color: index==value.getSelectedSetDataIndex?Colors.blue:Colors.black38,width:2),
                                      borderRadius: BorderRadius.circular(30)
                                  ),
                                  child: CircleAvatar(

                                      backgroundColor: Colors.transparent,
                                      radius: 30,
                                      child: ClipOval(
                                          child: CachedNetworkImage(
                                            imageUrl: value.selectedProduct.set[index].image[0],
                                            fit: BoxFit.cover,
                                          ))),
                                ),
                              ),
                              SizedBox(height: dimensions.height10,),
                              ReusableText(text: value.selectedProduct.set[index].name, fontSize: 16,)
                            ],
                          ),
                        );
                      }
                  ),
                )
                    : Container(),

                //expandable text
                SizedBox(
                  height: dimensions.height16 / 2,
                ),
                ExpandableTextWidget(
                    title: "Description",
                    text: value.selectedProduct.description),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  width: 100.w,
                  color: Colors.white,
                  padding: EdgeInsets.only(
                      left: dimensions.width24,
                      top: dimensions.height16,
                      bottom: dimensions.height16,
                      right: dimensions.width24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText(
                        text: 'Delivery & Services',
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF121212),
                      ),
                      SizedBox(
                        height: dimensions.height8 * 3,
                      ),
                      ReusableText(
                        text: 'Enter Delivery Pincode',
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF444444),
                      ),
                      SizedBox(
                        height: dimensions.height8,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: dimensions.screenWidth,
                        height: 27.sp,
                        child: TextField(
                          maxLength: 6,
                          keyboardType: TextInputType.number,
                          controller: pinController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: dimensions.height8 * 2),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: const BorderSide(
                                  width: 0.50, color: Color(0xFFB7B7B7)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: const BorderSide(
                                  width: 0.50, color: Color(0xFFB7B7B7)),
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                checkDeliverable();
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.0),
                                child: Text(
                                  'Check',
                                  style: TextStyle(
                                    color: Color(0xFF058FFF),
                                    fontSize: 14,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ),
                            counterText: '',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: dimensions.height8,
                      ),
                      isDeliverable
                          ? Row(
                        children: [
                          Icon(
                            Icons.local_shipping,
                            color: Color(0xFF39A7FF),
                          ),
                          SizedBox(
                            width: dimensions.width10 / 2,
                          ),
                          //code for displaying the delivery date two day after the today date and time
                          ReusableText(
                            text: 'Estimated delivery by 21st March',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF444444),
                          )
                        ],
                      )
                          : Row(
                        children: [
                          Icon(
                            Icons.warning_rounded,
                            color: AppColors.red,
                          ),
                          SizedBox(
                            width: dimensions.width10 / 2,
                          ),
                          //code for displaying the delivery date two day after the today date and time
                          ReusableText(
                            text: 'Delivery Unavailable at this Pin code',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.red,
                          )
                        ],
                      )
                    ],
                  ),
                ),

                SizedBox(
                  height: dimensions.height8,
                ),


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
                          text: 'Complete your set',
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
                            itemCount:
                            stationaryData.stationaryListItems.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                EdgeInsets.only(right: dimensions.width16),
                                child: ReusableColoredBox(
                                  width: dimensions.width169,
                                  height: dimensions.height172,
                                  backgroundColor: Colors.white,
                                  borderColor: Colors.transparent,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      // Image container
                                      Container(
                                        width: dimensions.width169,
                                        height: dimensions.height86,
                                        child: Image(
                                            image: NetworkImage(stationaryData
                                                .stationaryListItems[index]
                                                .image)),
                                      ),

                                      // Book roll text hardcoded
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: dimensions.height8,
                                          left: dimensions.width24 / 2,
                                        ),
                                        child: ReusableText(
                                          text: stationaryData
                                              .stationaryListItems[index].name,
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
                                              text:
                                              '₹ ${stationaryData.stationaryListItems[index].price}',
                                              fontSize: 12,
                                              height: 0.11,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFF03045E),
                                            ),

                                            // Plus minus button functional
                                            ReusableColoredBox(
                                              width: dimensions.width80 / 1.25,
                                              height: 24.sp,
                                              backgroundColor: Colors.white,
                                              borderColor: Colors.black,
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  GestureDetector(
                                                    child: Icon(Icons.remove),
                                                    onTap: () {
                                                      // setState(() {
                                                      //   if (setCartQuantities[
                                                      //           index] >
                                                      //       0) {
                                                      //     setCartQuantities[
                                                      //         index]--;
                                                      //   }
                                                      // });
                                                      // context
                                                      //     .read<CartProvider>()
                                                      //     .removeSingleCartData(
                                                      //         "all",
                                                      //         stationaryData
                                                      //             .stationaryListItems[
                                                      //                 index]
                                                      //             .productId,
                                                      //         context,
                                                      //         0 , 0,
                                                      //         1);
                                                    },
                                                  ),
                                                  ReusableText(
                                                    text: context
                                                        .watch<
                                                        CartProvider>()
                                                        .cartData
                                                        .containsKey('all')
                                                        ? context
                                                        .watch<
                                                        CartProvider>()
                                                        .cartData[
                                                    'all']!
                                                        .containsKey(stationaryData
                                                        .stationaryListItems[
                                                    index]
                                                        .productId)
                                                        ? context
                                                        .watch<
                                                        CartProvider>()
                                                        .cartData[
                                                    'all']![
                                                    stationaryData
                                                        .stationaryListItems[
                                                    index]
                                                        .productId]![
                                                    0]![0]
                                                        .toString()
                                                        : '0'
                                                        : '0',
                                                    // text:  context.watch<CartProvider>().cartData['all']!.containsKey(stationaryData.stationaryListItems[index].productId) ? context.watch<CartProvider>().cartData['all']![stationaryData.stationaryListItems[index].productId]![0]![0].toString() : '0',
                                                    fontSize: 12,
                                                    height: 0.10,
                                                  ),
                                                  GestureDetector(
                                                    child: Icon(Icons.add),
                                                    onTap: () async {
                                                      // await context
                                                      //     .read<CartProvider>()
                                                      //     .addProductInCart(
                                                      //         "all",
                                                      //         0,
                                                      //         0,
                                                      //         1,
                                                      //         stationaryData
                                                      //             .stationaryListItems[
                                                      //                 index]
                                                      //             .productId,
                                                      //         context).then((value) => AppConstants.showSnackBar(context, 'Product added to cart'));
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
          bottomNavigationBar: Container(
            height: dimensions.height8 * 9,
            width: dimensions.screenWidth,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: dimensions.width24,
                  vertical: dimensions.height10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: isDeliverable
                        ? () async {
                      // context.read<CartProvider>().addProductInCart(
                      //     productView.selectedProduct.productId, context);
                      context.read<CartViewRepository>().isSingleBuyNow =
                      false;
                      productAdded
                          ? send()
                          : await context
                          .read<CartProvider>()
                          .addProductInCart(
                          schoolData.selectedSchool.name,
                          value
                              .selectedProduct
                              .set[value.getSelectedSetDataIndex]
                              .name,
                          value.selectedProduct.stream.isNotEmpty
                              ? value
                              .selectedProduct
                              .stream[value
                              .getSelectedStreamDataIndex]
                              .name
                              : '0',
                          1,
                          value.selectedProduct.productId,
                          context , 'bookset')
                          .then((value) => AppConstants.showSnackBar(
                          context, 'Product added to cart'));

                      setState(() {
                        productAdded = true;
                      });

                      // context.read<CartViewRepository>().setCartData(
                      //     schoolData.schoolName,
                      //     context
                      //         .read<CartProvider>()
                      //         .getCartData
                      //         .productsId[productView.selectedProduct.productId]!,
                      //     productView.selectedProduct.productId);
                    }
                        : () {},
                    child: Container(
                      height: dimensions.height8 * 6,
                      width: dimensions.width146,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side:
                          BorderSide(width: 0.50, color: Color(0xFF00579E)),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ReusableText(
                            text: productAdded ? 'Go to Cart' : 'Add to Cart',
                            fontSize: 16,
                            height: 0.11,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF00579E),
                          ),
                          const Icon(
                            Icons.shopping_cart,
                            color: Color(0xFF00579E),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      var cartView = context.read<CartViewRepository>();
                      cartView.isSingleBuyNow = true;
                      cartView.setTotalPrice(value.selectedProduct.variation[value.getSelectedSetDataIndex.toString()]![value.getSelectedStreamDataIndex.toString()]!.price);
                      cartView.setSalePrice(value.selectedProduct.variation[value.getSelectedSetDataIndex.toString()]![value.getSelectedStreamDataIndex.toString()]!.salePrice);
                      await context.read<CartViewRepository>().getCartProduct(
                          value.selectedProduct.productId,
                          schoolData.selectedSchool.name,
                          value.selectedProduct
                              .set[value.getSelectedSetDataIndex].name,
                          value.selectedProduct.stream.isNotEmpty
                              ? value
                              .selectedProduct
                              .stream[value.getSelectedStreamDataIndex]
                              .name
                              : '0',
                          1, AppString.bookSetType
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Checkout1()),
                      );
                    },
                    child: Container(
                      height: dimensions.height8 * 6,
                      width: dimensions.width146,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color(0xFF058FFF),
                      ),
                      child: Center(
                        child: ReusableText(
                          text: 'Buy Now',
                          fontSize: 16,
                          height: 0.11,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void send() {
    context.read<BottomNavigationBarProvider>().setSelectedIndex(1);
    Navigator.of(context)
        .pushNamedAndRemoveUntil(MainScreen.route, (route) => false);
  }

  bool isDeliverable = false;

  Future<void> checkDeliverable() async {
    await FirebaseDatabase.instance
        .ref()
        .child('pincode')
        .child(context.read<SchoolDataProvider>().selectedSchool.city)
        .get()
        .then((DataSnapshot snapshot) {
      if (snapshot.value != null) {
        if (snapshot.value.toString().contains(pinController.text)) {
          setState(() {
            isDeliverable = true;
          });
          print('pincode found');
        } else {
          setState(() {
            isDeliverable = false;
          });
          print('pincode not found');
        }
      } else {
        setState(() {
          isDeliverable = false;
        });
        print('Location not Exist');
      }
    });
  }

  void checkDeliveryDate() {
    DateTime now = DateTime.now();

    // Calculate delivery date
    DateTime deliveryDate = now.add(Duration(days: 2));

    // Format the delivery date
    String formattedDeliveryDate =
    DateFormat('yyyy-MM-dd HH:mm:ss').format(deliveryDate);

    // Display the delivery date
    print('Delivery Date: $formattedDeliveryDate');
  }
}