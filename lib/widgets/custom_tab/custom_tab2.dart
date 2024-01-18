import 'package:bukizz_1/constants/font_family.dart';
import 'package:bukizz_1/utils/dimensions.dart';
import 'package:bukizz_1/widgets/text%20and%20textforms/Reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class CustomTabBar2 extends StatefulWidget {
  final TabController tabController;
  final ValueChanged<int>? onIndexChanged;

  const CustomTabBar2({
    Key? key,
    required this.tabController,
    this.onIndexChanged,
  }) : super(key: key);

  @override
  _CustomTabBar2State createState() => _CustomTabBar2State();
}

class _CustomTabBar2State extends State<CustomTabBar2> {
  int currentIndex = 0;
  List<String> emojiText = [
    "Books",
    "Forms",
    "Uniform",
    "About School",
  ];

  @override
  void initState() {
    super.initState();

    // Add a listener to the TabController to update currentIndex when tabs are swiped
    widget.tabController.addListener(() {
      setState(() {
        currentIndex = widget.tabController.index;
        widget.onIndexChanged?.call(currentIndex);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Dimensions dimensions = Dimensions(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        4,
            (index) => InkWell(
          onTap: () {
            setState(() {
              currentIndex = index;
              widget.onIndexChanged?.call(currentIndex);
              widget.tabController.animateTo(index); // Animate to the selected tab
            });
          },

          child: Column(
            children: [
              CircleAvatar(
                radius: dimensions.height48 / 2,
                child: SvgPicture.asset('assets/tab icons/${index + 1}.svg')
              ),
              SizedBox(height: 8,),
              ReusableText(
                text: emojiText[index],
                fontSize: 14,
                height: 0.10,
                fontFamily: FontFamily.roboto,
                fontWeight: FontWeight.w700,
                color: Color(0xFF444444),
              ),
              SizedBox(height: dimensions.height16,),
              Container(
                child: currentIndex == index
                    ? SvgPicture.asset('assets/tab icons/marker.svg')
                    : null,
              )
            ],
          ),
        ),
      ),
    );
  }
}



