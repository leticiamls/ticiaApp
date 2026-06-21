# 🕵️‍♀️📱 Tícia - O Jogo das Fake News

> Um aplicativo educacional interativo desenvolvido em Swift e SwiftUI focado em combater a desinformação de forma lúdica.

![Swift](https://img.shields.io/badge/Swift-FA7343?style=for-the-badge&logo=swift&logoColor=white)
![iOS](https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=ios&logoColor=white)
![SwiftUI](https://img.shields.io/badge/SwiftUI-007AFF?style=for-the-badge&logo=swift&logoColor=white)

---

## 🎯 Objetivo da Aplicação

Em uma era dominada pelo compartilhamento rápido de informações, o **Tícia** coloca o usuário no papel de um "moderador" de conteúdo. 

O jogador recebe várias notícias (alimentadas por uma base de dados JSON) e deve analisar criticamente o **título**, **resumo**, **fonte** e **contexto** para tomar uma decisão:
* ✅ **Publicar:** Se acreditar que a notícia é verdadeira.
* ❌ **Excluir:** Se identificar a notícia como falsa (Fake News).

As decisões afetam diretamente os indicadores de **Confiança** e **Caos** do jogador, fornecendo um feedback educativo e imediato após cada escolha.

---

## ✨ Funcionalidades Principais

* 🎮 **Modo Jogar (`JogoNewsView`):** O núcleo do aplicativo. Leia as notícias e tome suas decisões. Inclui barra de progresso e porcentagens em tempo real para os pontos de Confiança e Caos.
* 📚 **Modo Estudar (`EstudarView`):** Uma seção dedicada ao aprendizado, oferecendo dicas práticas para aprimorar a capacidade de detectar desinformação no dia a dia.
* 📊 **Feedback Dinâmico (`PopUpView`):** Após cada ação, um popup com uma justificativa detalhada explica a veracidade da notícia e avalia a escolha do jogador.
* 🏆 **Resultados Finais (`ResultsView`):** Tela de pontuação e classificação que resume o desempenho ao final de cada partida.
* 🗺️ **Navegação Fluida:** Gerenciamento de rotas eficiente utilizando o `NavigationStack` e uma classe `Router` personalizada.

---

## 🛠️ Tecnologias Utilizadas

| Tecnologia | Descrição |
| :--- | :--- |
| **Linguagem** | Swift |
| **Interface** | SwiftUI |
| **Gerenciamento de Estado** | Framework Observation (`@Observable`) e injeção de dependências (`@Environment`) |
| **Armazenamento** | Leitura de arquivos `.json` locais (`News.json`) |
| **Tipografia** | Fontes customizadas integradas (*Grandstander-Black*, *Fredoka*) |

---

## 📂 Estrutura do Projeto

A arquitetura do projeto é dividida para separar a interface gráfica, a lógica de negócios e os dados:

```text
📦 Ticia-App
 ┣ 📂 Views
 ┃ ┣ 📜 ContentView.swift     # Tela inicial e menu principal
 ┃ ┣ 📜 JogoNewsView.swift    # Motor central do jogo e renderização dos cards
 ┃ ┣ 📜 EstudarView.swift     # Material de estudo
 ┃ ┣ 📜 ResultsView.swift     # Estatísticas finais da rodada
 ┃ ┗ 📜 PopUpView.swift       # Overlay de feedback após decisões
 ┣ 📂 Models
 ┃ ┗ 📜 News.json             # Banco de dados das notícias
 ┗ 📂 Managers & Routers
   ┣ 📜 Router.swift          # Controle da pilha de navegação
   ┣ 📜 GameManager.swift     # Estado global, pontuação e transição de turnos
   ┗ 📜 CardManager.swift     # Lógica atrelada ao material de estudo
