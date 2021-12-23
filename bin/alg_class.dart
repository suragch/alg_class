import 'package:alg_class/bubble_sort.dart';

void main() {
  final lowerCaseText = text.toLowerCase();
  final map = makeTextIntoMap(lowerCaseText);
  final list = convertMapToList(map);
  sortList(list);
  //print(list);

  // final userInput = [10, 14, 3, 7, 21, 6, 18, 4, 6, 2];
  final userInput = [18, 8, 17, 7];
  final suggestedWord = findWordsForCode(userInput, list);
  print(suggestedWord); // such
}

List<String> findWordsForCode(List<int> userInput, List<Word> wordList) {
  final results = <String>[];
  for (final word in wordList) {
    if (equal(word.swipeCode, userInput)) {
      results.add(word.word);
    }
  }
  return results;
}

bool equal(List<int> listA, List<int> listB) {
  if (listA.length != listB.length) {
    return false;
  }
  for (var i = 0; i < listA.length; i++) {
    if (listA[i] != listB[i]) {
      return false;
    }
  }
  return true;
}

// bool fuzzyEqual(List<int> listA, List<int> listB) {

// }

Map<String, int> makeTextIntoMap(String myText) {
  final wordCountList = <String, int>{};
  final word = <int>[];
  for (final codeUnit in myText.codeUnits) {
    if (isLetter(codeUnit)) {
      word.add(codeUnit);
    } else if (word.isNotEmpty) {
      final wordString = String.fromCharCodes(word);
      final oldCount = wordCountList[wordString] ?? 0;
      wordCountList[wordString] = oldCount + 1;
      word.clear();
    }
  }
  return wordCountList;
}

List<Word> convertMapToList(Map<String, int> wordMap) {
  final wordList = <Word>[];
  wordMap.forEach((word, frequency) {
    final code = generateCode(word);
    final newWord = Word(word, frequency, code);
    wordList.add(newWord);
  });
  return wordList;
}

List<int> generateCode(String word) {
  // FIXME: only give one code for double letters
  // look -> [18, 8, 17]
  final codeList = <int>[];
  var oldLetter = '';
  for (final charCode in word.codeUnits) {
    final letter = String.fromCharCode(charCode);
    if (oldLetter == letter) {
      continue;
    }
    oldLetter = letter;
    final code = codeMap[letter];
    if (code == null) throw Exception('Your word has a non-letter value!');
    codeList.add(code);
  }
  return codeList;
}

final codeMap = {
  'q': 0,
  'w': 1,
  'e': 2,
  'r': 3,
  't': 4,
  'y': 5,
  'u': 6,
  'i': 7,
  'o': 8,
  'p': 9,
  'a': 10,
  's': 11,
  'd': 12,
  'f': 13,
  'g': 14,
  'h': 15,
  'j': 16,
  'k': 17,
  'l': 18,
  'z': 19,
  'x': 20,
  'c': 21,
  'v': 22,
  'b': 23,
  'n': 24,
  'm': 25,
};

void sortList(List<Word> words) {
  bubbleSort(words);
}

class Word extends Comparable<Word> {
  Word(this.word, this.frequency, this.swipeCode);
  final String word;
  final int frequency;
  final List<int> swipeCode;

  @override
  String toString() => '$word $frequency $swipeCode';

  @override
  int compareTo(Word other) {
    if (frequency > other.frequency) return 1;
    if (frequency == other.frequency) return 0;
    return -1;
  }
}

bool isLetter(int codeUnit) {
  return isUppercase(codeUnit) || isLowercase(codeUnit);
}

bool isUppercase(int codeUnit) {
  return codeUnit >= 65 && codeUnit <= 90;
}

bool isLowercase(int codeUnit) {
  return codeUnit >= 97 && codeUnit <= 122;
}

