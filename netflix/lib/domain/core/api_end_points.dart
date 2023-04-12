import 'package:netflix/core/strings.dart';
import '../../infrastructure/api_key.dart';

class ApiEndPoints {
  static const downloads = "$kBaseUrl/trending/all/day?api_key=$apiKey";
  static const Search = "$kBaseUrl/search/movie?api_key=$apiKey";
  static const HotAndNewMovie = "$kBaseUrl/discover/movie?api_key=$apiKey";  
  static const HotAndNewTv = "$kBaseUrl/discover/movie?api_key=$apiKey&page=3";  
  static const HomeTrending = "$kBaseUrl/discover/movie?api_key=$apiKey&page=7";    
  static const HomeTop10List = "$kBaseUrl/discover/movie?api_key=$apiKey&page=3"; 
  static const HomeTenseDrama = "$kBaseUrl/discover/movie?api_key=$apiKey&page=8";  
  static const HomeSouthIndian = "$kBaseUrl/discover/movie?api_key=$apiKey&page=6";
}