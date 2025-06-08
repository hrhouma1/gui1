
import 'package:dio/dio.dart';
import '../models/github_user.dart';

class GitHubService {
  final Dio _dio;
  static const String _baseUrl = 'https://api.github.com';

  GitHubService() : _dio = Dio() {
    _dio.options.baseUrl = _baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 5);
    _dio.options.receiveTimeout = const Duration(seconds: 3);
    
    // Ajouter des intercepteurs pour le logging (optionnel)
    _dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (obj) => print(obj),
      ),
    );
  }

  /// Récupère les informations d'un utilisateur GitHub
  /// Une requête par utilisateur comme spécifié
  Future<GitHubUser> getUserInfo(String username) async {
    try {
      final response = await _dio.get('/users/$username');
      
      if (response.statusCode == 200) {
        return GitHubUser.fromJson(response.data);
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: 'Erreur lors de la récupération des informations utilisateur',
        );
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        throw Exception('Utilisateur "$username" non trouvé');
      } else if (e.response?.statusCode == 403) {
        throw Exception('Limite de taux d\'API atteinte. Veuillez réessayer plus tard.');
      } else {
        throw Exception('Erreur réseau: ${e.message}');
      }
    } catch (e) {
      throw Exception('Erreur inattendue: $e');
    }
  }

  /// Récupère les informations de plusieurs utilisateurs
  /// Une requête indépendante par utilisateur
  Future<List<GitHubUser>> getMultipleUsers(List<String> usernames) async {
    List<GitHubUser> users = [];
    
    // Exécuter une requête par utilisateur comme spécifié
    for (String username in usernames) {
      try {
        final user = await getUserInfo(username);
        users.add(user);
      } catch (e) {
        print('Erreur pour l\'utilisateur $username: $e');
        // Continuer avec les autres utilisateurs même si une requête échoue
      }
    }
    
    return users;
  }

  void dispose() {
    _dio.close();
  }
} 
