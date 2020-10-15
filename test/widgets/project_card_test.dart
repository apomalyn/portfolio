// FLUTTER / DART / THIRD-PARTIES
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/widgets/project_card.dart';

import '../helper.dart';

void main() {

  group('ProjectCard - ', () {
    
    testWidgets('has right background color, logo and label', (WidgetTester tester) async {
      await tester.pumpWidget(localizedWidget(child: const ProjectCard(backgroundColor: null, projectData: null)));
      await tester.pumpAndSettle();

      // TODO
    });
  });
}
