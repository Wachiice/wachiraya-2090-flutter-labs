import 'package:flutter/material.dart';

void main() => runApp(const ProfileCardRating());

class ProfileCardRating extends StatelessWidget {
  const ProfileCardRating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return constraints.maxWidth > 600
              ? buildWideScreenContainers()
              : buildPortraitContainer();
        },
      ),
    );
  }

  Widget buildWideScreenContainers() {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(40),
        color: Colors.pink[100],
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const ContactImage(
              imageFile: AssetImage('images/lalinalena.jpg'),
              name: "Lalina",
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const ContactInfo(
                    addrName: "Bangkok",
                    addrInfo: "Thailand",
                    phoneManager: "098-8245429",
                    workInquiries: "Work inquiries",
                    instagram: "lalinalena ",
                  ),
                  StarRating(), //GestureDetector
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPortraitContainer() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorite Celeb'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.pink[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const ContactImage(
              imageFile: AssetImage('images/lalinalena.jpg'),
              name: "Lalina",
            ),
            const ContactInfo(
              addrName: "Bangkok",
              addrInfo: "Thailand",
              phoneManager: "098-8245429",
              workInquiries: "Work inquiries",
              instagram: "lalinalena ",
            ),
            StarRating(),//GestureDetector
          ],
        ),
      ),
    );
  }
}

class StarRating extends StatefulWidget {
  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  List<bool> isSelected = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              isSelected[index] = !isSelected[index];
            });
          },
          child: Icon(
            Icons.star,
            color: isSelected[index] ? Colors.red : Colors.white,
          ),
        );
      }),
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
          radius: 150,
        ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.black45,
          ),
          child: Text(
            name,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                decoration: TextDecoration.none),
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
