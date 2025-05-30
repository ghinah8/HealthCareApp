import 'package:get/get.dart';
import 'package:healthcare/core/const_data/app_image.dart';

class ArticleController extends GetxController {
  var articles = <ArticleModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadArticles(); // لما يشتغل الكنترولر، نجيب الداتا
  }

  void loadArticles() {
    articles.value = [
      ArticleModel(
        image: AppImage.artical1,
        content: '''
Fruits are nature’s powerhouse—bursting with essential vitamins, minerals, antioxidants, and fiber. Whether you’re looking to boost your immune system, support digestion, or simply enjoy a refreshing snack, these 25 fruits deserve a spot in your diet. Let’s dive into their health benefits!

🍇 Blueberries - Packed with antioxidants, they fight inflammation and support brain health.

🍏 Apples - Rich in fiber and vitamin C, they promote heart health and digestion.

🍊 Oranges - A fantastic source of vitamin C, oranges boost immunity and skin health.

🍌 Bananas - High in potassium, they help maintain healthy blood pressure and provide energy.

🍓 Strawberries - Loaded with vitamin C and antioxidants, great for heart health and skin vitality.

🥑 Avocados - Full of healthy fats, supporting brain and heart function.

🥝 Kiwi - High in vitamin C and fiber, excellent for digestion.

🍉 Watermelon - Hydrating and rich in lycopene, which protects against heart disease.

🍍 Pineapple - Contains bromelain, an enzyme that aids digestion and reduces inflammation.

🥭 Mango - High in vitamins A and C, supports eye health and boosts immunity.

🍇 Grapes - Red and purple varieties contain resveratrol, linked to improved heart health.

🍎 Pomegranates - Packed with antioxidants, great for reducing inflammation.

🥭 Papaya - Contains digestive enzymes and vitamin C, promoting gut health.

🍇 Blackberries - Rich in fiber, helps digestion and brain health.

🍓 Raspberries - High in antioxidants and fiber, supporting heart health.

🍒 Cherries - Anti-inflammatory compounds help with muscle recovery and pain relief.

🐉 Dragon Fruit - Rich in fiber and vitamin C, supports digestion and immunity.

🍒 Cranberries - Known for improving urinary tract health and fighting infections.

🍐 Guava - Loaded with vitamin C and fiber, supports digestion and immunity.

🍑 Figs - High in antioxidants and fiber, regulates blood sugar and gut health.

🍊 Persimmons - Rich in vitamin A and antioxidants, great for eye health.

🍈 Lychee - Contains vitamin C and polyphenols, supporting skin health.

🍍 Passion Fruit - High in fiber and vitamins, aiding digestion.

🌴 Dates - Full of natural sugars and fiber, providing energy and supporting digestion.

🥥 Coconut - Rich in healthy fats and electrolytes, promotes hydration
''',
        date: '2025-05-30',
        title: '''The 25 Healthiest Fruits You
Can Eat''',
      ),
      ArticleModel(
        image: AppImage.artical2,
        content:
            '''The COVID-19 pandemic has brought unprecedented challenges to health care systems around the world. Beyond the immediate toll of the virus itself, it exposed weaknesses, accelerated changes, and redefined the future of health care delivery.

1. Strain on Health Systems
Hospitals and clinics were quickly overwhelmed as COVID-19 cases surged. Intensive care units reached capacity, and many health care workers were pushed to their limits. The strain highlighted the need for stronger emergency preparedness and better resource allocation. In many regions, non-emergency procedures were postponed, affecting patients with other serious conditions such as cancer or heart disease.

2. The Rise of Telemedicine
With physical distancing measures in place, telemedicine emerged as a vital solution. Video consultations, remote monitoring, and digital prescriptions became the new norm. This shift made health care more accessible for many, especially those in remote areas or with limited mobility. While not a complete replacement for in-person care, telehealth is expected to remain a key component of health care delivery moving forward.

3. Mental Health Crisis
The pandemic also triggered a surge in mental health issues. Isolation, fear of illness, economic uncertainty, and grief affected millions. Health systems around the world saw a rise in depression, anxiety, and substance use disorders. In response, mental health services began to receive more attention, funding, and integration into primary care.

4. Innovation and Rapid Response
Despite the challenges, COVID-19 spurred innovation. Vaccine development was accelerated to record-breaking speeds. Digital tools were adopted faster than ever. Health care workers adapted quickly, showing resilience and creativity in how they delivered care under pressure.

5. Long-Term Changes and Lessons
Perhaps the most lasting impact is the awareness that global health threats require global cooperation. Investments in public health infrastructure, technology, and workforce well-being are now seen as essential. The pandemic also emphasized the importance of health equity, as vulnerable communities were disproportionately affected.

Conclusion
The COVID-19 pandemic reshaped the landscape of health care. It tested the strength of systems, revealed gaps, and sparked innovation. As the world continues to recover, the lessons learned must guide future policies and practices — building a more resilient, inclusive, and technology-driven health care system for all. ''',
        date: '2025-05-29',
        title: '''The Impact of COVID-19 on
 Healthcare''',
      ),
      ArticleModel(
        image: AppImage.artical4,
        content:
            '''In recent years, peptide therapy has emerged as a cutting-edge treatment attracting attention across the medical world. But what exactly are peptides, and why are so many researchers calling them the future of medicine?

What Are Peptides?
Peptides are short chains of amino acids—the building blocks of proteins. Naturally found in the body, they play crucial roles in regulating biological functions such as hormone production, immune response, tissue repair, and more. Because they are naturally occurring, peptide therapies are often well-tolerated with minimal side effects.

How Does Peptide Therapy Work?
Peptide therapy involves using specific peptides to target and improve various physiological functions. These peptides can be synthesized in labs to mimic or enhance natural peptides in the body. Once administered, they bind to receptors on cells, triggering specific responses—such as promoting healing, boosting metabolism, or modulating inflammation.

Key Benefits of Peptide Therapy
Anti-aging and Skin Health: Some peptides stimulate collagen production, improving skin elasticity and reducing wrinkles.

Muscle Growth and Recovery: Athletes and patients recovering from injuries often use peptides to enhance muscle regeneration and repair.

Weight Loss and Metabolism: Certain peptides help regulate appetite and increase fat-burning.

Cognitive Function: Some peptides support brain health, memory, and focus.

Immune System Support: Peptides can boost immunity and reduce inflammation.

Why Peptide Therapy Stands Out
Unlike traditional medications, peptides are highly targeted, meaning they act specifically where needed without affecting the rest of the body. This makes them more precise and often safer than synthetic drugs. Additionally, ongoing research is unlocking hundreds of new therapeutic peptides that could treat conditions ranging from chronic pain to autoimmune diseases.

Challenges and Considerations
While promising, peptide therapy is still a developing field. Not all peptides are approved by regulatory bodies, and access to quality-controlled treatments can be limited in some areas. Additionally, dosage, delivery methods, and long-term effects still require more research.

Conclusion
Peptide therapy represents a powerful and innovative direction in modern medicine. With its potential to treat a wide range of conditions naturally and effectively, it’s no surprise that experts see it as a future cornerstone of personalized health care. As science continues to advance, peptides may well transform how we prevent, manage, and heal disease.

 ''',
        date: '2025-05-29',
        title: '''Peptide Therapy: The Future
 of Medicine?''',
      ),
    ];
  }
}

class ArticleModel {
  final String image;
  final String content;
  final String date;
  final String title;

  ArticleModel({
    required this.image,
    required this.content,
    required this.date,
    required this.title,
  });
}
