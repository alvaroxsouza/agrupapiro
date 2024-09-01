import 'database_grupo_pesquisa.dart';
import 'database_usuario_sistema.dart';

const String kUSUARIO_GRUPO_PESQUISA_TABLENAME = 'user_grupo_pesquisa';

const String kUSUARIO_GRUPO_PESQUISA_CPF = 'cpf';
const String kUSUARIO_GRUPO_PESQUISA_GRUPO_PESQUISA_ID = 'grupo_pesquisa_id';

const String kUSUARIO_GRUPO_PESQUISA_CREATE_TABLE = '''
  CREATE TABLE $kUSUARIO_GRUPO_PESQUISA_TABLENAME (
    $kUSUARIO_GRUPO_PESQUISA_CPF TEXT NOT NULL,
    $kUSUARIO_GRUPO_PESQUISA_GRUPO_PESQUISA_ID INTEGER NOT NULL,
    PRIMARY KEY ($kUSUARIO_GRUPO_PESQUISA_CPF, $kUSUARIO_GRUPO_PESQUISA_GRUPO_PESQUISA_ID),
    FOREIGN KEY ($kUSUARIO_GRUPO_PESQUISA_CPF) REFERENCES $kUSUARIOTABLENAME($kUSUARIO_CPF),
    FOREIGN KEY ($kUSUARIO_GRUPO_PESQUISA_GRUPO_PESQUISA_ID) REFERENCES $kGRUPO_PESQUISA_TABLE_NAME($kGRUPO_PESQUISA_ID)
  );
''';