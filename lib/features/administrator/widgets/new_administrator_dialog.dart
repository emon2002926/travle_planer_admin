import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/text/app_text.dart';
import '../../../core/widgets/text/text_field/AppTextFiled.dart';
import '../controllers/administrators_controller.dart';



class NewAdministratorDialog extends StatelessWidget {
  const NewAdministratorDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AdministratorsController>();

    return Dialog(
      backgroundColor: Color(0x00000000),
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: Container(
            padding: const EdgeInsets.fromLTRB(32, 24, 32, 32),
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(20),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _closeButton(),
                  const SizedBox(height: 4),
                  Center(
                    child: AppText(
                      data: 'New Administrator Profile Create',
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF101828),
                    ),
                  ),
                  const SizedBox(height: 28),
                  _row(
                    label: 'Name',
                    input: AppTextField(
                      controller: controller.formName,
                      hintText: 'Full name',
                      fillColor: Colors.transparent,
                    ),
                  ),
                  _row(
                    label: 'Email',
                    input: AppTextField(
                      controller: controller.formEmail,
                      hintText: 'Email address',
                      keyboardType: TextInputType.emailAddress,
                      fillColor: Colors.transparent,
                    ),
                  ),
                  _row(label: 'Role', input: _roleDropdown(controller)),
                  _row(
                    label: 'Image',
                    labelColor: Color(0xFF1A56DB),
                    input: _imagePicker(controller),
                  ),
                  const SizedBox(height: 28),
                  Row(
                    children: [
                      Expanded(
                        child: _outlinedButton(
                            text: 'Cancel', onTap: () => Get.back()),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: _filledButton(
                            text: 'Create', onTap: controller.createAdmin),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _closeButton() {
    return Align(
      alignment: Alignment.topRight,
      child: InkWell(
        onTap: () => Get.back(),
        customBorder: const CircleBorder(),
        child: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: Color(0xFF1C1C24),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.close, color: Color(0xFFFFFFFF), size: 20),
        ),
      ),
    );
  }

  Widget _row({
    required String label,
    required Widget input,
    Color labelColor = const Color(0xFF101828),
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          SizedBox(
            width: 110,
            child: AppText(
              data: label,
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: labelColor,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(child: input),
        ],
      ),
    );
  }

  Widget _roleDropdown(AdministratorsController c) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        border: Border.all(color: Color(0xFFD0D5DD)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonHideUnderline(
        child: Obx(
              () => DropdownButton<String>(
            isExpanded: true,
            dropdownColor: Color(0xFFFFFFFF),
            value: c.formRole.value,
            icon: Icon(Icons.keyboard_arrow_down, color: Color(0xFF101828)),
            items: c.roles
                .map(
                  (r) => DropdownMenuItem<String>(
                value: r,
                child: AppText(
                  data: r,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF101828),
                ),
              ),
            )
                .toList(),
            onChanged: (v) {
              if (v != null) c.formRole.value = v;
            },
          ),
        ),
      ),
    );
  }

  Widget _imagePicker(AdministratorsController c) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        border: Border.all(color: Color(0xFFD0D5DD)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const SizedBox(width: 16),
          Expanded(
            child: Obx(
                  () => AppText(
                data: c.formImageName.value.isEmpty
                    ? 'Choose image'
                    : c.formImageName.value,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: c.formImageName.value.isEmpty
                    ? Color(0xFF98A2B3)
                    : Color(0xFF101828),
              ),
            ),
          ),
          InkWell(
            onTap: c.pickImage,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              height: 54,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xFFE9EAEC),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(9),
                  bottomRight: Radius.circular(9),
                ),
              ),
              child: AppText(
                data: 'Choose',
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Color(0xFF101828),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _outlinedButton({required String text, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 58,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          border: Border.all(color: Color(0xFF1A56DB)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: AppText(
          data: text,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color(0xFF1A56DB),
        ),
      ),
    );
  }

  Widget _filledButton({required String text, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 58,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xFF1A56DB),
          borderRadius: BorderRadius.circular(10),
        ),
        child: AppText(
          data: text,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color(0xFFFFFFFF),
        ),
      ),
    );
  }
}