//
//  MockData.swift
//  inatelposcursos
//
//  Created by Paulo Matheus on 07/12/25.
//

import Foundation

struct MockData {
    // MARK: - Mobile and Cloud Computing Subjects
    static let mobileCloudSubjects: [Subject] = [
        Subject(name: "Conceituação e projeto de WebServices e interface de serviço em Java: SOAP e REST"),
        Subject(name: "Desenvolvimento de Web Services com segurança sob plataforma .NET"),
        Subject(name: "Big Data e análise de dados"),
        Subject(name: "Desenvolvimento JavaEE"),
        Subject(name: "Conceituação em cloud computing, programação OO, Web Services e SOA"),
        Subject(name: "Desenvolvimento de serviço SOAP com WCF em C#"),
        Subject(name: "Desenvolvimento de aplicações com segurança no ambiente Amazon Web Services"),
        Subject(name: "Desenvolvimento de Web Services com segurança sob plataforma Node.js"),
        Subject(name: "Desenvolvimento de Web Services com segurança em Java no Google App Engine"),
        Subject(name: "Introdução ao desenvolvimento de jogos para dispositivos móveis"),
        Subject(name: "Desenvolvimento de jogos com Unity"),
        Subject(name: "Tópicos avançados em cloud computing, mobile e tendências de mercado (seminários)"),
        Subject(name: "Introdução ao desenvolvimento Web: HTML5, CSS3 e JavaScript"),
        Subject(name: "Desenvolvimento híbrido de aplicativos móveis"),
        Subject(name: "Desenvolvimento de aplicativos em Kotlin para Android com Firebase"),
        Subject(name: "Desenvolvimento de aplicativos em Swift para iOS")
    ]
    
    // MARK: - Software Engineering Subjects
    static let softwareEngineeringSubjects: [Subject] = [
        Subject(name: "Módulo de Nivelamento: Fundamentos de Programação, Lógica e Versionamento"),
        Subject(name: "Engenharia de Requisitos"),
        Subject(name: "Arquitetura e Modelagem da Solução"),
        Subject(name: "Desenvolvimento Frontend (UX/UI)"),
        Subject(name: "Revisão de Código: Boas Práticas e Ferramentas"),
        Subject(name: "Observabilidade de Sistemas em Produção"),
        Subject(name: "Gestão de Carreiras"),
        Subject(name: "Contrato com Cliente e Priorização de Backlog"),
        Subject(name: "Estimativas, Planejamento e Gestão Ágil"),
        Subject(name: "Desenvolvimento Backend"),
        Subject(name: "Qualidade de Software"),
        Subject(name: "DevOps: Integração Contínua e Entregas Ágeis"),
        Subject(name: "Tópicos Especiais"),
        Subject(name: "Tecnologias e Negócios Emergentes")
    ]
    
    // MARK: - MBA Tech Business Subjects
    static let mbaTechBusinessSubjects: [Subject] = [
        Subject(name: "Economia Empresarial"),
        Subject(name: "Contabilidade e Custos"),
        Subject(name: "Gestão de Pessoas e Organizações"),
        Subject(name: "Tópicos Especiais I"),
        Subject(name: "Gestão de Marketing"),
        Subject(name: "Gestão do Conhecimento e Inovação"),
        Subject(name: "Empreendedorismo"),
        Subject(name: "Gerenciamento Estratégico de Tecnologia e Inovação e o Ambiente de Negócios"),
        Subject(name: "Gestão de Carreiras"),
        Subject(name: "Gestão de Projetos"),
        Subject(name: "Engenharia Econômica"),
        Subject(name: "Finanças Corporativas"),
        Subject(name: "Gestão e Transformação Estratégica de Empresas Orientadas à Inovação"),
        Subject(name: "Modelos Quantitativos para Tomada de Decisão"),
        Subject(name: "Tópicos Especiais II"),
        Subject(name: "Gestão de Mudanças"),
        Subject(name: "Tópicos Especiais"),
        Subject(name: "Tecnologias e Negócios Emergentes")
    ]
    
