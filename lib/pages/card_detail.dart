import 'package:flutter/material.dart';
import 'package:meu_app/model/card_detail.dart';

class CardDetailPage extends StatelessWidget {
  final CardDetail cardDetail;
  const CardDetailPage({super.key, required this.cardDetail});
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: cardDetail.id,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(),
          body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.close)),
                    Row(
                      children: [
                        Image.network(
                          cardDetail.url,
                          height: 100,
                          width: 100,
                        ),
                      ],
                    ),
                    Expanded(
                      child: Text(cardDetail.title,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(cardDetail.text,
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.justify),
                    // Container(
                    //     alignment: Alignment.centerRight,
                    //     width: double.infinity,
                    //     child: TextButton(
                    //         onPressed: () {},
                    //         child: Text("Ler Mais",
                    //             style: TextStyle(
                    //               decoration: TextDecoration.overline,
                    //             ))))
                  ])),
        ),
      ),
    );
  }
}
