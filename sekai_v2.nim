import strutils, sequtils
import std/os
import tables

var vars = initTable[string, string]()

proc interpretar(comando: string) =
  let partes = comando.splitWhitespace()
  if partes.len == 0: return

  case partes[0]:
  of "cuts":
    let aspas = comando.split('"')
    if aspas.len >= 3: echo aspas[1]
    else: echo "Erro: cuts precisa de aspas. Ex: cuts \"Hello!\""

  of "min":
    if partes.len == 3:
      let a = parseInt(partes[1])
      let b = parseInt(partes[2])
      if a < b: echo a else: echo b
    else: echo "Erro: min precisa de 2 números"

  of "sum":
    if partes.len == 3:
      echo parseInt(partes[1]) + parseInt(partes[2])
    else: echo "Erro: sum precisa de 2 números"

  of "meet":
    if partes.len == 3:
      let a = parseInt(partes[1])
      let b = parseInt(partes[2])
      if a > b: echo a, " is greater than ", b
      elif b > a: echo b, " is greater than ", a
      else: echo a, " and ", b, " are equal"
    else: echo "Erro: meet precisa de 2 números"

  of "tag", "set":
    if partes.len >= 4 and partes[2] == "=":
      let nome = partes[1]
      let valor = partes[3..^1].join(" ")
      vars[nome] = valor
      echo nome, " = ", valor
    else: echo "Erro: use ", partes[0], " nome = valor"

  of "use":
    if partes.len == 2:
      if vars.hasKey(partes[1]): echo vars[partes[1]]
      else: echo "Erro: variável '", partes[1], "' não existe"
    else: echo "Erro: use nome_da_variavel"

  of "list":
    if vars.len == 0: echo "(nenhuma variável)"
    else:
      for k, v in vars: echo k, " = ", v

  of "del":
    if partes.len == 2:
      if vars.hasKey(partes[1]):
        vars.del(partes[1])
        echo "Deletado: ", partes[1]
      else: echo "Erro: '", partes[1], "' não existe"
    else: echo "Erro: del nome_da_variavel"

  of "calc":
    if partes.len == 4:
      let a = if vars.hasKey(partes[1]): parseInt(vars[partes[1]]) else: parseInt(partes[1])
      let b = if vars.hasKey(partes[3]): parseInt(vars[partes[3]]) else: parseInt(partes[3])
      case partes[2]:
      of "+": echo a + b
      of "-": echo a - b
      of "*": echo a * b
      of "/":
        if b == 0: echo "Erro: divisão por zero"
        else: echo a div b
      else: echo "Erro: operador desconhecido: ", partes[2]
    else: echo "Erro: calc a + b (a e b podem ser variáveis)"

  of "sleep":
    if partes.len == 2:
      let ms = parseInt(partes[1])
      echo "Dormindo ", ms, "ms..."
      sleep(ms)
      echo "Acordei! ☀️"
    else: echo "Erro: sleep precisa de 1 número (ms)"

  of "sair":
    echo "Até logo! 🌸"
    quit(0)

  else:
    echo "Comando desconhecido: ", partes[0]

proc main() =
  # Se veio um arquivo como argumento, executa ele
  if paramCount() >= 1:
    let arquivo = paramStr(1)
    if fileExists(arquivo):
      echo "=== Executando: ", arquivo, " ==="
      for linha in lines(arquivo):
        let limpa = linha.strip()
        if limpa.len > 0 and not limpa.startsWith("#"):
          interpretar(limpa)
      echo "=== Fim ==="
      return
    else:
      echo "Erro: arquivo não encontrado: ", arquivo
      return

  # Senão, REPL normal
  echo "=== SEKAI LINGUAGEM v0.3 ==="
  echo "Comandos: cuts, min, sum, meet, tag, set, use, list, del, calc, sleep, sair"
  echo ""

  while true:
    write(stdout, "sekai> ")
    let entrada = readLine(stdin)
    if entrada.len == 0: continue
    interpretar(entrada)

main()
