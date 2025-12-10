# Aplicativo Inatel Pós-Graduação

Sistema de gestão de cursos de pós-graduação desenvolvido em SwiftUI, aplicando arquitetura MVVM e boas práticas de desenvolvimento iOS.

## Descrição

Aplicação móvel para gerenciamento de matrículas em cursos de pós-graduação do Inatel. O sistema permite autenticação de usuários, visualização de cursos disponíveis, matrícula com opções de parcelamento e acompanhamento de progresso nas disciplinas.

## Funcionalidades

### Autenticação
- Login com usuário e senha
- Hash criptográfico de senhas utilizando SHA256 (CryptoKit)
- Troca rápida entre usuários cadastrados
- Cadastro de novos usuários
- Persistência de sessão

### Gestão de Cursos
- Visualização de 8 cursos de pós-graduação
- Carrossel interativo com navegação por páginas
- Informações detalhadas de cada curso (descrição, carga horária, disciplinas)
- Sistema de matrícula com múltiplas opções de parcelamento
- Logos personalizadas por curso

### Acompanhamento Acadêmico
- Lista completa de disciplinas por curso
- Marcação de disciplinas concluídas
- Visualização de cursos matriculados
- Contador de progresso por curso

## Arquitetura

O projeto segue o padrão **MVVM (Model-View-ViewModel)** com clara separação de responsabilidades:
```
inatelposcursos/
├── App/
│   └── inatelposcursosApp.swift
├── Models/
│   ├── Course.swift
│   ├── Subject.swift
│   ├── User.swift
│   └── InstallmentOption.swift
├── Mocks/
│   ├── MockData.swift
│   └── UsersMock.swift
├── ViewModels/
│   ├── HomeViewModel.swift
│   └── AuthViewModel.swift
├── Views/
│   ├── ContentView.swift
│   ├── HomeView.swift
│   ├── MyCoursesView.swift
│   ├── Auth/
│   │   ├── LoginView.swift
│   │   └── AddUserSheetView.swift
│   ├── Components/
│   │   ├── CourseCardView.swift
│   │   ├── CourseLogoView.swift
│   │   ├── PaymentSheetView.swift
│   │   └── UserMenuView.swift
│   └── Details/
│       └── CourseDetailView.swift
└── Assets.xcassets/
```

## Tecnologias Utilizadas

- **Swift 5.9+**
- **SwiftUI** - Framework de interface declarativa
- **Observation Framework** - Gerenciamento de estado reativo
- **CryptoKit** - Criptografia de senhas
- **NavigationStack** - Sistema de navegação moderno

## Cursos Disponíveis

1. Desenvolvimento Mobile e Cloud Computing (368h)
2. Engenharia de Software Aplicada (368h)
3. MBA em Gestão em Negócios Tecnológicos (368h)
4. Tecnologias Emergentes para a Indústria (368h)
5. Engenharia de Redes e Sistemas de Telecomunicações (368h)
6. Redes Comunicações Móveis 5G (438h)
7. Transformação Digital (360h)
8. Tecnologias Disruptivas e Gestão em Saúde (360h)

## Requisitos do Sistema

- iOS 18.6 ou superior
- Xcode 26.1 ou superior
- Swift 5.9 ou superior

## Instalação

1. Clone o repositório:
```bash
git clone https://github.com/paulomatheus/inatelposcursos.git
```

2. Abra o projeto no Xcode:
```bash
cd inatelposcursos
open inatelposcursos.xcodeproj
```

3. Compile e execute no simulador ou dispositivo físico.

## Credenciais de Teste

Usuários pré-cadastrados para teste:

| Usuário   | Senha |
|-----------|-------|
| admin     | 123   |
| aluno     | senha |
| professor | abc   |

## Estrutura de Dados

### Course (Curso)
- ID único (UUID)
- Nome e descrição
- Lista de disciplinas
- Carga horária
- Opções de parcelamento
- Logo (opcional)

### Subject (Disciplina)
- ID único (UUID)
- Nome da disciplina
- Status de conclusão

### User (Usuário)
- ID único (UUID)
- Nome de usuário
- Hash da senha (SHA256)

## Padrões Implementados

### MVVM
- **Models**: Estruturas de dados puras e imutáveis
- **Views**: Componentes visuais sem lógica de negócio
- **ViewModels**: Gerenciamento de estado e lógica de aplicação

### Componentização
- Componentes reutilizáveis isolados
- Props bem definidas
- Previews para desenvolvimento

### Separação de Responsabilidades
- Dados mockados em arquivos dedicados
- Lógica de autenticação separada da lógica de cursos
- Views especializadas por funcionalidade

## Segurança

- Senhas armazenadas em formato hash SHA256
- Validação de entrada de dados
- Prevenção de duplicação de usuários
- Sistema de autenticação baseado em sessão

## Notas de Desenvolvimento

Este projeto foi desenvolvido com propósitos didáticos. O sistema de autenticação utiliza dados em memória e não implementa persistência em banco de dados ou comunicação com APIs externas.

Para uso em produção, considere:
- Implementação de backend seguro
- Persistência com SwiftData ou CoreData
- Validação de senha mais robusta
- Integração com sistemas de autenticação externos
- Criptografia adicional para dados sensíveis

## Licença

Este projeto é de código aberto e está disponível para fins educacionais.

## Autor

Paulo Matheus
