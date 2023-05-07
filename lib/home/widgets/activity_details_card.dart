import 'package:dashboard/constant/responsive.dart';
import 'package:dashboard/data/my_data.dart';
import 'package:dashboard/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ActivityDetailsCard extends StatelessWidget {
  const ActivityDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: myFiles.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
          crossAxisSpacing: !Responsive.isMobile(context) ? 15 : 12,
          mainAxisSpacing: 12.0),
      itemBuilder: (context, i) {
        return CustomCard(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                padding:const EdgeInsets.all(10),
                margin:const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: myFiles[i].color.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: SvgPicture.asset(
                  myFiles[i].icon,
                  colorFilter:
                      ColorFilter.mode(myFiles[i].color, BlendMode.srcIn),
                ),
              ),
              Text(
                myFiles[i].title,
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: Text(
                  myFiles[i].value,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
              ProgressLine(
                color: myFiles[i].color,
                percentage: myFiles[i].percentage,
              ),
            ],
          ),
        );
      },
    );
  }
}

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    Key? key,
    this.color = const Color(0xFF2697FF),
    required this.percentage,
  }) : super(key: key);

  final Color? color;
  final int? percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: color!.withOpacity(0.1),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * (percentage! / 100),
            height: 5,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}
