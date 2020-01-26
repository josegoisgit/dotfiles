# Birfucado de holman faz dotfiles

Seus "dotfiles" - aqruivos ponto - personalizam o seu sistema através de parâmetros específicos para cada programa.

Este projeto busca compartilhar um ponto de partida para alguns que queiram aceitem uma ajuda daqueles que confrontaram algumas sessões de confronto e compartilham para o avanço coletivo. Este repositório, por exemplo, teve início com o Zach Holman http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/.

Holman diz que esteve um pouco cansado de ter arquivos grandes de alias e arquivos espalhados. Isso levou à produção desse projeto de uma forma mais centrada-à-tópicos. Ele percebeu que podia separar muitas das coisas em áreas centrais (que será dissertada a seguir), então estruturou projetos de acordo. Parte da filosofia que ele compartilha está no link anterior.

Este projeto está construído em torno de tópicos. Se você estiver adicionando uma nova área para seus dotfiles - por exemplo "Java" - você pode simplesmente adicionar um diretório "java" e contendo arquivos percebidos pelo projeto que estão descritos no próximo tópico.   

## Componenets

Existem alguns tipos especiais de arquivos nesta hierarquia:

- `script/bootstrap`: Arquivo de inicialização e atualização do sistema, cuja a execução realiza a execução e cópia ordenada a partir da hierarquia dos componentes.
- `script/install`: Arquivo de inicialização e atualização do sistema, cuja a execução realiza a execução e cópia ordenada a partir da hierarquia dos componentes.
- **bin/**: Contém arquivos que serão adicionados ao `$PATH`, e o conteúdo poderá ser chamado em qualquer contexto.
- **topic/\*.zsh**: Arquivos com extensão `.zsh` serão executados ao iniciar uma nova sessão de terminal.
- **topic/path.zsh**: Arquivo nomeados `path.zsh` serão executado primeiro, indica-se que faça parte da composição do `$PATH` ou similar. 
- **topic/completion.zsh**: Arquivos nomeados `completion.zsh` são executados por ultimo, indica-se que componha o preparar do autocompletar.
- **topic/install.sh**: Arquivos nomeados `install.sh` são executado somente ao executar o `script/install`. 
- **topic/\*.symlink**: Arquivos com extensão `*.symlink` são copiados em elo para a pasta `$HOME` sempre que executa-se o `script/bootstrap`. Isso garante o versionamento dos dotfiles, mantendo o carregar a partir do diretório lar do usuário.

## Instalação

Execute este código:

```sh
git clone https://github.com/josegoisgit/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
script/bootstrap
```

Isso copiará elos dos arquivos apropriados do projeto ao seu diretório lar ($HOME). Tudo estará configurardo e ajustados dentro da pasta `~/.dotfiles`. O principal arquivo a ser modificado é o `zsh/zshrc.symlink`, este arquivo provê uma lista de caminhos que podem ser diferentes em cada máquina.

O programa `dot` é uma rotina de código simples que instala algumas dpendencias e define alguns padrões para macOS, entre outras coisas. Ajustar essa rotina, e ocasionalmente executar `dot` de tempos em tempos manterá o ambiente deste projeto atualizado. Este programa está em `bin/`.
