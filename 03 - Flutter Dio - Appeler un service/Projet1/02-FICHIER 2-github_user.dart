class GitHubUser {
  final String login;
  final int id;
  final String avatarUrl;
  final String? name;
  final String? bio;
  final String? location;
  final String? email;
  final String? blog;
  final String? company;
  final int publicRepos;
  final int publicGists;
  final int followers;
  final int following;
  final DateTime createdAt;
  final DateTime updatedAt;

  GitHubUser({
    required this.login,
    required this.id,
    required this.avatarUrl,
    this.name,
    this.bio,
    this.location,
    this.email,
    this.blog,
    this.company,
    required this.publicRepos,
    required this.publicGists,
    required this.followers,
    required this.following,
    required this.createdAt,
    required this.updatedAt,
  });

  factory GitHubUser.fromJson(Map<String, dynamic> json) {
    return GitHubUser(
      login: json['login'] ?? '',
      id: json['id'] ?? 0,
      avatarUrl: json['avatar_url'] ?? '',
      name: json['name'],
      bio: json['bio'],
      location: json['location'],
      email: json['email'],
      blog: json['blog'],
      company: json['company'],
      publicRepos: json['public_repos'] ?? 0,
      publicGists: json['public_gists'] ?? 0,
      followers: json['followers'] ?? 0,
      following: json['following'] ?? 0,
      createdAt: DateTime.parse(json['created_at'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(json['updated_at'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'login': login,
      'id': id,
      'avatar_url': avatarUrl,
      'name': name,
      'bio': bio,
      'location': location,
      'email': email,
      'blog': blog,
      'company': company,
      'public_repos': publicRepos,
      'public_gists': publicGists,
      'followers': followers,
      'following': following,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
} 
