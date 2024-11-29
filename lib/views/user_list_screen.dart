

import 'package:avatar_stack/avatar_stack.dart';
import 'package:avatar_stack/positions.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_animated_button/bouncing_button.dart';
import '../controllers/user_list_controller.dart';
import '../generated/assets.dart';

class UserListScreen extends StatelessWidget {
  final UserListController userListController = Get.put(UserListController());

  @override
  Widget build(BuildContext context) {
    final settings = RestrictedPositions(
      maxCoverage: 0.2,
      minCoverage: 0.1,
      align: StackAlign.right,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Friends',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.black),),
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: Image.asset(Assets.iconsBackButton,width: 16, height: 16,color: Colors.black,),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 20),
            icon: Image.asset(Assets.iconsSearchIcon, width: 25, height: 25,color: Colors.black,),
            onPressed: () {},
          ),
        ],
      ),
      body: Obx(() {
        if (userListController.isLoading.value) {
          return Container(color: Colors.white,child: Center(child: CircularProgressIndicator()));
        }
        if (userListController.users.isEmpty) {
          return Center(child: Text('No users found'));
        }
        return Container(
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: DefaultTabController(
            length: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                ButtonsTabBar(
                  backgroundColor: Colors.white,
                  borderColor: Colors.blue,
                  unselectedBackgroundColor: Colors.white,
                  contentPadding: EdgeInsets.all(8),
                  buttonMargin: EdgeInsets.fromLTRB(0, 5, 20, 5),
                  labelStyle: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  borderWidth: 1,
                  unselectedBorderColor: Colors.black12,
                  radius: 40,
                  tabs: [
                    Tab(
                      icon: Image.asset(Assets.iconsHorizontalImg1, width: 20, height: 20,),
                      text: 'Friend Request',
                    ),
                    Tab(
                      icon: Image.asset(Assets.iconsHorizontalImg2, width: 20, height: 20,),
                      text: 'My Friends',
                    ),
                    Tab(
                      icon: Image.asset(Assets.iconsHorizontalImg3, width: 20, height: 20,),
                      text: 'Send Request',
                    ),
                  ],
                ),


                Expanded(
                  child: TabBarView(
                    children: [

                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10,),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(color: Colors.black, fontSize: 20.0),
                                children: <TextSpan>[
                                  TextSpan(text: 'Friend requests  ',style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),),
                                  TextSpan(text: '221',style: TextStyle(fontWeight: FontWeight.w600, color: Colors.red)),
                                ],
                              ),
                            ),

                            SizedBox(height: 15,),
                            Expanded(
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: userListController.users.length,
                                itemBuilder: (context, index) {
                                  final user = userListController.users[index];
                                  return Container(
                                    padding: EdgeInsets.only(bottom: 20),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CircleAvatar(
                                          radius: 30,
                                          child: Image.asset(Assets.imagesCirculerMainProfileImg,),
                                        ),

                                        SizedBox(width: 8,),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width*0.7,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(user.name,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.black),),

                                                  Text('6d',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.black45),),
                                                ],
                                              ),
                                            ),

                                            SizedBox(height: 5,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                AvatarStack(
                                                  height: 20,
                                                  width:32,
                                                  settings: settings,
                                                  avatars: [
                                                    AssetImage(Assets.imagesCirculerUser1,),
                                                    AssetImage(Assets.imagesCirculerUser2,),
                                                  ],
                                                ),
                                                SizedBox(width: 5,),
                                                Text('21 mutual friends',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.black45),),
                                              ],
                                            ),

                                            SizedBox(height: 5,),
                                            Container(
                                              width: MediaQuery.of(context).size.width*0.7,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  BouncingButton(
                                                    onClick: () {},
                                                    bouncingDuration: const Duration(milliseconds: 300),
                                                    curve: Curves.ease,
                                                    buttonHeight: 32,
                                                    buttonWidth: 120,
                                                    buttonBouncingWidth: 30,
                                                    alignment: Alignment.center,
                                                    buttonDecoration: BoxDecoration(
                                                      color: Colors.blue,
                                                      borderRadius: BorderRadius.circular(4),
                                                    ),
                                                    child: Text('Confirm', style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.white),),
                                                  ),

                                                  BouncingButton(
                                                    onClick: () {},
                                                    bouncingDuration: const Duration(milliseconds: 300),
                                                    curve: Curves.ease,
                                                    buttonHeight: 32,
                                                    buttonWidth: 120,
                                                    buttonBouncingWidth: 30,
                                                    alignment: Alignment.center,
                                                    buttonDecoration: BoxDecoration(
                                                      color: Colors.black12,
                                                      borderRadius: BorderRadius.circular(4),
                                                    ),
                                                    child: Text('Delete', style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.black),),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),

                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),

                      Center(
                        child: Text('My Friends Content',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),

                      Center(
                        child: Text('Send Request Content',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),



                    ],
                  ),
                ),



              ],
            ),
          ),
        );
      }),
    );
  }
}
