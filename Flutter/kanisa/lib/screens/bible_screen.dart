import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:kanisa/widgets/app_drawer.dart';

class BibleController extends GetxController {
  var books = <dynamic>[].obs;
  var versions = <dynamic>[].obs;
  var languages = <String>[].obs;
  var selectedVersionId = 'de4e12af7f28f599-01'.obs; // Default to KJV
  var selectedLanguage = 'eng'.obs; // Default to English
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  final String apiKey = '4254c26b3773cd5f5ac8567a0868f944'; // Replace with your actual API key

  @override
  void onInit() {
    super.onInit();
    fetchBibleVersions();
  }

  Future<void> fetchBibleVersions() async {
    final url = Uri.parse('https://api.scripture.api.bible/v1/bibles');
    
    try {
      isLoading.value = true;
      errorMessage.value = '';
      
      final response = await http.get(
        url,
        headers: {'api-key': apiKey},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        versions.value = data['data'];
        languages.value = versions.map((v) => v['language']['id'] as String).toSet().toList();
        languages.sort();
        fetchBibleBooks();
      } else {
        throw Exception('Failed to load Bible versions');
      }
    } catch (e) {
      print('Error fetching Bible versions: $e');
      errorMessage.value = 'Failed to load Bible versions. Please try again.';
      isLoading.value = false;
    }
  }

  Future<void> fetchBibleBooks() async {
    final url = Uri.parse('https://api.scripture.api.bible/v1/bibles/${selectedVersionId.value}/books');
    
    try {
      isLoading.value = true;
      errorMessage.value = '';
      
      final response = await http.get(
        url,
        headers: {'api-key': apiKey},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        books.value = data['data'];
        isLoading.value = false;
      } else {
        throw Exception('Failed to load Bible books');
      }
    } catch (e) {
      print('Error fetching Bible books: $e');
      errorMessage.value = 'Failed to load Bible books. Please try again.';
      isLoading.value = false;
    }
  }

  void changeLanguage(String language) {
    selectedLanguage.value = language;
    selectedVersionId.value = versions.firstWhere((v) => v['language']['id'] == language)['id'];
    fetchBibleBooks();
  }

  void changeVersion(String versionId) {
    selectedVersionId.value = versionId;
    fetchBibleBooks();
  }
}

class BibleScreen extends StatelessWidget {
  const BibleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BibleController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Holy Bible'),
      ),
      drawer: AppDrawer(),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.errorMessage.value.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Error:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
                ),
                SizedBox(height: 8),
                Text(
                  controller.errorMessage.value,
                  style: TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => controller.fetchBibleVersions(),
                  child: Text('Retry'),
                ),
              ],
            ),
          );
        } else {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    DropdownButton<String>(
                      value: controller.selectedLanguage.value,
                      items: controller.languages.map((String language) {
                        return DropdownMenuItem<String>(
                          value: language,
                          child: Text(getLanguageName(language)),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          controller.changeLanguage(newValue);
                        }
                      },
                      isExpanded: true,
                    ),
                    SizedBox(height: 16),
                    DropdownButton<String>(
                      value: controller.selectedVersionId.value,
                      items: controller.versions
                          .where((v) => v['language']['id'] == controller.selectedLanguage.value)
                          .map<DropdownMenuItem<String>>((version) {
                        return DropdownMenuItem<String>(
                          value: version['id'],
                          child: Text(version['name']),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          controller.changeVersion(newValue);
                        }
                      },
                      isExpanded: true,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.books.length,
                  itemBuilder: (context, index) {
                    final book = controller.books[index];
                    return ListTile(
                      title: Text(book['name']),
                      onTap: () => Get.to(() => ChaptersScreen(book: book, versionId: controller.selectedVersionId.value)),
                    );
                  },
                ),
              ),
            ],
          );
        }
      }),
    );
  }

  String getLanguageName(String langCode) {
    switch (langCode) {
      case 'eng':
        return 'English';
      case 'swa':
        return 'Swahili';
      // Add more language codes and names as needed
      default:
        return langCode;
    }
  }
}

class ChaptersScreen extends StatelessWidget {
  final dynamic book;
  final String versionId;