    // MARK: - Emerging Technologies for Industry Subjects
    static let emergingTechIndustrySubjects: [Subject] = [
        Subject(name: "Tópicos Especiais"),
        Subject(name: "Manufatura Aditiva e Impressão 3D"),
        Subject(name: "Robótica Industrial"),
        Subject(name: "Instrumentação Industrial"),
        Subject(name: "Padrões de Comunicação Industrial"),
        Subject(name: "Atividades de Integração"),
        Subject(name: "Fundamentos de IIoT (Internet Industrial das Coisas)"),
        Subject(name: "Fundamentos de Segurança Cibernética"),
        Subject(name: "Programação em Python"),
        Subject(name: "Inteligência Artificial e Machine Learning"),
        Subject(name: "Tecnologias e Negócios Emergentes"),
        Subject(name: "Introdução à Manufatura Avançada"),
        Subject(name: "Drives e Acionamentos Elétricos"),
        Subject(name: "Sistemas Pneumáticos e Aplicações"),
        Subject(name: "Controladores Programáveis"),
        Subject(name: "Sistemas Supervisórios"),
        Subject(name: "Sistemas Embarcados"),
        Subject(name: "Banco de dados"),
        Subject(name: "Dashboards Industriais"),
        Subject(name: "Fundamentos de Ciência de Dados"),
        Subject(name: "Sistemas de Visão Industriais"),
        Subject(name: "Gestão de Carreiras")
    ]
    
    // MARK: - Network Engineering and Telecom Subjects
    static let networkEngineeringSubjects: [Subject] = [
        Subject(name: "Tópicos Especiais"),
        Subject(name: "Modulação Digital"),
        Subject(name: "Sistemas Radioenlaces Digitais - Terrestre"),
        Subject(name: "Fundamentos de Comunicações Móveis"),
        Subject(name: "Padrões de Comunicações Móveis"),
        Subject(name: "Televisão Digital"),
        Subject(name: "Redes de Acesso e Transporte"),
        Subject(name: "Redes IP"),
        Subject(name: "Análise de Desempenho e Dimensionamento de Redes de Telecomunicações"),
        Subject(name: "Gerência de Redes"),
        Subject(name: "Redes Convergentes"),
        Subject(name: "Tecnologias e Negócios Emergentes"),
        Subject(name: "Introdução à Teoria da Informação: Codificação de Fonte e Canal"),
        Subject(name: "Fundamentos de Antenas e Propagação"),
        Subject(name: "Sistemas Radioenlaces Digitais - Satélite"),
        Subject(name: "Técnicas de Diversidade e Transmissão com Múltiplas Portadoras"),
        Subject(name: "Comunicações e Redes Ópticas"),
        Subject(name: "Introdução às Redes de Telecomunicações"),
        Subject(name: "Padrões de Redes de Comunicação sem fio"),
        Subject(name: "Redes MPLS e GMPLS e SR"),
        Subject(name: "Segurança em Redes de Telecomunicações"),
        Subject(name: "Redes Multimídia e Qualidade de Serviço"),
        Subject(name: "Gestão de Carreiras")
    ]
    
    // MARK: - 5G Mobile Networks Subjects
    static let fiveGSubjects: [Subject] = [
        Subject(name: "Fundamentos em Telecomunicações em Rádio Digital"),
        Subject(name: "Fundamentos em Telecomunicações em Tecnologias Facilitadoras"),
        Subject(name: "Infraestrutura e produtos de Rede de Acesso 5G"),
        Subject(name: "Integração, Operação e Manutenção da Rede de Acesso 5G"),
        Subject(name: "Otimização e Troubleshooting da Rede de Acesso 5G"),
        Subject(name: "Infraestrutura de Redes de Transporte"),
        Subject(name: "Integração, Operação e Manutenção para Rede de Transporte"),
        Subject(name: "Fundamentos de Rede Core 5G"),
        Subject(name: "Planejamento e Design do Core 5G"),
        Subject(name: "Monitoramento e Troubleshooting do Core 5G"),
        Subject(name: "Produtos e Softwares para Infraestrutura de TI"),
        Subject(name: "Integração, Operação e Manutenção para Infraestrutura de TI"),
        Subject(name: "Fundamentos de Cibersegurança"),
        Subject(name: "Tecnologias de Proteção e Análise de Ameaças na Rede 5G"),
        Subject(name: "Solução de Redes 5G para a Indústria"),
        Subject(name: "Solução de Redes 5G para Smart Grid"),
        Subject(name: "Solução de Redes 5G para Smart Cities"),
        Subject(name: "Aplicações Inovadoras no 5G"),
        Subject(name: "Impacto Estratégico do 5G no Mercado de ICT"),
        Subject(name: "Perspectiva Futura da Rede 6G"),
        Subject(name: "Desafios, Riscos e Barreiras para Adoção de IA em Redes Móveis"),
        Subject(name: "Fundamentos em Telecomunicações em Sistemas Celulares e Ópticos"),
        Subject(name: "Fundamentos de Redes de Acesso em 5G"),
        Subject(name: "Planejamento e Design de Rede de Acesso 5G SA"),
        Subject(name: "Drive Test e Análise da Rede de Acesso 5G"),
        Subject(name: "Fundamentos de Redes de Transporte"),
        Subject(name: "Planejamento e Design para Redes de Transporte"),
        Subject(name: "Monitoramento e Troubleshooting para Redes de Transporte"),
        Subject(name: "Infraestrutura e Produtos da Rede Core 5G"),
        Subject(name: "Integração, Operação e Manutenção do Core 5G"),
        Subject(name: "Fundamentos de Infraestrutura de TI"),
        Subject(name: "Planejamento e Design para Infraestrutura de TI"),
        Subject(name: "Monitoramento e Troubleshooting para Infraestrutura de TI"),
        Subject(name: "Tópicos de Segurança na Rede 5G"),
        Subject(name: "Fundamentos de 5G para as Principais Verticais do Mercado"),
        Subject(name: "Solução de Redes 5G para o Agronegócio"),
        Subject(name: "Solução de Redes 5G para eHealth"),
        Subject(name: "Fundamentos de 5G para Executivos"),
        Subject(name: "Regulação e Gestão do Espectro no 5G"),
        Subject(name: "Modelos de Negócios para o 5G"),
        Subject(name: "IA aplicada a Redes Móveis e 6G: Mercado e Aplicações"),
        Subject(name: "Aplicações e Soluções de IA em Redes 5G e Evolução para 6G")
    ]
    