// https://en.wikipedia.org/wiki/Mongolia
final text = '''
lookkkkkkiing loki looki
Neolithic Neolithic agricultural agric agr settlements (c. 5500–3500 BC), such as those at 
Norovlin, Tamsagbulag, Bayanzag, and Rashaan Khad, predated the introduction of 
horse-riding nomadism, a pivotal event in the history of Mongolia which became 
the dominant culture. Horse-riding nomadism has been documented by 
archeological evidence in Mongolia during the Copper and Bronze Age Afanasevo 
culture (3500–2500 BC); this culture was active to the Khangai Mountains in 
Central Mongolia. The wheeled vehicles found in the burials of the Afanasevans 
have been dated to before 2200 BC.[24] Pastoral nomadism and metalworking 
became more developed with the later Okunev culture (2nd millennium BC), 
Andronovo culture (2300–1000 BC) and Karasuk culture (1500–300 BC), culminating 
with the Iron Age Xiongnu Empire in 209 BC. Monuments of the pre-Xiongnu Bronze 
Age include deer stones, keregsur kurgans, square slab tombs, and rock 
paintings. look look

Although cultivation of crops has continued since the Neolithic, agriculture 
has always remained small in scale compared to pastoral nomadism. Agriculture 
may have first been introduced from the west or arose independently in the 
region. The population during the Copper Age has been described as mongoloid 
in the east of what is now Mongolia, and as europoid in the west.[23] 
Tocharians (Yuezhi) and Scythians inhabited western Mongolia during the 
Bronze Age. The mummy of a Scythian warrior, which is believed to be about 
2,500 years old, was a 30- to 40-year-old man with blond hair; it was found 
in the Altai, Mongolia.[25] As equine nomadism was introduced into Mongolia, 
the political center of the Eurasian Steppe also shifted to Mongolia, where it 
remained until the 18th century CE. The intrusions of northern pastoralists 
(e.g. the Guifang, Shanrong, and Donghu) into China during the Shang dynasty 
(1600–1046 BC) and Zhou dynasty (1046–256 BC) presaged the age of nomadic 
empires.

The concept of Mongolia as an independent power north of China is expressed in 
a letter sent by Emperor Wen of Han to Laoshang Chanyu in 162 BC (recorded in 
the Hanshu):

The Emperor of China respectfully salutes the great Shan Yu (Chanyu) of the 
Hsiung-nu (Xiongnu)...When my imperial predecessor erected the Great Wall, all 
the bowmen nations on the north were subject to the Shan Yu; while the residents 
inside the wall, who wore the cap and sash, were all under our government: and 
the myriads of the people, by following their occupations, ploughing and 
weaving, shooting and hunting, were able to provide themselves with food and 
clothing...Your letter says:--"The two nations being now at peace, and the two 
princes living in harmony, military operations may cease, the troops may send 
their horses to graze, and prosperity and happiness prevail from age to age, 
commencing, a new era of contentment and peace." That is extremely gratifying 
to me...Should I, in concert with the Shan Yu, follow this course, complying 
with the will of heaven, then compassion for the people will be transmitted 
from age to age, and extended to unending generations, while the universe will 
be moved with admiration, and the influence will be felt by neighbouring 
kingdoms inimical to the Chinese or the Hsiung-nu...As the Hsiung-nu live in 
the northern regions, where the cold piercing atmosphere comes at an early 
period, I have ordered the proper authorities to transmit yearly to the Shan 
Yu, a certain amount of grain, gold, silks of the finer and coarser kinds, and 
other objects. Now peace prevails all over the world; the myriads of the 
population are living in harmony, and I and the Shan Yu alone are the parents 
of the people...After the conclusion of the treaty of peace throughout the 
world, take notice, the Han will not be the first to transgress.[26]


7th-century artifacts found 180 km (112 mi) from Ulaanbaatar.
Since prehistoric times, Mongolia has been inhabited by nomads who, from time
to time, formed great confederations that rose to power and prominence. Common
institutions were the office of the Khan, the Kurultai (Supreme Council), left
and right wings, imperial army (Keshig) and the decimal military system. The 
first of these empires, the Xiongnu of undetermined ethnicity, were brought 
together by Modu Shanyu to form a confederation in 209 BC. Soon they emerged 
as the greatest threat to the Qin Dynasty, forcing the latter to construct 
the Great Wall of China. It was guarded by up to almost 300,000 soldiers 
during Marshal Meng Tian's tenure, as a means of defense against the 
destructive Xiongnu raids. The vast Xiongnu empire (209 BC–93 AD) was 
followed by the Mongolic Xianbei empire (93–234 AD), which also ruled more 
than the entirety of present-day Mongolia. The Mongolic Rouran Khaganate 
(330–555), of Xianbei provenance was the first to use "Khagan" as an imperial 
title. It ruled a massive empire before being defeated by the Göktürks 
(555–745) whose empire was even bigger.

The Göktürks laid siege to Panticapaeum, present-day Kerch, in 576. They were 
succeeded by the Uyghur Khaganate (745–840) who were defeated by the Kyrgyz. 
The Mongolic Khitans, descendants of the Xianbei, ruled Mongolia during the 
Liao Dynasty (907–1125), after which the Khamag Mongol (1125–1206) rose to 
prominence.

Lines 3–5 of the memorial inscription of Bilge Khagan (684–737) in central
 Mongolia summarizes the time of the Khagans:

In battles they subdued the nations of all four sides of the world and 
suppressed them. They made those who had heads bow their heads, and who had 
knees genuflect them. In the east up to the Kadyrkhan common people, in the 
west up to the Iron Gate they conquered... These Khagans were wise. These 
Khagans were great. Their servants were wise and great too. Officials were honest and direct with people. They ruled the nation this way. This way they held sway over them. When they died ambassadors from Bokuli Cholug (Baekje Korea), Tabgach (Tang China), Tibet (Tibetan Empire), Avar (Avar Khaganate), Rome (Byzantine Empire), Kirgiz, Uch-Kurykan, Otuz-Tatars, Khitans, Tatabis came to the funerals. So many people came to mourn over the great Khagans. They were famous Khagans.[27]
''';
