import 'package:flutter/material.dart';

class FeedsWidget extends StatelessWidget {
  const FeedsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage('lib/assets/image/profile6.jpg'),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              'Fadli Raka Jammaludin',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              overflow:
                                  TextOverflow.ellipsis, // Prevent overflow
                            ),
                          ),
                          SizedBox(width: 10),
                          Flexible(
                            child: Text(
                              '| PT Pakaian Jakarta',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black54),
                              overflow:
                                  TextOverflow.ellipsis, // Prevent overflow
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '42m Ago',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Colors.black54),
                      )
                    ],
                  ),
                ),
                Icon(Icons.more_vert),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Slmt malam Bapak/ibu, Saat ini saya terbuka untuk supplier bidang fabrikasi tekstil area bandung dn skitar. Kami mncari supplier kain magnolia yg mnrima pmbayaran tempo (1 bln dri tgl kontrak efektif), kami jg memiliki krite...  (More)',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset('lib/assets/image/postimg1.png'),
                Image.asset('lib/assets/image/postimg2.png'),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.favorite_border),
                    SizedBox(
                      width: 10,
                    ),
                    Text('244'),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.comment_outlined),
                    SizedBox(
                      width: 10,
                    ),
                    Text('156'),
                  ],
                ),
                Icon(Icons.share)
              ],
            )
          ],
        ),
      ),
    );
  }
}
