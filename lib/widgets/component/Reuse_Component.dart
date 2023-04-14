import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../themes/colors/HexColors.dart';

Navigation_back(context, widget) {
  Navigator.pop(
    context,
    PageTransition(
      child: widget,
      type: PageTransitionType.fade,
      duration: Duration(seconds: 2),
    ),
  );
}

navTo(context, widget) {
  Navigator.push(
    context,
    PageTransition(
      child: widget,
      type: PageTransitionType.fade,
      duration: Duration(seconds: 1),
    ),
  );
}

Widget Button({
  required String label,
  required GestureTapCallback? onTap,
}) {
  return GestureDetector(
    child: Container(
      alignment: Alignment.center,
      height: 45,
      width: 100,
      decoration: BoxDecoration(
        color: appBarClr,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    ),
    onTap: onTap,
  );
}

Widget longButton({
  required String label,
  required GestureTapCallback? onTap,
}) {
  return GestureDetector(
    child: Container(
      alignment: Alignment.center,
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: appBarClr.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    ),
    onTap: onTap,
  );
}

Widget DevidorLine(context) {
  return Container(
    margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.25),
    height: 1,
    width: double.infinity,
    color: Colors.white.withOpacity(0.5),
  );
}

textField({
  double? formWidth,
  required String text,
  required String hintText,
  IconData? prefixIcon,
  Widget? suffixIcon,
  Function(String)? onSubmit,
  bool isShown = false,
  required TextEditingController Controller,
  required TextInputType type,
  VoidCallback? onTap,
  VoidCallback? onSuffixPressed,
  Function(String)? onChanged,
  required String? Function(String?)? validate,
}) {
  return Container(
    width: formWidth,
    height: 90,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${text}',
          style: TextStyle(
              fontSize: 20, fontFamily: 'lightFont', color: Colors.white),
        ),
        SizedBox(
          height: 4,
        ),
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(width: 2, color: Colors.white),
            ),
            label: Text('${hintText}',
                maxLines: 1, overflow: TextOverflow.ellipsis),
            prefixIcon: Icon(prefixIcon),
            suffixIcon: suffixIcon,
            hintText: '${hintText}',
          ),
          obscureText: isShown,
          keyboardType: type,
          validator: validate,
          controller: Controller,
          onTap: onTap,
          onChanged: onChanged,
          onFieldSubmitted: onSubmit,
        ),
      ],
    ),
  );
}

PreferredSizeWidget appbar({
  VoidCallback? onpressed,
  required Widget iconLead,
  VoidCallback? onButtonPress,
}) {
  return AppBar(
    leading: IconButton(
      onPressed: onpressed,
      icon: iconLead,
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: IconButton(
          icon: Icon(Icons.search),
          onPressed: onButtonPress,
        ),
      ),
    ],
  );
}

Widget buildSearchItem(context, model) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.pink,
      borderRadius: BorderRadius.circular(20),
    ),
    margin: EdgeInsets.only(top: 10),
    padding: EdgeInsets.all(10),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${model.title}',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Icon(Icons.timelapse),
                  SizedBox(
                    width: 4,
                  ),
                  Text('${model.startTime}',
                      style: Theme.of(context).textTheme.subtitle2),
                  Text(' - '),
                  Text('${model.endTime}',
                      style: Theme.of(context).textTheme.subtitle2),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '${model.note}',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ],
          ),
        ),
        Container(
          width: 0.5,
          height: 60,
          color: Colors.white,
          margin: EdgeInsets.symmetric(horizontal: 5),
        ),
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            'new',
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
      ],
    ),
  );
}
