//
//  UsersMock.swift
//  inatelposcursos
//
//  Created by Paulo Matheus on 07/12/25.
//

import Foundation

import Foundation
import CryptoKit

struct UsersMock {    static func hashPassword(_ password: String) -> String {
        let data = Data(password.utf8)
        let hashed = SHA256.hash(data: data)
        return hashed.compactMap { String(format: "%02x", $0) }.joined()
    }
    
    static var mockUsers: [User] = [
        User(username: "admin", passwordHash: hashPassword("123")),
        User(username: "aluno", passwordHash: hashPassword("senha")),
        User(username: "professor", passwordHash: hashPassword("abc"))
    ]
}
