import 'package:bankapp/app/core/exports.dart';
import 'package:bankapp/app/shared/repositories/auth_repository.dart';

import 'dart:developer' as dev;

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
              onPressed: () async {
                await GetIt.I<AuthRepository>().signOut();
                Navigator.pushReplacementNamed(context, '/login');
              },
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
            child: CustomListTile(
              title: 'Saldo em Conta',
              subtitle: 'R\$ 2.248,55',
              key: const Key('saldoTile'),
              onPressedFunction: () {
                final currentUser = GetIt.I<AuthRepository>().authUser;
                dev.log(currentUser.toString());
              },
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
                    onTap: () => Navigator.pushNamed(context, '/extract'),
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
