# fluttersteem

[![Pub](https://img.shields.io/pub/v/fluttersteem.svg)](https://pub.dartlang.org/packages/fluttersteem)

A Flutter/Dart Steem client library. This library includes support for authentication (SteemConnect V2) as well as Broadcasting (vote, comment, follow ++) and data retrieval (get followers, posts by users, users ++).

* [Installation and Usage](#installation-and-usage)
* [Authentication](#authentication)
    * [Via Access Token](#via-access-token)
    * [`InstagramApiAuth`](#instagramapiauth)
    * [Implicit Auth](#implicit-auth)
    * [Explicit Auth](#explicit-auth)
* [Constants](#constants)

# Authentication
## Via Access Token
If you already have an access token, you can authenticate a client.

*Note: The `user` property of the `SteemClient` will be `null`.*

```dart
var client = SteemApiAuth.authorizeViaAccessToken('<access-token>');
var me = await client.users.self.get();
```

## SteemApiAuth
To perform authentication, use the `SteemApiAuth` class. All API scopes are
included as `SteemApiScope` constants for convenience.

```dart
var auth = new SteemApiAuth('<client-id>', '<client-secret>',
  redirectUri: Uri.parse('<redirect-uri>'),
  scopes: [
    SteemApiScope.basic,
    SteemApiScope.publicContent,
    // ...
  ]
);
```

## Implicit Auth
Applications with no server-side component can implement
[implicit auth](https://www.instagram.com/developer/authentication/).

To get a redirect URI:

```dart
var redirectUri = auth.getImplicitRedirectUri();
window.location.href = redirectUri.toString();
```

After you have obtained an access token, use it to receive a `SteemClient`.

# Endpoints
The `SteemClient` contains several getters that correspond to endpoints. Each is an abstraction over
a specific Steem API.