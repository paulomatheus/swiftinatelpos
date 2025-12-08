//
//  Course.swift
//  inatelposcursos
//
//  Created by Paulo Matheus on 07/12/25.
//

import Foundation

struct Course: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let description: String
    let detailedDescription: String
    let subjects: [Subject]
    let workload: Int
    let pricingOptions: [InstallmentOption]
}
