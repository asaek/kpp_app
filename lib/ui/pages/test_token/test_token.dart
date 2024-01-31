// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
import 'package:flutter/material.dart';
import 'package:twitter_oauth2_pkce/twitter_oauth2_pkce.dart';

class Example extends StatefulWidget {
  const Example({Key? key}) : super(key: key);

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  String? _accessToken;
  String? _refreshToken;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Access Token: $_accessToken'),
              Text('Refresh Token: $_refreshToken'),
              ElevatedButton(
                onPressed: () async {
                  final oauth2 = TwitterOAuth2Client(
                    clientId: 'eTNvMnBGRnhXU2k4R3VWRml3LXI6MTpjaQ',
                    clientSecret:
                        'hHs2lfWQYnZg0O_v5HiykHWmpXVobHSX2pCT6ByrtTYNSFw_a0',
                    redirectUri: 'org.example.android.oauth://callback/',
                    customUriScheme: 'org.example.android.oauth',
                  );
                  // ! Al parecer ahora es una mescla del login del usuario en twitter mas tu proyecto
                  // ! de twitter ahora sera de implementarlo junto a ver que sucede

                  OAuthResponse? response = await oauth2
                      .executeAuthCodeFlowWithPKCE(scopes: Scope.values);
                  print(response.accessToken);
                  print(response.refreshToken);

                  super.setState(() {
                    _accessToken = response.accessToken ?? 'Fallo';
                    _refreshToken = response.refreshToken ?? 'Fallo';
                  });
                },
                child: const Text('Push!'),
              )
            ],
          ),
        ),
      );
}
