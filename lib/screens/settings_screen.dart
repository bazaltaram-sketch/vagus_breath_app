import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الإعدادات'),
        backgroundColor: const Color(0xFF0D1117),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildSectionTitle('عن التطبيق'),
          _buildInfoTile('الإصدار', '1.0.0'),
          _buildInfoTile('اللغة', 'العربية'),
          const Divider(height: 40),
          _buildSectionTitle('المراجع العلمية'),
          _buildReferenceTile(
            'Zaccaro et al. (2018)',
            'How Breath-Control Can Change Your Life: A Systematic Review on Psycho-Physiological Correlates of Slow Breathing',
          ),
          _buildReferenceTile(
            'Ma et al. (2017)',
            'The Effect of Diaphragmatic Breathing on Attention, Negative Affect and Stress in Healthy Adults',
          ),
          _buildReferenceTile(
            'Laborde et al. (2017)',
            'Heart Rate Variability and Cardiac Vagal Tone in Psychophysiological Research',
          ),
          const Divider(height: 40),
          _buildSectionTitle('تنبيه طبي'),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.orange.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.orange.withOpacity(0.3)),
            ),
            child: Row(
              children: [
                Icon(Icons.warning, color: Colors.orange),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'هذا التطبيق ليس بديلاً عن الاستشارة الطبية. إذا كنت تعاني من أمراض قلبية أو تنفسية، استشر طبيبك قبل ممارسة تمارين التنفس.',
                    style: TextStyle(color: Colors.orange[200]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xFF4FC3F7),
        ),
      ),
    );
  }

  Widget _buildInfoTile(String title, String value) {
    return ListTile(
      title: Text(title),
      trailing: Text(value, style: TextStyle(color: Colors.grey[400])),
    );
  }

  Widget _buildReferenceTile(String authors, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF1E2430),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            authors,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF81C784),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }
}
