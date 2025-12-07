//
//  MockData.swift
//  inatelposcursos
//
//  Created by Paulo Matheus on 07/12/25.
//

import Foundation

import Foundation

struct MockData {
    static let courses: [Course] = [
        Course(
            name: "ENGENHARIA DE SOFTWARE",
            description: "Arquitetura, padrões e desenvolvimento ágil.",
            detailedDescription: "Aprofunde-se em metodologias ágeis, arquitetura de microsserviços e padrões de projeto para criar softwares robustos e escaláveis."
        ),
        Course(
            name: "MBA EM GESTÃO EM NEGÓCIOS TECNOLÓGICOS",
            description: "Liderança e inovação no mercado tech.",
            detailedDescription: "Desenvolva habilidades de liderança estratégica, gestão de produtos digitais e inovação corporativa."
        ),
        Course(
            name: "TECNOLOGIAS EMERGENTES PARA A INDÚSTRIA",
            description: "IoT, IA e Indústria 4.0.",
            detailedDescription: "Explore o impacto da Internet das Coisas, Inteligência Artificial e automação no cenário industrial moderno."
        ),
        Course(
            name: "ENGENHARIA DE REDES E SISTEMAS DE TELECOMUNICAÇÕES",
            description: "Infraestrutura e protocolos de comunicação.",
            detailedDescription: "Estudo avançado de protocolos de rede, fibra óptica e infraestrutura de telecomunicações."
        ),
        Course(
            name: "REDES COMUNICAÇÕES MÓVEIS 5G",
            description: "A revolução da conectividade móvel.",
            detailedDescription: "Compreenda a arquitetura, latência e casos de uso da tecnologia 5G e seu impacto na sociedade."
        ),
        Course(
            name: "TRANSFORMAÇÃO DIGITAL",
            description: "Digitalização de processos e cultura.",
            detailedDescription: "Estratégias para digitalizar processos tradicionais e mudar a cultura organizacional para o digital."
        ),
        Course(
            name: "TECNOLOGIAS DISRUPTIVAS E GESTÃO EM SAÚDE",
            description: "Inovação tecnológica aplicada à medicina.",
            detailedDescription: "Aplicação de Big Data, Telemedicina e IA para otimizar a gestão e o atendimento na área da saúde."
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
