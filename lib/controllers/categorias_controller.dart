import 'package:f290_ddm2_mitridates_app/Model/vitrine.dart';
import 'package:f290_ddm2_mitridates_app/repositories/vitrine_repository.dart';
import 'package:flutter/cupertino.dart';

class CategoriasController {
  List<Vitrine> vitrine = [];
  final VitrineRepository _repository;
  final state = ValueNotifier<CategoriasState>(CategoriasState.start);
  // CategoriasState state = CategoriasState.start;

  CategoriasController([VitrineRepository repository])
      : _repository = repository ?? VitrineRepository();

  Future start(String filtro) async {
    state.value = CategoriasState.loading;
    try {
      vitrine = await _repository.fetchVitrine(filtro);
      state.value = CategoriasState.success;
    } catch (e) {
      state.value = CategoriasState.error;
    }
  }
}

enum CategoriasState { start, loading, success, error }
