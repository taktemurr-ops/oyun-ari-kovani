import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_ari_kovani/oyun_ari_kovani.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(ariKovaniConfig.title.length, 33);
    expect(ariKovaniConfig.tagline.length, 33);
    for (final s in ariKovaniConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(ariKovaniConfig.gameId, ariKovaniId);
    expect(ariKovaniRules.gameId, ariKovaniId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(ariKovaniRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: ariKovaniId, optionalMechanics: ariKovaniRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(ariKovaniRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
