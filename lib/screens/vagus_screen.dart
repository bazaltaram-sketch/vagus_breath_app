import 'package:flutter/material.dart';

class VagusScreen extends StatelessWidget {
  const VagusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تحفيز العصب الحائر'),
        backgroundColor: const Color(0xFF0D1117),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildInfoCard(),
          const SizedBox(height: 20),
          _buildTechniqueCard(
            'غسل الوجه بالماء البارد',
            'تنبيه الغوص (Diving Reflex)',
            'اغسل وجهك بالماء البارد لمدة 15-30 ثانية. هذا يحفز العصب الحائر مباشرة ويبطئ معدل ضربات القلب فوراً.',
            Icons.water_drop,
            Colors.blue,
          ),
          _buildTechniqueCard(
            'تدليك الرقبة',
            'تدليك العصب المبهم',
            'دلّك جانبي الرقبة برفق من الأسفل إلى الأعلى لمدة دقيقتين. العصب الحائر يمر بالقرب من السطح هنا.',
            Icons.back_hand,
            Colors.orange,
          ),
          _buildTechniqueCard(
            'الغرغرة',
            'تنشيط عضلات الحلق',
            'غرغر بالماء لمدة 30 ثانية. العضلات المستخدمة في الغرغرة متصلة بالعصب الحائر.',
            Icons.mic,
            Colors.purple,
          ),
          _buildTechniqueCard(
            'الغناء أو الترنيم',
            'الاهتزاز الحنجري',
            'الغناء بصوت منخفض يهتز الحنجرة ويحفز العصب الحائر عبر العصب الحنجري المتفرع منه.',
            Icons.music_note,
            Colors.green,
          ),
          _buildTechniqueCard(
            'التأمل اليقظي',
            'Mindfulness Meditation',
            '10 دقائق من التأمل اليومي تزيد نشاط العصب الحائر وتقلل الالتهابات في الجسم.',
            Icons.self_improvement,
            Colors.teal,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF4A148C).withOpacity(0.3), Color(0xFF311B92).withOpacity(0.2)],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color(0xFFBA68C8).withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.psychology, color: Color(0xFFBA68C8), size: 28),
              SizedBox(width: 12),
              Text(
                'ما هو العصب الحائر؟',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFBA68C8),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            'العصب الحائر (Vagus Nerve) هو العصب العاشر من الأعصاب القحفية، ويمتد من الدماغ إلى القلب والرئتين والجهاز الهضمي. يُلقّب بـ "عصب الاسترخاء" لأنه يُفعّل وضع الراحة والهضم (Rest & Digest) ويُطفئ استجابة القتال أو الهروب (Fight or Flight).',
            style: TextStyle(fontSize: 15, height: 1.6),
          ),
        ],
      ),
    );
  }

  Widget _buildTechniqueCard(String title, String subtitle, String description, IconData icon, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Color(0xFF1E2430),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: ExpansionTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: Colors.grey[400],
            fontSize: 14,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Text(
              description,
              style: TextStyle(
                fontSize: 15,
                height: 1.6,
                color: Colors.grey[300],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
