<div align="center">

<img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" />
<img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" />
<img src="https://img.shields.io/badge/MobX-FF7A00?style=for-the-badge&logo=mobx&logoColor=white" />
<img src="https://img.shields.io/badge/Hive-FFD700?style=for-the-badge&logo=hive&logoColor=black" />

<br/><br/>

# 🃏 Flash Cards

> Aprenda mais rápido. Revise de forma inteligente. Memorize com eficiência.

**Flash Cards** é um aplicativo mobile desenvolvido em Flutter para criação e estudo de cartões de memorização (flashcards). Com uma interface intuitiva e persistência de dados local, o app oferece uma experiência de aprendizado prática e responsiva.

<br/>

[![Flutter Version](https://img.shields.io/badge/Flutter-3.x-blue?logo=flutter)](https://flutter.dev)
[![Dart SDK](https://img.shields.io/badge/Dart-^3.10.4-blue?logo=dart)](https://dart.dev)
[![License](https://img.shields.io/badge/License-MIT-green)](LICENSE)
[![Version](https://img.shields.io/badge/Version-1.0.0-orange)](https://github.com/geovannifranca/flash_cards/releases)

</div>

---

## 📋 Índice

- [Sobre o Projeto](#-sobre-o-projeto)
- [Funcionalidades](#-funcionalidades)
- [Arquitetura](#-arquitetura)
- [Tech Stack](#-tech-stack)
- [Estrutura de Pastas](#-estrutura-de-pastas)
- [Pré-requisitos](#-pré-requisitos)
- [Instalação e Execução](#-instalação-e-execução)
- [Gerando Código (Build Runner)](#-gerando-código-build-runner)
- [Como Usar](#-como-usar)
- [Protótipo](#-protótipo)
- [Contribuindo](#-contribuindo)
- [Autor](#-autor)
- [Licença](#-licença)

---

## 📖 Sobre o Projeto

Flash Cards é uma aplicação mobile focada em **aprendizado por repetição espaçada**. O usuário cria baralhos temáticos com cartões frente/verso, revisa o conteúdo de forma interativa e acompanha seu progresso de memorização.

O projeto foi construído com foco em:
- **Offline-first** — todos os dados são armazenados localmente com Hive CE, sem necessidade de internet.
- **Reatividade** — a UI é completamente reativa via MobX, garantindo atualizações de estado sem boilerplate.
- **Injeção de Dependência** — GetIt gerencia o grafo de dependências de forma desacoplada e testável.

---

## ✨ Funcionalidades

- [x] Criar e gerenciar baralhos (decks) de flash cards
- [x] Adicionar, editar e remover cartões (frente e verso)
- [x] Virar cartão com animação interativa
- [x] Persistência local com Hive CE (sem internet)
- [x] Gerenciamento de estado reativo com MobX
- [x] Injeção de dependência com GetIt
- [x] Identificadores únicos por cartão via UUID
- [x] Suporte a imagens nos cartões

---

## 🏛 Arquitetura

O projeto segue uma arquitetura em camadas baseada em **Feature-First**, com separação clara de responsabilidades:

```
Presentation Layer  ←→  MobX Stores  ←→  Repository  ←→  Hive (Local DB)
     (Widgets)           (State)         (Data Access)      (Persistence)
```

- **Presentation**: Widgets Flutter puros, sem lógica de negócio.
- **Store (MobX)**: Gerencia o estado observável e as actions que modificam os dados.
- **Repository**: Abstrai o acesso ao banco de dados local.
- **Data Source**: Hive CE como storage NoSQL embutido.
- **DI**: GetIt como service locator para resolver dependências em runtime.

---

## 🚀 Tech Stack

| Camada | Tecnologia | Versão | Finalidade |
|---|---|---|---|
| Framework | Flutter | 3.x | UI multiplataforma |
| Linguagem | Dart | ^3.10.4 | Linguagem base |
| Estado | MobX + flutter_mobx | ^2.6.0 / ^2.3.0 | Gerenciamento de estado reativo |
| Banco de dados | Hive CE + hive_ce_flutter | ^2.19.3 / ^2.3.4 | Persistência local NoSQL |
| DI | GetIt | ^9.2.1 | Injeção de dependência |
| ID único | UUID | ^4.5.3 | Geração de identificadores únicos |
| Code Gen | build_runner + mobx_codegen + hive_ce_generator | latest | Geração automática de código |

---

## 📁 Estrutura de Pastas

```
flash_cards/
├── android/                    # Configurações nativas Android
├── assets/
│   └── images/                 # Assets de imagem do app
├── lib/
│   ├── data/
│   │   ├── models/             # Modelos Hive (HiveObjects)
│   │   └── repositories/       # Implementações dos repositórios
│   ├── presentation/
│   │   ├── pages/              # Telas do app
│   │   ├── stores/             # MobX Stores (state management)
│   │   └── widgets/            # Componentes reutilizáveis
│   └── main.dart               # Entry point da aplicação
├── pubspec.yaml
└── README.md
```

---

## ⚙️ Pré-requisitos

Antes de começar, certifique-se de ter instalado:

- [Flutter SDK](https://docs.flutter.dev/get-started/install) `>= 3.x`
- [Dart SDK](https://dart.dev/get-dart) `^3.10.4`
- [Android Studio](https://developer.android.com/studio) ou [VS Code](https://code.visualstudio.com/) com extensão Flutter
- Um emulador Android/iOS ou dispositivo físico conectado

Verifique sua instalação com:

```bash
flutter doctor
```

---

## 🛠 Instalação e Execução

### 1. Clone o repositório

```bash
git clone https://github.com/geovannifranca/flash_cards.git
cd flash_cards
```

### 2. Instale as dependências

```bash
flutter pub get
```

### 3. Execute o gerador de código

> Necessário para gerar os arquivos do Hive e do MobX (`.g.dart`)

```bash
dart run build_runner build --delete-conflicting-outputs
```

### 4. Rode o aplicativo

```bash
flutter run
```

Para rodar em modo release:

```bash
flutter run --release
```

---

## 🔧 Gerando Código (Build Runner)

Este projeto usa geração de código para o Hive CE e MobX. Sempre que modificar um `HiveObject` ou um `Store`, rode:

```bash
# Gera uma vez
dart run build_runner build --delete-conflicting-outputs

# Modo watch (gera automaticamente ao salvar)
dart run build_runner watch --delete-conflicting-outputs
```

Os arquivos gerados (`.g.dart`) são versionados no repositório para facilitar o setup inicial.

---

## 📱 Como Usar

1. **Abra o app** e você verá a tela inicial com seus baralhos.
2. **Crie um baralho** tocando no botão `+` e definindo um nome e categoria.
3. **Adicione cartões** ao baralho informando o conteúdo da frente e do verso.
4. **Inicie a revisão** selecionando um baralho e tocando em "Estudar".
5. **Vire os cartões** tocando neles para revelar a resposta.
6. **Marque seu acerto ou erro** para registrar o progresso da sessão.

---

## 🎨 Protótipo

Os wireframes e protótipos de tela estão disponíveis na pasta [`/prototico`](./prototico) do repositório. O design foi planejado antes da implementação para garantir consistência na experiência do usuário.

---

## 🤝 Contribuindo

Contribuições são sempre bem-vindas! Siga os passos abaixo:

1. Faça um **fork** do projeto
2. Crie uma branch para sua feature:
   ```bash
   git checkout -b feature/minha-feature
   ```
3. Faça o commit das suas alterações:
   ```bash
   git commit -m "feat: adiciona minha feature"
   ```
4. Envie para a branch principal:
   ```bash
   git push origin feature/minha-feature
   ```
5. Abra um **Pull Request**

> Siga o padrão de commits [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/).

---

## 👨‍💻 Autor

<table>
  <tr>
    <td align="center">
      <a href="https://github.com/geovannifranca">
        <img src="https://github.com/geovannifranca.png" width="80px;" alt="Geovanni França"/><br/>
        <sub><b>Geovanni França</b></sub>
      </a>
    </td>
  </tr>
</table>

[![GitHub](https://img.shields.io/badge/GitHub-geovannifranca-181717?style=flat-square&logo=github)](https://github.com/geovannifranca)

---

## 📄 Licença

Este projeto está sob a licença **MIT**. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

---

<div align="center">

Feito com ❤️ e ☕ por <a href="https://github.com/geovannifranca">Geovanni França</a>

⭐ Se este projeto te ajudou, deixe uma estrela!

</div>