    // MARK: - Digital Transformation Subjects
    static let digitalTransformationSubjects: [Subject] = [
        Subject(name: "IOT (Internet das Coisas)"),
        Subject(name: "Softwarização de Redes"),
        Subject(name: "Segurança Cibernética"),
        Subject(name: "WEB 3.0"),
        Subject(name: "Inteligência Artificial e Machine Learning"),
        Subject(name: "Metaverso"),
        Subject(name: "Robótica"),
        Subject(name: "Cidades Inteligentes"),
        Subject(name: "Tecnologias na Agricultura 4.0"),
        Subject(name: "Gestão e Transformação Estratégica de Empresas Orientadas à Inovação"),
        Subject(name: "Novas Gerações de Redes Móveis 5G/6G"),
        Subject(name: "Cloud Computing"),
        Subject(name: "Blockchain"),
        Subject(name: "Big Data e Analytics"),
        Subject(name: "Visão Computacional"),
        Subject(name: "Computação e Redes Quânticas"),
        Subject(name: "Indústria 4.0"),
        Subject(name: "Saúde 4.0"),
        Subject(name: "Gestão ágil de projetos")
    ]
    
    // MARK: - Disruptive Tech and Health Management Subjects
    static let disruptiveTechHealthSubjects: [Subject] = [
        Subject(name: "Atividade Integradora 1"),
        Subject(name: "Atividade Integradora 3"),
        Subject(name: "Tecnologias Móveis e Internet das Coisas - IoT: Como monitorar seu hospital e empresa à distância"),
        Subject(name: "Saúde 4.0 e Atualização Tecnológica"),
        Subject(name: "Design Thinking e UX: como melhorar a experiência do paciente"),
        Subject(name: "Gestão, Inovação e Transformação Estratégica: como fazer sua empresa ou hospital navegar no mundo da Saúde 4.0"),
        Subject(name: "Metaverso aplicado à Saúde"),
        Subject(name: "Gestão de Carreiras"),
        Subject(name: "Atividade Integradora 2"),
        Subject(name: "AI Revolution na Medicina Personalizada: análise de dados e visão computacional"),
        Subject(name: "Health Analytics: aplicações de Cloud Computing, Big Data e Cibersegurança"),
        Subject(name: "Engenharia Clínica e Certificação de Qualidade: como gerenciar o parque tecnológico de um EAS e atender às normas"),
        Subject(name: "Tomada de Decisão e Processos: como usar modelos quantitativos para inovar sem onerar"),
        Subject(name: "Nanotecnologia e Engenharia Genética para Diagnósticos e Terapias"),
        Subject(name: "Impressão 3D e Bioprinting em Medicina"),
        Subject(name: "Tecnologias e Negócios Emergentes")
    ]
    
    // MARK: - Pricing Options
    static let standardPricing: [InstallmentOption] = [
        InstallmentOption(count: 24, value: "R$ 1.099,00"),
        InstallmentOption(count: 18, value: "R$ 1.428,70"),
        InstallmentOption(count: 12, value: "R$ 2.089,48"),
        InstallmentOption(count: 6, value: "R$ 4.074,47"),
        InstallmentOption(count: 3, value: "R$ 7.945,22"),
        InstallmentOption(count: 1, value: "R$ 23.239,78")
    ]
    
    static let fiveGPricing: [InstallmentOption] = [
        InstallmentOption(count: 24, value: "R$ 1.204,13"),
        InstallmentOption(count: 18, value: "R$ 1.408,33"),
        InstallmentOption(count: 12, value: "R$ 1.802,65"),
        InstallmentOption(count: 6, value: "R$ 3.408,16"),
        InstallmentOption(count: 3, value: "R$ 6.422,00"),
        InstallmentOption(count: 1, value: "R$ 16.900,00")
    ]
    
