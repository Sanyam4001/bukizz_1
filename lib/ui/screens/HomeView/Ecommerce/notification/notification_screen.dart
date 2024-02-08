import 'package:bukizz/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../../data/providers/bottom_nav_bar_provider.dart';
import '../../../../../widgets/text and textforms/Reusable_text.dart';
import '../main_screen.dart';
import '../profile/add_rating.dart';
import '../profile/contact_for_query.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    BottomNavigationBarProvider provider = context.read<BottomNavigationBarProvider>();
    Dimensions dimensions=Dimensions(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, MainScreen.route);
            provider.selectedIndex = 0;
          },
        ),
      ),
      body: Column(
        children: [
           SizedBox(height: dimensions.height24,),
           Container(
             padding:EdgeInsets.symmetric(horizontal: dimensions.width24/1.5,vertical: dimensions.height8/2),
             color: Colors.white,
             width: dimensions.screenWidth,
             height: dimensions.height10*22,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Row(
                   children: [
                     ReusableText(text: 'Your order is', fontSize: 16,color: Color(0xFF444444),fontWeight: FontWeight.w700,),
                     SizedBox(width: dimensions.width10/2,),
                     ReusableText(text: 'Delivered', fontSize: 16,color: Color(0xFF444444),fontWeight: FontWeight.w700,),
                   ],
                 ),
                 SizedBox(height: dimensions.height8*2,),
                 ReusableText(text: '1 Day ago', fontSize: 12,fontWeight: FontWeight.w500,color: Color(0xFF7A7A7A),),
                 SizedBox(height: dimensions.height8*2,),
                 Row(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Container(
                       width: dimensions.width10 * 7.6,
                       height: dimensions.height10 * 7.6,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(
                           dimensions.width10 ,
                         ),

                       ),
                       child: ClipRRect(
                         borderRadius: BorderRadius.circular(
                           dimensions.width10 ,
                         ),
                         child: SvgPicture.asset(
                           'assets/school/booksets/1.svg',
                           fit: BoxFit.cover,
                           color: Colors.red,
                         ),
                       ),
                     ),
                     SizedBox(width: dimensions.width16/2,),
                     SizedBox(
                       width: dimensions.width10*25.2,
                       child: const Text(
                         'Your product English Book Set - Wisdom World School - Class 1st is delivered',
                         style: TextStyle(
                           color: Color(0xFF444444),
                           fontSize: 12,
                           fontFamily: 'Nunito',
                           fontWeight: FontWeight.w400,
                           height: 0,
                         ),
                       ),
                     ),

                   ],
                 ),
                 SizedBox(height: dimensions.height8*2,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     OutlinedButton(
                       onPressed: () {
                         Navigator.pushNamed(context, KnowMoreScreen.route);
                       },
                       style: OutlinedButton.styleFrom(
                           shape: const RoundedRectangleBorder(
                             side: BorderSide(color: Color(0xFF00579E), ),
                           ),
                           padding: EdgeInsets.symmetric(horizontal: dimensions.width10*4)
                       ),
                       child: ReusableText(
                         text: 'Know More',
                         fontSize: 14,
                         fontWeight: FontWeight.w600,
                         color: Color(0xFF7A7A7A),
                       ),
                     ),
                     OutlinedButton(
                       onPressed: () {
                         Navigator.pushNamed(context, RatingsScreen.route);
                       },
                       style: OutlinedButton.styleFrom(
                           shape: const RoundedRectangleBorder(
                             side: BorderSide(color: Color(0xFF00579E), ),
                           ),
                           padding: EdgeInsets.symmetric(horizontal: dimensions.width10*4)
                       ),
                       child: ReusableText(
                         text: 'Add Review',
                         fontSize: 14,
                         fontWeight: FontWeight.w600,
                         color: Color(0xFF7A7A7A),
                       ),
                     ),
                   ],
                 ),

               ],
             ),
           ),
           Container(
             width: dimensions.width342,
             height: 0.5,
             color: Colors.black38,
           ),
           Container(
             padding: EdgeInsets.symmetric(vertical: dimensions.height16/3,horizontal: dimensions.width24/1.5),
             width: dimensions.screenWidth,
             height: dimensions.height10*7,
             color: Colors.white,
             child: Padding(
               padding:EdgeInsets.symmetric(horizontal: dimensions.width10,vertical: dimensions.height10*2),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: dimensions.height10/2,),
                        ReusableText(text: 'Book sets upto 50% Off', fontSize: 16,fontWeight: FontWeight.w700,color: Color(0xFF444444),),
                        SizedBox(height: dimensions.height10,),
                        ReusableText(text: '1 day ago', fontSize: 12,fontWeight: FontWeight.w500,color: Color(0xFF7A7A7A),),
                      ],
                    ),
                   Icon(Icons.chevron_right),
                 ],
               ),
             ),
           )
        ],
      )
    );
  }
}
