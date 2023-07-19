import 'package:demo/booking/model/booking_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../detail/views/person_detail_screen.dart';
import '../controllers/booking_pagination_controller.dart';

class BookingListScreen extends StatefulWidget {
  const BookingListScreen({Key? key}) : super(key: key);

  @override
  State<BookingListScreen> createState() => _BookingListScreenState();
}

class _BookingListScreenState extends State<BookingListScreen> {
  BookingPaginationController bookingPaginationController =
      Get.put(BookingPaginationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Bookings",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: GetBuilder(
          init: bookingPaginationController,
          builder: (value) => listView(value: value)),
    );
  }
}

SingleChildScrollView listView({required BookingPaginationController value}) {
  return SingleChildScrollView(
    controller: value.controller,
    child: Column(children: [
      ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: value.list.length,
        itemBuilder: (context, index) {
          return cardView(item: value.list[index]);
        },
      ),
      if (value.isLoading) const CircularProgressIndicator()
    ]),
  );
}

GestureDetector cardView({required Result item}) {
  return GestureDetector(
    onTap: (){
      Get.to(() => PersonDetailScreen(personDetail: item));
    },
    child: Container(
      padding: const EdgeInsets.all(8),
      child: Row(children: [
        CircleAvatar(
            foregroundImage: NetworkImage(item.picture?.thumbnail ?? ""),
            radius: 25),
        const SizedBox(width: 10),
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("${item.name?.first}  ${item.name?.last}",
                  style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
              Text("age: ${item.dob?.age}"),
              Text("email: ${item.email}"),
            ]),
      ]),
    ),
  );
}
