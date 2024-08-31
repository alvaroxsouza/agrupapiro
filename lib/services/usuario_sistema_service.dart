import 'package:agrupapiro/data/usuario_sistema_dao.dart';
import 'package:agrupapiro/models/usuario.dart';

class UsuarioSistemaService {
  final UsuarioSistemaDao _usuarioSistemaDao;

  UsuarioSistemaService(this._usuarioSistemaDao);

  Future<List> buscarTodos() async {
    return await _usuarioSistemaDao.getUsuarios();
  }

  Future<UsuarioSistema?> buscarPorCpf(String cpf) async {
    return await _usuarioSistemaDao.getById(cpf);
  }

  Future<int> inserir(UsuarioSistema usuarioSistema) async {
    return await _usuarioSistemaDao.insertUsuario(usuarioSistema);
  }

  Future<int> alterar(UsuarioSistema usuarioSistema) async {
    return await _usuarioSistemaDao.updateUsuario(usuarioSistema);
  }

  Future<int> excluir(String cpf) async {
    return await _usuarioSistemaDao.deleteUsuario(cpf);
  }
}
