import 'package:chat_bot/core/constants/api_constants.dart';
import 'package:dio/dio.dart';

class TextModelClient {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: ApiConstants.baseUrl,
    headers: {
      'Authorization': 'Bearer ${ApiConstants.apiKey}',
      'Content-Type': 'application/json',
    },
  ));

  Future<String> sendMessage(String message,{String model = "gpt-4o-mini"}) async {
    final response = await _dio.post('/chat/completions', data: {
      "model": model,
      "messages": [
        {"role": "user", "content": message}
      ],

    },

    );

    return response.data['choices'][0]['message']['content'];
  }
}
