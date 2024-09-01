import 'package:agrupapiro/repositories/sessao_dao.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sessao_service.g.dart';

class SessaoService {
  final SessaoDao _sessaoDao;

  SessaoService(this._sessaoDao);

  Future<void> saveUserSession(String token) async {
    return _sessaoDao.saveUserSession(token);
  }

  Future<bool> isUserLoggedIn() async {
    return _sessaoDao.isUserLoggedIn();
  }

  Future<String?> getUserToken() async {
    return _sessaoDao.getUserToken();
  }

  Future<void> logoutUser() async {
    return _sessaoDao.logoutUser();
  }
}

@Riverpod(keepAlive: true)
SessaoService sessaoService(SessaoServiceRef ref) {
  return SessaoService(ref.watch(sessaoDaoProvider));
}
