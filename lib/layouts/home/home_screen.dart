import 'package:cached_network_image/cached_network_image.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:intl/intl.dart';
import 'package:novolatask/layouts/home/cubit/cubit.dart';
import 'package:novolatask/layouts/home/cubit/states.dart';
import 'package:novolatask/models/home_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHomeDataFromApi(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          var cubit =HomeCubit.get(context);
          if (cubit.homeModel!=null) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    builderWidget(context,cubit),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      alignment: Alignment.topRight,
                      child: Text(
                        "  # ${cubit.homeModel!.interest}  ",
                        style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w700,
                            fontSize: 16.0

                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(
                        " الاسم الكامل للدورة بشكل افتراضي من أجل اظهار شكل التصميم  ",
                        style: TextStyle(

                            color: Colors.black26,
                            fontWeight: FontWeight.w900,
                            fontSize: 20.0

                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Icon(CupertinoIcons.calendar_today,color: Colors.black26),
                          Expanded(child:Text(DateFormat("yyyy-MM-dd").parse(cubit.homeModel!.date!).toString(),
                            style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: 16.0

                            ),) )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children:  [
                          const Icon(CupertinoIcons.pin,color: Colors.black26),
                          Expanded(child:Text(cubit.homeModel!.address!,
                            style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: 16.0
                            ),) )
                        ],
                      ),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ClipOval(
                            child: SizedBox.fromSize(
                              size: const Size.fromRadius(30), // Image radius
                              child:   CachedNetworkImage(
                                imageUrl: cubit.homeModel!.trainerImg!,
                                placeholder: (context, url) => const CircularProgressIndicator(),
                                errorWidget: (context, url, error) => const Icon(Icons.error,size: 55),
                              ),
                            ),
                          ),
                          Expanded(
                              child:Container(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(  cubit.homeModel!.trainerName!  ,
                                  style: const TextStyle(

                                      color: Colors.black26,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20.0

                                  ),),
                              ) )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      padding: const EdgeInsets.all(10.0),
                      child: Text(cubit.homeModel!.trainerInfo!,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),),
                    ),
                    const Divider(),
                    Container(
                      alignment: Alignment.topRight,
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(
                        " عن الدورة  ",
                        style: TextStyle(

                            color: Colors.black26,
                            fontWeight: FontWeight.w900,
                            fontSize: 20.0

                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      child:  Text(cubit.homeModel!.occasionDetail!,
                        style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 16.0
                        ),),
                    ),
                    const Divider(),

                    Container(
                      alignment: Alignment.topRight,
                      child: const Text(
                        " تكلفة  الدورة  ",
                        style: TextStyle(

                            color: Colors.black26,
                            fontWeight: FontWeight.w900,
                            fontSize: 20.0

                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("الحجز العادى ",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: 16.0
                            ),),
                          Text("SAR 40 ",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: 16.0
                            ),),

                        ],),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("الحجز المميز ",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: 16.0
                            ),),
                          Text("SAR 80  ",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: 16.0
                            ),),

                        ],),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("الحجز السريع ",
                            style: TextStyle(
                              color: Colors.grey,
                            ),),
                          Text("SAR 120  ",
                            style: TextStyle(
                              color: Colors.grey,
                            ),),

                        ],),
                    ),
                    const SizedBox(height: 75.0,)


                  ],
                ),
              ),
              bottomSheet: SizedBox(
                  width: double.infinity, // <-- match_parent
                  height: 55.0,
                  child: FlatButton(
                    color: Colors.deepPurple,
                    onPressed: () {  },
                    child: const Text("قم بالحجز الأن ",
                      style: TextStyle(

                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20.0

                      ),),

                  )
              )
          );
          }
          else {
            return const Center(child:  CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget builderWidget (context , HomeCubit cubit) => SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    child: SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: Stack(
        children: <Widget>[
      Container(
        color: Colors.black12,
        child: ImageSlideshow(
        width: double.infinity,
          height: 300,
          initialPage: 0,
          indicatorColor: Colors.transparent,
          indicatorBackgroundColor: Colors.transparent,
          onPageChanged: (value) {
            debugPrint('Page changed: $value');
            debugPrint('Page changed: ${cubit.currentIndex.toDouble()}');
            cubit.changeDotsIndex(value);
          },
          autoPlayInterval: 3000,
          isLoop: true,
          children: cubit.homeModel!.img!.map((e)=>
              CachedNetworkImage(
                imageUrl: e,
                fit: BoxFit.cover,
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error,size: 55),
              ),).toList(),
        ),
      ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              alignment: Alignment.topCenter,
              height: 35.0,
              margin: const EdgeInsets.only(top: 45.0),
              child: Row(
                children: const [

                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,

                  ),
                  Spacer(),
                  Icon(
                    Icons.share,
                    color: Colors.white,

                  ),

                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    CupertinoIcons.star,
                    color: Colors.white,
                  ),


                ],
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: const EdgeInsets.all(5.0),
              alignment: Alignment.bottomLeft,
              color: Colors.black12,
              height: 35.0,
              child:DotsIndicator(
                  dotsCount: cubit.homeModel!.img!.length,
                  position:  cubit.currentIndex.toDouble(),
                  decorator: const DotsDecorator(
                    color: Colors.white54, // Inactive color
                    activeColor: Colors.white,
                  ),
                ),
            ),
          ),
        ],
      ),
    )
  );
}
