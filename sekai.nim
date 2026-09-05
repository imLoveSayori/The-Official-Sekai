import strutils, sequtils

proc interpretar(comando: string) =
  let partes = comando.splitWhitespace()
  
  if partes.len == 0:
    return
  
  case partes[0]:
  of "cuts":
   
    let texto = comando.split('"')[1]
    echo texto
  
  of "min":
    if partes.len == 3:
      let a = parseInt(partes[1])
      let b = parseInt(partes[2])
      if a < b:
        echo a
      else:
        echo b
    else:
      echo "Erro: min precisa de 2 números"
  
  of "use":
    echo "Use o que? Digite 'use coisa'"
  
  else:
    echo "Comando desconhecido: ", partes[0]

proc main() =
  echo "=== SEKAI LINGUAGEM ==="
  echo "Comandos: cuts, min, use"
  echo "Digite 'sair' pra encerrar"
  echo ""
  
  while true:
    write(stdout, "sekai> ")
    let entrada = readLine(stdin)
    
    if entrada == "sair":
      echo "Até logo!"
      break
    
    interpretar(entrada)

main()
