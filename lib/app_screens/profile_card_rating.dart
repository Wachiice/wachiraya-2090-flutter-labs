import 'package:flutter/material.dart';

void main() => runApp(const ProfileCardRating());

class ProfileCardRating extends StatelessWidget {
  const ProfileCardRating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(50),
      color: Colors.pink[100],
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ContactImage(
              imageFile: AssetImage('images/lalinalena.jpg'), name: "Lalina"),
          ContactInfo(
            addrName: "Bangkok",
            addrInfo: "Thailand",
            phoneManager: "098-8245429",
            workInquiries: "Work inquiries",
            instagram: "lalinalena ",
          ),
          Ratings(
            defaultColor: Colors.black,
            ratingColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
class ContactImage extends StatelessWidget {
  final ImageProvider imageFile;
  final String name;

  const ContactImage({Key? key, required this.imageFile, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const Alignment(0.6, 0.6),
      children: [
        CircleAvatar(
          backgroundImage: imageFile,
          radius: 100,
        ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.black45,
          ),
          child: Text(
            name,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white,decoration: TextDecoration.none),
          ),
        ),
      ],
    );
  }
}

class ContactInfo extends StatelessWidget {
  final String addrName;
  final String addrInfo;
  final String instagram;
  final String phoneManager;
  final String workInquiries;

  const ContactInfo({
    Key? key,
    required this.addrName,
    required this.addrInfo,
    required this.instagram,
    required this.phoneManager, 
    required this.workInquiries,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: Text(
                addrName,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text(addrInfo),
              leading: const Icon(
                Icons.home_work,
                color: Colors.pink,
              ),
            ),
            const Divider(),
            ListTile(
              title: Text(
                phoneManager,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text(workInquiries),
              leading: const Icon(
                Icons.phone,
                color: Colors.pink,
              ),
            ),
            ListTile(
              title: Text(instagram),
              leading: const Icon(
                Icons.forum,
                color: Colors.pink,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Ratings extends StatelessWidget {
  final Color defaultColor;
  final Color ratingColor;

  const Ratings(
      {Key? key, required this.defaultColor, required this.ratingColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
          Icon(
          Icons.star,
          color: ratingColor,
        ), 
         Icon(
          Icons.star,
          color: ratingColor,
        ), 
         Icon(
          Icons.star,
          color: ratingColor,
        ), 
         Icon(
          Icons.star,
          color: ratingColor,
        ), 
         Icon(
          Icons.star,
          color: defaultColor,
        ), 
       
      ],
    );
  }
}