    static let digitalTransformationPricing: [InstallmentOption] = [
        InstallmentOption(count: 24, value: "R$ 599,00"),
        InstallmentOption(count: 18, value: "R$ 699,00"),
        InstallmentOption(count: 12, value: "R$ 899,00"),
        InstallmentOption(count: 6, value: "R$ 1.689,00"),
        InstallmentOption(count: 3, value: "R$ 3.199,00"),
        InstallmentOption(count: 1, value: "R$ 8.399,00")
    ]
    
    // MARK: - Courses
    static let courses: [Course] = [
        Course(
            name: "DESENVOLVIMENTO MOBILE E CLOUD COMPUTING",
            description: "Aplicações modernas na nuvem e dispositivos móveis.",
            detailedDescription: "Domine o desenvolvimento de aplicações móveis nativas e híbridas, integradas com cloud computing, web services e as principais plataformas do mercado.",
            subjects: mobileCloudSubjects,
            workload: 368,
            pricingOptions: standardPricing,
            logoName: nil
        ),
        Course(
            name: "ENGENHARIA DE SOFTWARE APLICADA",
            description: "Arquitetura, padrões e desenvolvimento ágil.",
            detailedDescription: "Aprofunde-se em metodologias ágeis, arquitetura de microsserviços e padrões de projeto para criar softwares robustos e escaláveis.",
            subjects: softwareEngineeringSubjects,
            workload: 368,
            pricingOptions: standardPricing,
            logoName: "logo_engenharia-de-software-online-removebg-preview"
        ),
        Course(
            name: "MBA EM GESTÃO EM NEGÓCIOS TECNOLÓGICOS",
            description: "Liderança e inovação no mercado tech.",
            detailedDescription: "Desenvolva habilidades de liderança estratégica, gestão de produtos digitais e inovação corporativa.",
            subjects: mbaTechBusinessSubjects,
            workload: 368,
            pricingOptions: standardPricing,
            logoName: "logo_mba-gestao-empresarial-em-ambiente-tecnologico-online-removebg-preview"
        ),
        Course(
            name: "TECNOLOGIAS EMERGENTES PARA A INDÚSTRIA",
            description: "IoT, IA e Indústria 4.0.",
            detailedDescription: "Explore o impacto da Internet das Coisas, Inteligência Artificial e automação no cenário industrial moderno.",
            subjects: emergingTechIndustrySubjects,
            workload: 368,
            pricingOptions: standardPricing,
            logoName: "logo_tecnologias-emergentes-para-a-industria-online-removebg-preview"
        ),
        Course(
            name: "ENGENHARIA DE REDES E SISTEMAS DE TELECOMUNICAÇÕES",
            description: "Infraestrutura e protocolos de comunicação.",
            detailedDescription: "Estudo avançado de protocolos de rede, fibra óptica e infraestrutura de telecomunicações.",
            subjects: networkEngineeringSubjects,
            workload: 368,
            pricingOptions: standardPricing,
            logoName: "logo_engenharia-de-redes-e-sistemas-de-telecomunicacoes-online-removebg-preview"
        ),
        Course(
            name: "REDES COMUNICAÇÕES MÓVEIS 5G",
            description: "A revolução da conectividade móvel.",
            detailedDescription: "Compreenda a arquitetura, latência e casos de uso da tecnologia 5G e seu impacto na sociedade.",
            subjects: fiveGSubjects,
            workload: 438,
            pricingOptions: fiveGPricing,
            logoName: "logo_redes-5g-online-removebg-preview"
        ),
        Course(
            name: "TRANSFORMAÇÃO DIGITAL",
            description: "Digitalização de processos e cultura.",
            detailedDescription: "Estratégias para digitalizar processos tradicionais e mudar a cultura organizacional para o digital.",
            subjects: digitalTransformationSubjects,
            workload: 360,
            pricingOptions: digitalTransformationPricing,
            logoName: "logo_transformacao-digital-online-removebg-preview"
        ),
        Course(
            name: "TECNOLOGIAS DISRUPTIVAS E GESTÃO EM SAÚDE",
            description: "Inovação tecnológica aplicada à medicina.",
            detailedDescription: "Aplicação de Big Data, Telemedicina e IA para otimizar a gestão e o atendimento na área da saúde.",
            subjects: disruptiveTechHealthSubjects,
            workload: 360,
            pricingOptions: standardPricing,
            logoName: "logo_tecnologias-disruptivas-e-gestao-em-saude-hibrido-removebg-preview"
        )
    ]
}
