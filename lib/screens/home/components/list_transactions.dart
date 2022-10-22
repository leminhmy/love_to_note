import 'package:flutter/material.dart';
import 'package:your_money/screens/detail_item_transactions/detail_item_transactions.dart';
import 'package:your_money/screens/transactions/transactions_page.dart';

import '../../../widget/text_header1.dart';
import '../../../widget/text_header3.dart';
import '../../../widget/card_transactions.dart';

class ListTransactions extends StatelessWidget {
  const ListTransactions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
           Padding(
             padding: const EdgeInsets.all(20),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                TextHeader1(
                  text: "Transactions",
                ),
                TextHeader3(
                  text: "View All",
                )
              ],
          ),
           ),

          Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) => InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailItemTransactions()));
                  },
                    child: const CardTransactions()),
              )),
        ],
      ),
    );
  }
}
