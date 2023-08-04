# Chat GPT Mobile App

App for Chat GPT, This project build with flutter and Dall-E 2 will be added.

Packages used in this project

* [provider](https://pub.dev/packages/provider)
* [json_serializable](https://pub.dev/packages/json_serializable)
* [hive](https://pub.dev/packages/hive)
* [dotenv](https://pub.dev/packages/dotenv)
* [dio](https://pub.dev/packages/dio)  
* [animated_text_kit](https://pub.dev/packages/animated_text_kit)  for Typing effect
---

### Before You Start
You have to create ```.env``` file into base of your project and give your [OpenAI API Key](https://platform.openai.com/account/api-keys) as ```BEARER = 'API_KEY'``` 

**OR**

Go to file [lib/config/constants/api_constants.dart](https://github.com/bmercan/ChatGPTClone/blob/main/lib/config/constants/api_constants.dart) then

Change this
 ```dart
import 'package:flutter_dotenv/flutter_dotenv.dart' show dotenv; // Remove this line

class APIConstants {
      //..
      static String authToken = 'Bearer ${dotenv.env['BEARER_TOKEN']}'
      //..
}
```
to this
 ```dart

class APIConstants {
      //..
      static String authToken = 'Bearer API_KEY'
      //..
}

``` 
---

### Hive
I used hive for save chat history. I firstly tried save history of messages as ```List<Message?>``` but because of limitation of Dart it was not possible to save generic list to ```Hive``` so i created a **Class** named **HiveChatModel** and saved it as is.
```dart
class HiveChatModel{
  String? title;
  DateTime? date;
  List<Message?>? chat;
}
```

Ability to load history messages and continue to chat then saved it again i used ```Hive.put()```
```dart
Hive.put(sesionName,messages)
```
when you load a chat, you also get ```sessionName```

```sessionName``` is generated as ```session_${lengthOfHiveHistoryList}``` 
 
---
## Screenshots
<img width="1744" alt="rmb" src="https://github.com/bmercan/ChatGPTClone/assets/78664137/0fed0969-b37f-46eb-a059-f95eb5a59630">
<img width="1301" alt="rml" src="https://github.com/bmercan/ChatGPTClone/assets/78664137/25c67a89-8cb8-4b67-a505-ec947c0a15b4">
