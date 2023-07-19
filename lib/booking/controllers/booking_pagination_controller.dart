import 'package:demo/booking/model/booking_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/api_calling.dart';

class BookingPaginationController extends GetxController {
  List<Result> list = [];
  ScrollController controller = ScrollController();
  int pageNumber = 0;
  bool isLoading = false;

  void onInit() {
    getInitData();
    addItems();
    super.onInit();
  }

  addItems() async {
    controller.addListener(() async {
      if (controller.position.maxScrollExtent == controller.position.pixels) {
        isLoading = true;
        update();

        final response = await DemoApiCall()
            .getBookingList(pageNumber: pageNumber, pageSize: 10);
        BookingListResponse responseList =
            bookingListResponseFromJson(response.body);
        list.addAll(responseList.results ?? []);

        isLoading = false;
        update();
      }
    });
  }

  getInitData() async {
    final response = await DemoApiCall()
        .getBookingList(pageNumber: pageNumber, pageSize: 10);
    BookingListResponse responseList =
        bookingListResponseFromJson(response.body);
    list.addAll(responseList.results ?? []);
    update();
  }
}
