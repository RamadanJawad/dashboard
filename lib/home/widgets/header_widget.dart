import 'package:dashboard/constant/const.dart';
import 'package:dashboard/constant/responsive.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (!Responsive.isDesktop(context))
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: InkWell(
                onTap: () => scaffoldKey.currentState!.openDrawer(),
                child: const Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Icon(
                    Icons.menu,
                    color: Colors.grey,
                    size: 25,
                  ),
                ),
              ),
            ),
          if (Responsive.isMobile(context) || Responsive.isDesktop(context))
            Expanded(
              flex: 4,
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: cardBackgroundColor,
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 8
                  ),
                  hintText: 'Search',
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 21,
                  ),
                ),
              ),
            ),
          if (Responsive.isMobile(context))
            InkWell(
              onTap: () => scaffoldKey.currentState!.openEndDrawer(),
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Image.asset(
                  "assets/images/avatar.png",
                  width: 32,
                ),
              ),
            )
        ],
      ),
    );
  }
}
