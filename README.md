# NEM A PATO! express

<div align="center">
  <img src="https://github.com/Victy0/nem_a_pato_express/blob/main/assets/images/nem_a_pato_logo.jpg?raw=true" alt="Logo" width="200">
  <img src="https://github.com/Victy0/nem_a_pato_express/blob/main/assets/images/nem_a_pato_duck.jpg?raw=true" alt="Logo Duck" width="194">
</div>

Repositório referente a construção de um app simples utilizando flutter sobre um jogo de estratégia e trívia denominado "Nem a Pato! express". 

**Em resumo:** "Nem a Pato! express" é uma versão adaptada e simplificada do jogo de cartas, estratégia e trívia "Nem a pato!", inventado por Rodrigo Rego e disponibilizado pela Grok Games no Brasil ([clique para ir ao site de compra do jogo](https://grokgames.com.br/loja/nem-a-pato/?srsltid=AfmBOopDRlsPb1lHe12G6e7G7hSOyrhBd_L3o2MnnAVFNwKZzChya-8S)).
Neste jogo, o importante não é saber a resposta, você só precisa chutar um número. Só não exagere, pois alguém pode dizer “Nem a pato!” e desafiar seu palpite.Em cada rodada, uma pergunta é selecionada e lida em voz alta, e cada jogador tentará adivinhar a resposta numérica em seu turno. Se um palpite for contestado, a resposta é verificada. Se o palpite for menor ou igual a resposta, o contestador sai do jogo. Mas se o palpite for maior que a resposta, você sai do jogo. No final da partida, o último jogador vence!

Implementado por:
 - Victor Rodrigues Marques

# Requisitos

 - Flutter 3.4.3 ou superior

# Instalação do app

**Android**

 - Necessário habilitar para que o Android permita a instalação de APK por fontes desconhecidas.
 - APK: [clique aqui para realizar download](https://github.com/Victy0/nem_a_pato_express/blob/main/apk/nem-a-pato-express.apk "download")

# Instalação para desenvolvedores

**1** - Instalar SDK do Flutter e configurar IDE caso necessário:

 - [Documentação de instalação do Flutter](https://docs.flutter.dev/get-started/install)

**2** - Clonar o repositório:

    git clone https://github.com/Victy0/nem_a_pato.git

**3** - Instalar dependências:

    flutter pub get

**5** - Rodar o flutter:

 - [Documentação de comandos do Flutter](https://docs.flutter.dev/reference/flutter-cli)


#  Estrutura de diretórios

Pode-se destacar 5 principais diretórios:

:small_blue_diamond: **assets**: diretório com arquivos de imagens, áudios e json com conteúdo de jogo para ser utilizado. pela aplicação

:small_blue_diamond: **components**: diretório com componentes flutters que podem ser utilizados em templates de páginas da aplicação.

:small_blue_diamond: **models**: diretório com estruturas de dados referentes ao objetos manipulados pela aplicação.

:small_blue_diamond: **pages**: diretório com templates de páginas de navegação da aplicação.

:small_blue_diamond: **services**: diretório com serviços utilizados no ciclo de vida de operações da aplicação.

    |____assets
    |____lib
        |____components
        |____models
        |____pages
        |____services