  const ChaptersScreen({Key? key, required this.book, required this.versionId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book['name']),
        backgroundColor: Colors.blue.shade700,
      ),
      body: FutureBuilder(
        future: fetchChapters(book['id']),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<dynamic> chapters = snapshot.data as List<dynamic>;
            return ListView.builder(
              itemCount: chapters.length,
              itemBuilder: (context, index) {
                final chapter = chapters[index];
                return ListTile(
                  title: Text('Chapter ${chapter['number']}'),
                  onTap: () => Get.to(() => ChapterContentScreen(chapter: chapter, versionId: versionId)),
                );
              },
            );
          }
        },
      ),
    );
  }

  Future<List<dynamic>> fetchChapters(String bookId) async {
    final apiKey = '4254c26b3773cd5f5ac8567a0868f944'; // Replace with your actual API key
    final url = Uri.parse('https://api.scripture.api.bible/v1/bibles/$versionId/books/$bookId/chapters');
    
    final response = await http.get(
      url,
      headers: {'api-key': apiKey},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['data'];
    } else {
      throw Exception('Failed to load chapters');
    }
  }
}

class ChapterContentScreen extends StatefulWidget {
  final dynamic chapter;
  final String versionId;

  const ChapterContentScreen({Key? key, required this.chapter, required this.versionId}) : super(key: key);

  @override
  _ChapterContentScreenState createState() => _ChapterContentScreenState();
}

class _ChapterContentScreenState extends State<ChapterContentScreen> {
  List<Map<String, dynamic>> verses = [];
  bool isLoading = true;
  String errorMessage = '';
  Map<int, double> verseScales = {};
  int? zoomedVerseIndex;

  @override
  void initState() {
    super.initState();
    fetchChapterContent();
  }

  Future<void> fetchChapterContent() async {
    final apiKey = '4254c26b3773cd5f5ac8567a0868f944'; // Replace with your actual API key
    final url = Uri.parse('https://api.scripture.api.bible/v1/bibles/${widget.versionId}/chapters/${widget.chapter['id']}?content-type=text');
    
    try {
      final response = await http.get(
        url,
        headers: {'api-key': apiKey},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print('API Response: $data'); // Debug print

        if (data['data'] != null && data['data']['content'] != null) {
          String content = data['data']['content'];
          List<String> verseLines = content.split('\n');
          verses = verseLines.map((line) {
            List<String> parts = line.split(' ');
            String verseNumber = parts[0];
            String verseText = parts.sublist(1).join(' ');
            return {
              'number': verseNumber,
              'text': verseText,
            };
          }).where((verse) => verse['text']?.trim().isNotEmpty ?? false).toList(); // Filter out empty verses
        
          setState(() {
            isLoading = false;
          });
        } else {
          throw Exception('No content found in the response');
        }
      } else {
        throw Exception('Failed to load chapter content. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        isLoading = false;
        errorMessage = 'Failed to load chapter content. Error: $e';
      });
    }
  }

  void _handleDoubleTap(int index) {
    setState(() {
      if (zoomedVerseIndex == index) {
        zoomedVerseIndex = null;
        verseScales[index] = 1.0;
      } else {
        zoomedVerseIndex = index;
        verseScales[index] = 1.5;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chapter ${widget.chapter['number']}'),
        backgroundColor: Colors.blue.shade700,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(child: Text(errorMessage, style: TextStyle(color: Colors.red)))
              : ListView.builder(
                  itemCount: verses.length,
                  itemBuilder: (context, index) {
                    final verse = verses[index];
                    final isZoomed = zoomedVerseIndex == index;
                    final scale = verseScales[index] ?? 1.0;
                    
                    return GestureDetector(
                      onDoubleTap: () => _handleDoubleTap(index),
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        padding: EdgeInsets.all(16),
                        margin: EdgeInsets.symmetric(vertical: isZoomed ? 16 : 4, horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: isZoomed ? 10 : 5,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Transform.scale(
                          scale: scale,
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(fontSize: 16, color: Colors.black),
                              children: [
                                TextSpan(
                                  text: '${verse['number']} ',
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue.shade700),
                                ),
                                TextSpan(text: verse['text']),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
