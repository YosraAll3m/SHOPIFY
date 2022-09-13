// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shopfiy_app/cubit/states.dart';
//
//
//
// class HomeBanner extends StatelessWidget{
//
//   var coursoalController=CarouselController();
//   var controller=PageController();
//
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<ShopfiyCubit,ShopifyStates>(
//       listener: (context,state){},
//       builder: (context,state)=>productsBuilder(
//     ShopfiyCubit.get(context).homeData,context)
//
//
//
//     );
//
//
//
//
//   }
//
//   Widget productsBuilder(HomeDataResponse model, context) =>
//       SingleChildScrollView(
//           physics: BouncingScrollPhysics(),
//           child:
//               Column(crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//             Container(
//               width: double.infinity,
//               child: CarouselSlider(
//                 items: model.homeData.banners
//                     .map(
//                       (e) => Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                         child: Container(
//                           width: double.infinity,
//                           height: 300,
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(30),
//                             child: Image(
//                               image: NetworkImage('${e.image}'),
//                               width: double.infinity,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                       ),
//                     )
//                     .toList(),
//                 options: CarouselOptions(
//                   autoPlay: true,
//                 ),
//               ),
//             )
//           ]));
// }