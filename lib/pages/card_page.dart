import 'package:flutter/material.dart';
import 'package:meu_app/model/card_detail.dart';
import 'package:meu_app/pages/card_detail.dart';
import 'package:meu_app/repositories/card_detail_repository.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  CardDetail? cardDetail;
  CardDetailRepository cardDetailRepository = CardDetailRepository();

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    try {
      cardDetail = await cardDetailRepository.get();
    } catch (e) {
      print("Erro ao carregar card: $e");
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              width: double.infinity,
              child: cardDetail == null
                  ? Center(child: LinearProgressIndicator())
                  : InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CardDetailPage(
                              cardDetail: cardDetail!,
                            ),
                          ),
                        );
                      },
                      child: Hero(
                        tag: "card_${cardDetail!.id}",
                        child: Card(
                          elevation: 8,
                          shadowColor: Color.fromARGB(255, 21, 52, 71),
                          color: Color.fromARGB(255, 21, 52, 71),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Image.network(
                                      cardDetail!.url,
                                      height: 48,
                                      width: 48,
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Text(
                                        cardDetail!.title,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  cardDetail!.text,
                                  style: TextStyle(fontSize: 16),
                                  textAlign: TextAlign.justify,
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) =>
                                              CardDetailPage(cardDetail: cardDetail!),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "Ler Mais",
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
