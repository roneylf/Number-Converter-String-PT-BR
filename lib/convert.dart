import 'package:intl/intl.dart';

class ConvertNumber {
  static String convert(double num) {
    String mask = "000000000000";
    final df = new NumberFormat(mask);
    String snumber = df.format(num);

    int centenamil = int.parse(snumber.substring(5, 6));
    int dezenamil = int.parse(snumber.substring(7, 8));
    int mil = int.parse(snumber.substring(8, 9));

    int centena = int.parse(snumber.substring(9, 10));
    int dezena = int.parse(snumber.substring(10, 11));
    int unidade = int.parse(snumber.substring(11, 12));

    if (dezena == 1) {
      unidade = int.parse("1" + unidade.toString());
      dezena = 0;
    }

    String txtUnidade = _converteUnidade(unidade);
    String txtDezena = _converteDezena(dezena);
    String txtCentena = _converteCentenas(centena);
    String txtMil;
    if (mil == 1) {
      txtMil = "Hum mil";
      mil = 0;
    } else {
      txtMil = _converteUnidade(mil);
      if (mil > 0 || dezenamil > 0 || centenamil > 0) {
        txtMil += " mil";
      }
    }

    String txtMilDezena = _converteDezena(dezenamil);

    String txtMilCentena = _converteCentenas(centenamil+1);

    String resultado = " ";
    List<String> conj = List<String>();
    conj.add(txtMilCentena);
    conj.add(txtMilDezena);
    conj.add(txtMil);
    conj.add(txtCentena);
    conj.add(txtDezena);
    conj.add(txtUnidade);

    int x = 0;

    conj.forEach((f) {
      if (x > 0) {
        resultado += " e ";
      }
      if (f.length > 1) {
        resultado += f;
        x++;
      }
    });

    return(resultado);
  }

  static String _converteUnidade(int num) {
    List<String> unidades = [
      "",
      "um",
      "dois",
      "três",
      "quatro",
      "cinco",
      "seis",
      "sete",
      "oito",
      "nove",
      "dez",
      "onze",
      "doze",
      "treze",
      "quatorze",
      "quinze",
      "dezesseis",
      "dezessete",
      "dezoito",
      "dezenove"
    ];

    return unidades[num];
  }

  static String _converteDezena(int num) {
    List<String> dezenas = [
      "",
      "",
      "vinte",
      "trinta",
      "quarenta",
      "cinquenta",
      "sessenta",
      "setenta",
      "oitenta",
      "noventa",
    ];

    return dezenas[num];
  }

  static String _converteCentenas(int num) {
    print("casa centenas" + num.toString());
    List<String> centenas = [
      "",
      "cento",
      "duzentos",
      "trezentos",
      "quatrocentos",
      "quinhenhos",
      "seiscentos",
      "setecentos",
      "oitocentos",
      "novecentos",
    ];

    return centenas[num];
  }
}
