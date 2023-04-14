import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../widgets/themes/colors/HexColors.dart';
import '../../widgets/component/Reuse_Component.dart';
import '../layout_screen/layout_screen.dart';

class Notifacition_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigation_back(context, LayoutScreen());
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(''),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Hello Yahia,',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'You have a new notification',
              style: Theme.of(context).textTheme.subtitle1,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                  left: 30,
                  right: 30,
                  top: 20,
                ),
                margin: EdgeInsets.only(
                  left: 30,
                  right: 30,
                ),
                decoration: BoxDecoration(
                  color: appBarClr,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.text_format,
                            size: 22,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Title',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'aga /Dakahlia/egypt',
                        style: Theme.of(context).textTheme.subtitle2,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.file_present,
                            size: 22,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Describtion',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'jagjsdlk dasgjkla sdg askldjgan s ksdgajsk gag aksjd gj aslkdgja sglk sdgkalsg dslkga gkajga dglasjg algjsa klgd sadlgk asdglkasdj galgashjgs',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_month_rounded,
                            size: 22,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Date',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '10:20',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
