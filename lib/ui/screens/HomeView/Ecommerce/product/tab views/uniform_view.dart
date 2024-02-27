import 'package:bukizz/ui/screens/HomeView/Ecommerce/product/Uniform/uniform_description_screen.dart';
import 'package:flutter/material.dart';

import '../../../../../../utils/dimensions.dart';
import '../../../../../../widgets/text and textforms/Reusable_text.dart';
import '../../../../../../widgets/text and textforms/textformAddress.dart';


class UniformScreen extends StatefulWidget {
  const UniformScreen({super.key});

  @override
  State<UniformScreen> createState() => _UniformScreenState();
}

class _UniformScreenState extends State<UniformScreen> {
  @override
  Widget build(BuildContext context) {
    List<String>stationaryText=[
      'School uniform',
      'Track Suit',
      'Boys Grey Trouser',
      'Unisex Blue Blazer',
    ];
    // List<String>stationarySubText=[
    //   'Min 50% off',
    //   '@ RS.200',
    //   '@ RS.200',
    //   '@ RS.200',
    // ];
    TextEditingController formController=TextEditingController();
    Dimensions dimensions=Dimensions(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: dimensions.height8*2.5),

            Container(
              width: dimensions.screenWidth,
              height: dimensions.screenHeight,
              child:  GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    // crossAxisSpacing: dimensions.width24/3,
                    mainAxisSpacing: dimensions.height8,
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {

                    return GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, UniformDescriptionScreen.route);
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: dimensions.width24/2,vertical: dimensions.height10/2),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 0.50,
                              strokeAlign: BorderSide.strokeAlignOutside,
                              color: Color(0xFFD6D6D6),
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x2600579E),
                              blurRadius: 12,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            )
                          ],
                        ),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: dimensions.width10*16.8,
                              height: dimensions.height10*9.5,
                              child: ClipRRect(
                                  borderRadius:BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12)),
                                  child: Image.asset('assets/uniform/${index+1}.jpg',fit: BoxFit.cover,)
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: dimensions.width24/2,vertical: dimensions.height10*2),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ReusableText(text: stationaryText[index], fontSize: 14,color: Color(0xFF444444),fontWeight: FontWeight.w500,),
                                  SizedBox(height: dimensions.height10*2,),
                                  ReusableText(text: 'Min 50% Off', fontSize: 14,color:  Color(0xFF121212),fontWeight: FontWeight.w700,),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }
              ),
            )
          ],
        ),
      ),

    );
  }
}
