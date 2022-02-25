import 'package:bankapp/app/modules/widgets/custom_action_card.dart';
import 'package:bankapp/app/modules/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: height * 0.08),
          Padding(
            padding: EdgeInsets.only(left: height * 0.02),
            child: IconButton(
              icon: Icon(
                AntDesign.user,
                color: Colors.black,
                size: height * 0.045,
              ),
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context, '/login', (route) => false),
            ),
          ),
          SizedBox(height: height * 0.03), // height * 0.03
          Container(
            margin: EdgeInsets.only(left: height * 0.035, right: height * 0.03),
            child: Text(
              'Bom dia,\nLuiz',
              style: TextStyle(
                fontSize: MediaQuery.of(context).textScaleFactor * 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: height * 0.1),
          Container(
            margin: EdgeInsets.only(left: height * 0.03, right: height * 0.03),
            child: const CustomListTile(
              title: 'Saldo em Conta',
              subtitle: 'R\$ 2.248,55',
              key: Key('saldoTile'),
            ),
          ),
          SizedBox(height: height * 0.02),
          Container(
            margin: EdgeInsets.only(left: height * 0.03, right: height * 0.03),
            child: const CustomListTile(
              title: 'Para pagar',
              subtitle: 'R\$ 869,50',
              key: Key('toPayTile'),
            ),
          ),
          SizedBox(height: height * 0.11),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: height * 0.05),
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  ActionCard(
                    icon: Icons.payment,
                    text: 'Meus\nCartões',
                    onTap: () => Navigator.pushNamed(context, '/cards'),
                  ),
                  ActionCard(
                    icon: MaterialCommunityIcons.ethereum,
                    text: 'Cripto\nStore',
                    onTap: () => Navigator.pushNamed(context, '/cripto'),
                  ),
                  ActionCard(
                    icon: Icons.receipt,
                    text: 'Consultar\nExtrato',
                    onTap: () => Navigator.pushNamed(context, '/teste'),
                  ),
                  ActionCard(
                    icon: MaterialCommunityIcons.currency_usd,
                    text: 'Depositar\ndinheiro aqui',
                    onTap: () => Navigator.pushNamed(context, '/deposit'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
