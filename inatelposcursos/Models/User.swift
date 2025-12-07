//
//  User.swift
//  inatelposcursos
//
//  Created by Paulo Matheus on 07/12/25.
//

import Foundation

struct User: Identifiable, Codable {
    let id: UUID
    let username: String
    let passwordHash: String
    
    init(id: UUID = UUID(), username: String, passwordHash: String) {
        self.id = id
        self.username = username
        self.passwordHash = passwordHash
    }
}
