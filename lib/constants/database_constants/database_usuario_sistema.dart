const String kUSUARIO_TABLE_NAME = 'usuario_sistema';

const String kUSUARIO_CPF = 'cpf';
const String kUSUARIO_NOME = 'nome';
const String kUSUARIO_EMAIL = 'email';
const String kUSUARIO_UNIVERSIDADE = 'universidade';
const String kUSUARIO_SENHA = 'senha';
const String kUSUARIO_TELEFONE = 'telefone';
const String kUSUARIO_CURSO = 'curso';
const String kUSUARIO_PERIODO = 'periodo';

const String kUSUARIO_CREATE_TABLE = '''
  CREATE TABLE $kUSUARIO_TABLE_NAME (
    $kUSUARIO_CPF TEXT PRIMARY KEY,
    $kUSUARIO_NOME TEXT NOT NULL,
    $kUSUARIO_EMAIL TEXT NOT NULL,
    $kUSUARIO_UNIVERSIDADE TEXT NOT NULL,
    $kUSUARIO_SENHA TEXT NOT NULL,
    $kUSUARIO_TELEFONE TEXT NOT NULL,
    $kUSUARIO_CURSO TEXT NOT NULL,
    $kUSUARIO_PERIODO TEXT NOT NULL
  );
''';
