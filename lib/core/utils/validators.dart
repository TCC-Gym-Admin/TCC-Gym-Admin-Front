bool validateDocument(String? document) {
  // Verifica se é nulo ou vazio
  if (document == null || document.trim().isEmpty) {
    return false;
  }

  // Remove qualquer caractere que não seja número
  document = document.replaceAll(RegExp(r'[^0-9]'), '');

  // Precisa ter 11 dígitos
  if (document.length != 11) return false;

  // Bloqueia documentos com todos os números iguais
  if (RegExp(r'^(\d)\1*$').hasMatch(document)) return false;

  // Calcula primeiro dígito verificador
  int soma = 0;
  for (int i = 0; i < 9; i++) {
    soma += int.parse(document[i]) * (10 - i);
  }

  int primeiroDigito = (soma * 10) % 11;
  if (primeiroDigito == 10) primeiroDigito = 0;

  if (primeiroDigito != int.parse(document[9])) return false;

  // Calcula segundo dígito verificador
  soma = 0;
  for (int i = 0; i < 10; i++) {
    soma += int.parse(document[i]) * (11 - i);
  }

  int segundoDigito = (soma * 10) % 11;
  if (segundoDigito == 10) segundoDigito = 0;

  if (segundoDigito != int.parse(document[10])) return false;

  return true;
}

bool validateFullName(String? name) {
  if (name == null) return false;

  name = name.trim();

  // Verifica se está vazio
  if (name.isEmpty) return false;

  // Não pode conter números
  if (RegExp(r'[0-9]').hasMatch(name)) return false;

  // Permite apenas letras e espaços (inclui acentos)
  if (!RegExp(r'^[a-zA-ZÀ-ÿ\s]+$').hasMatch(name)) return false;

  // Precisa ter pelo menos duas palavras
  List<String> parts = name.split(' ').where((p) => p.isNotEmpty).toList();

  if (parts.length < 2) return false;

  // Cada parte precisa ter pelo menos 2 letras
  for (var part in parts) {
    if (part.length < 2) return false;
  }

  return true;
}
