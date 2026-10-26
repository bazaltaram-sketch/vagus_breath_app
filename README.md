# تطبيق تنفس العصب الحائر (Vagus Breath)

تطبيق Flutter لتمارين التنفس العلمية لتحفيز العصب الحائر (Vagus Nerve) وتقليل التوتر والقلق.

## المميزات

- **4 تمارين تنفس علمية** مبنية على أبحاث موثقة:
  1. التنفس المتماسك (Coherent Breathing) - 6 أنفاس/دقيقة
  2. تنفس 4-7-8 - للاسترخاء العميق والنوم
  3. تنفس الصندوق (Box Breathing) - للتركيز
  4. تنفس العصب الحائر المباشر - زفير طويل

- **دليل تحفيز العصب الحائر** - تقنيات إضافية (ماء بارد، تدليك، غرغرة)

- **واجهة عربية كاملة** مع دعم RTL

- **تصميم ليلي مريح** للعينين

## الأساس العلمي

العصب الحائر (Vagus Nerve) هو أطول عصب في الجهاز العصبي اللاإرادي. يتحكم في:
- معدل ضربات القلب
- ضغط الدم
- الهضم
- الاستجابة للتوتر

التنفس البطيء (5.5-6 نفَس/دقيقة) يزيد تفعيل العصب الحائر ويحسن تقلب معدل ضربات القلب (HRV).

## التثبيت

```bash
# استنساخ المشروع
git clone https://github.com/username/vagus_breath.git

# تثبيت التبعيات
flutter pub get

# تشغيل التطبيق
flutter run

# بناء APK
flutter build apk --release
```

## هيكل المشروع

```
lib/
├── main.dart                 # نقطة الدخول
├── models/
│   └── breathing_exercise.dart  # نماذج البيانات
└── screens/
    ├── home_screen.dart      # الشاشة الرئيسية
    ├── breathing_screen.dart # شاشة التمرين
    ├── vagus_screen.dart     # دليل تحفيز العصب الحائر
    └── settings_screen.dart  # الإعدادات والمراجع
```

## المراجع العلمية

1. Zaccaro, A., et al. (2018). How Breath-Control Can Change Your Life. *Frontiers in Human Neuroscience*.
2. Ma, X., et al. (2017). The Effect of Diaphragmatic Breathing on Attention, Negative Affect and Stress. *Frontiers in Psychology*.
3. Laborde, S., et al. (2017). Heart Rate Variability and Cardiac Vagal Tone in Psychophysiological Research. *Frontiers in Psychology*.

## الترخيص

MIT License - استخدمه بحرية مع الإشارة للمصدر.

## المساهمة

المساهمات مرحب بها! افتح Issue أو Pull Request.
