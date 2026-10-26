class BreathingExercise {
  final String id;
  final String nameAr;
  final String nameEn;
  final String descriptionAr;
  final String scientificBasis;
  final int inhaleSeconds;
  final int holdSeconds;
  final int exhaleSeconds;
  final int cycles;
  final String color;

  const BreathingExercise({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.descriptionAr,
    required this.scientificBasis,
    required this.inhaleSeconds,
    required this.holdSeconds,
    required this.exhaleSeconds,
    required this.cycles,
    required this.color,
  });
}

final List<BreathingExercise> exercises = [
  BreathingExercise(
    id: 'coherent',
    nameAr: 'التنفس المتماسك',
    nameEn: 'Coherent Breathing',
    descriptionAr: '6 أنفاس في الدقيقة - المعدل المثالي لتحفيز العصب الحائر',
    scientificBasis: 'أثبتت الدراسات (Zaccaro et al., 2018) أن التنفس بمعدل 5.5-6 نفَس/دقيقة يزيد تفعيل العصب الحائر ويحسن تقلب معدل ضربات القلب (HRV) بشكل كبير.',
    inhaleSeconds: 5,
    holdSeconds: 0,
    exhaleSeconds: 5,
    cycles: 30,
    color: '#4FC3F7',
  ),
  BreathingExercise(
    id: '478',
    nameAr: 'تنفس 4-7-8',
    nameEn: '4-7-8 Breathing',
    descriptionAr: 'تنفس عميق مع حبس طويل - للاسترخاء العميق والنوم',
    scientificBasis: 'طوّرها Dr. Andrew Weil. الحبس الطويل (7 ثوان) يزيد ضغط ثاني أكسيد الكربون مما يحفز استجابة الاسترخاء في الجهاز العصبي الباراسمبثاوي عبر العصب الحائر.',
    inhaleSeconds: 4,
    holdSeconds: 7,
    exhaleSeconds: 8,
    cycles: 8,
    color: '#81C784',
  ),
  BreathingExercise(
    id: 'box',
    nameAr: 'تنفس الصندوق',
    nameEn: 'Box Breathing',
    descriptionAr: 'تنفس متوازن للتركيز والهدوء - يستخدمه البحرية الأمريكية',
    scientificBasis: 'تقنية Navy SEALs. التوازن بين الشهيق والحبس والزفير ينظم الجهاز العصبي الذاتي ويحسن التحمل العقلي تحت الضغط.',
    inhaleSeconds: 4,
    holdSeconds: 4,
    exhaleSeconds: 4,
    cycles: 16,
    color: '#FFB74D',
  ),
  BreathingExercise(
    id: 'vagus',
    nameAr: 'تنفس العصب الحائر المباشر',
    nameEn: 'Direct Vagus Breathing',
    descriptionAr: 'شهيق قصير + زفير طويل جداً - أقوى تحفيز للعصب الحائر',
    scientificBasis: 'الزفير الطويل (8+ ثوان) يزيد الضغط داخل الصدر ويحفز النهايات العصبية للعصب الحائر في القفص الصدري. أثبتت دراسة Ma et al. (2017) فعاليته في تقليل القلق.',
    inhaleSeconds: 4,
    holdSeconds: 0,
    exhaleSeconds: 10,
    cycles: 12,
    color: '#BA68C8',
  ),
];
