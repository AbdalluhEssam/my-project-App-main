import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/core/Constant/Buttons/Buttons.dart';
import 'package:my_project/core/Constant/Colors/Colors.dart';
import 'package:my_project/core/Constant/Fonts/Fonts.dart';
import 'package:my_project/core/Constant/Images/Images.dart';

class StudentSettingProjectDetailsView extends StatefulWidget {
  const StudentSettingProjectDetailsView({super.key});

  @override
  State<StudentSettingProjectDetailsView> createState() =>
      _StudentSettingProjectDetailsViewState();
}

class _StudentSettingProjectDetailsViewState
    extends State<StudentSettingProjectDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ArrowBackButton(),
            SizedBox(
                width: Get.width * 0.85,
                child: const Text(
                  "Smart Home System",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: bigOrangeColor,
                )),
            const SizedBox(
              height: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: LocalSvgImage(
                    localImagePath: "Smart home-amico.svg",
                    widthImage: Get.width,
                    heightImage: 0.3),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Divider(
                color: blackColor,
                height: 1,
                thickness: 1,
              ),
            ),
            const Padding(
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "وصف المشروع",
                    style: mediumOrangeColor,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: Get.width * 0.8,
              child: Column(
                children: [
                  Text(
                    "نظام المنزل الذكي هو تقنية حديثة تهدف إلى تحسين مستوى الراحة، الأمان، والكفاءة في المنازل من خلال الأتمتة والتحكم عن بُعد. يعتمد النظام على شبكة من الأجهزة المتصلة بالإنترنت التي تعمل بشكل متكامل لتوفير بيئة منزلية تفاعلية وقابلة للتخصيص وفق احتياجات المستخدم و يتم التحكم في الإضاءة باستخدام تطبيقات الهاتف أو الأوامر الصوتية. يمكن جدولة الإضاءة أو تعديل شدة الإضاءة وألوانها لتناسب المناسبات المختلفة. تشمل الكاميرات الذكية، أجهزة استشعار الحركة، أقفال الأبواب الذكية، وأجهزة الإنذار. تتيح هذه الأنظمة مراقبة المنزل من أي مكان وتنبيه المستخدم عند حدوث نشاط غير طبيعي. مثل الثلاجات الذكية، الأفران، والغسالات. يمكن تشغيلها ومراقبتها عن بُعد، كما تقدم تقارير عن استهلاك الطاقة أو تنبيهات للصيانة تشمل أجهزة التكييف والتدفئة الذكية التي يمكن ضبطها تلقائيًا بناءً على تفضيلات المستخدم ودرجة حرارة المنزل",
                    style: verySmallBlackColor,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
