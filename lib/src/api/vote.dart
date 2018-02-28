import 'dart:async';
import '../models/models.dart';

/// An abstraction to extract vote information from Steem
/// https://v2.steemconnect.com/docs/steemjs#api/
abstract class SteemVotesApi {
  /// An abstraction to extract vote information from a single Steem post
  /// https://api.steemjs.com/get_active_votes?author=VALUE&permlink=VALUE
  SteemVotesApiPost forPost(String author, String permlink);
}

/// An abstraction to extract vote information from a single Steem post
abstract class SteemVotesApiPost {
  /// Get a list of users who have liked a post
  /// https://api.steemjs.com/get_active_votes?author=USER&permlink=PERM
  Future<List<ActiveVote>> getVoters(String author, String permlink);

  /// Upvote the post by the currently authenticated user
  ///
  /// A weight of 10000 equals 100%
  ///
  /// https://steemconnect.com/sign/vote?voter=value&author=value&permlink=value&weight=value
  Future<bool> upvote();

  /// Remove an upvote on the post by the currently authenticated user
  Future<bool> unvote();
}