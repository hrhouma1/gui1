
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/github_user.dart';

class UserDetailScreen extends StatelessWidget {
  final GitHubUser user;

  const UserDetailScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('@${user.login}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () => _shareProfile(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileHeader(),
            const SizedBox(height: 24),
            _buildStatistics(),
            const SizedBox(height: 24),
            _buildPersonalInfo(),
            const SizedBox(height: 24),
            _buildAccountInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(user.avatarUrl),
              radius: 50,
            ),
            const SizedBox(height: 16),
            Text(
              user.name ?? user.login,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '@${user.login}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            if (user.bio != null) ...[
              const SizedBox(height: 12),
              Text(
                user.bio!,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildStatistics() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Statistiques',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildStatItem(
                    Icons.people,
                    'Followers',
                    user.followers.toString(),
                    Colors.blue,
                  ),
                ),
                Expanded(
                  child: _buildStatItem(
                    Icons.person_add,
                    'Following',
                    user.following.toString(),
                    Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildStatItem(
                    Icons.folder,
                    'Repos publics',
                    user.publicRepos.toString(),
                    Colors.orange,
                  ),
                ),
                Expanded(
                  child: _buildStatItem(
                    Icons.code,
                    'Gists publics',
                    user.publicGists.toString(),
                    Colors.purple,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildPersonalInfo() {
    final List<MapEntry<String, String?>> personalInfo = [
      if (user.company != null) 
        MapEntry('Entreprise', user.company),
      if (user.location != null) 
        MapEntry('Localisation', user.location),
      if (user.email != null) 
        MapEntry('Email', user.email),
      if (user.blog != null && user.blog!.isNotEmpty) 
        MapEntry('Site web', user.blog),
    ];

    if (personalInfo.isEmpty) return const SizedBox.shrink();

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Informations personnelles',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ...personalInfo.map((info) => _buildInfoRow(
              _getIconForInfo(info.key),
              info.key,
              info.value!,
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountInfo() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Informations du compte',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildInfoRow(
              Icons.fingerprint,
              'ID utilisateur',
              user.id.toString(),
            ),
            _buildInfoRow(
              Icons.calendar_today,
              'Membre depuis',
              _formatDate(user.createdAt),
            ),
            _buildInfoRow(
              Icons.update,
              'Dernière mise à jour',
              _formatDate(user.updatedAt),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey[600]),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.copy, size: 16),
            onPressed: () => _copyToClipboard(value),
            tooltip: 'Copier',
          ),
        ],
      ),
    );
  }

  IconData _getIconForInfo(String key) {
    switch (key) {
      case 'Entreprise':
        return Icons.business;
      case 'Localisation':
        return Icons.location_on;
      case 'Email':
        return Icons.email;
      case 'Site web':
        return Icons.language;
      default:
        return Icons.info;
    }
  }

  String _formatDate(DateTime date) {
    final months = [
      'janvier', 'février', 'mars', 'avril', 'mai', 'juin',
      'juillet', 'août', 'septembre', 'octobre', 'novembre', 'décembre'
    ];
    
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }

  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
  }

  void _shareProfile(BuildContext context) {
    final profileUrl = 'https://github.com/${user.login}';
    Clipboard.setData(ClipboardData(text: profileUrl));
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Lien du profil copié: $profileUrl'),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {},
        ),
      ),
    );
  }
} 
