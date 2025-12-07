//
//  MockData.swift
//  inatelposcursos
//
//  Created by Paulo Matheus on 07/12/25.
//

import Foundation

import Foundation

struct MockData {
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
    
    static let courses: [Course] = [
        Course(
            name: "DESENVOLVIMENTO MOBILE E CLOUD COMPUTING",
            description: "Aplicações modernas na nuvem e dispositivos móveis.",
            detailedDescription: "Domine o desenvolvimento de aplicações móveis nativas e híbridas, integradas com cloud computing, web services e as principais plataformas do mercado.",
            subjects: mobileCloudSubjects
        ),
        Course(
            name: "ENGENHARIA DE SOFTWARE",
            description: "Arquitetura, padrões e desenvolvimento ágil.",
            detailedDescription: "Aprofunde-se em metodologias ágeis, arquitetura de microsserviços e padrões de projeto para criar softwares robustos e escaláveis.",
            subjects: []
        ),
        Course(
            name: "MBA EM GESTÃO EM NEGÓCIOS TECNOLÓGICOS",
            description: "Liderança e inovação no mercado tech.",
            detailedDescription: "Desenvolva habilidades de liderança estratégica, gestão de produtos digitais e inovação corporativa.",
            subjects: []
        ),
        Course(
            name: "TECNOLOGIAS EMERGENTES PARA A INDÚSTRIA",
            description: "IoT, IA e Indústria 4.0.",
            detailedDescription: "Explore o impacto da Internet das Coisas, Inteligência Artificial e automação no cenário industrial moderno.",
            subjects: []
        ),
        Course(
            name: "ENGENHARIA DE REDES E SISTEMAS DE TELECOMUNICAÇÕES",
            description: "Infraestrutura e protocolos de comunicação.",
            detailedDescription: "Estudo avançado de protocolos de rede, fibra óptica e infraestrutura de telecomunicações.",
            subjects: []
        ),
        Course(
            name: "REDES COMUNICAÇÕES MÓVEIS 5G",
            description: "A revolução da conectividade móvel.",
            detailedDescription: "Compreenda a arquitetura, latência e casos de uso da tecnologia 5G e seu impacto na sociedade.",
            subjects: []
        ),
        Course(
            name: "TRANSFORMAÇÃO DIGITAL",
            description: "Digitalização de processos e cultura.",
            detailedDescription: "Estratégias para digitalizar processos tradicionais e mudar a cultura organizacional para o digital.",
            subjects: []
        ),
        Course(
            name: "TECNOLOGIAS DISRUPTIVAS E GESTÃO EM SAÚDE",
            description: "Inovação tecnológica aplicada à medicina.",
            detailedDescription: "Aplicação de Big Data, Telemedicina e IA para otimizar a gestão e o atendimento na área da saúde.",
            subjects: []
        )
    ]
    
    static let pricingOptions: [InstallmentOption] = [
        InstallmentOption(count: 24, value: "R$ 1.099,00"),
        InstallmentOption(count: 18, value: "R$ 1.428,70"),
        InstallmentOption(count: 12, value: "R$ 2.089,48"),
        InstallmentOption(count: 6, value: "R$ 4.074,47"),
        InstallmentOption(count: 3, value: "R$ 7.945,22"),
        InstallmentOption(count: 1, value: "R$ 23.239,78")
    ]
}
