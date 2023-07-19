import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../booking/model/booking_model.dart';

class PersonDetailScreen extends StatelessWidget {
  const PersonDetailScreen({Key? key, required this.personDetail})
      : super(key: key);

  final Result personDetail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title:
              Text("${personDetail.name?.first}  ${personDetail.name?.last}"),
        ),
        body: ClipRRect(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              if (personDetail.picture?.large != null)
                Stack(children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .5,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(personDetail.picture!.large.toString(),
                        fit: BoxFit.cover),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  String subject =
                                      Uri.encodeComponent("Hello this is demo");
                                  Uri mail = Uri.parse(
                                      "mailto:${personDetail.email}?subject=$subject");
                                  if (await launchUrl(mail)) {}
                                },
                                child: const CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.red,
                                  child: Text(
                                    "mail",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  Uri phoneNo =
                                      Uri.parse('tel:${personDetail.phone}');
                                  if (await launchUrl(phoneNo)) {}
                                },
                                child: const CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.red,
                                  child: Text(
                                    "call",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              )
                            ]),
                      ),
                    ),
                  ),
                ]),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Bio",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const Text(
                          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.'),
                      Text(
                        "Phone: ${personDetail.phone}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        "email: ${personDetail.email}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ]),
              )
            ]),
          ),
        ));
  }
}
