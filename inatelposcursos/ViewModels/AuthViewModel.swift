//
//  AuthViewModel.swift
//  inatelposcursos
//
//  Created by Paulo Matheus on 07/12/25.
//

import Foundation
import CryptoKit

@Observable
class AuthViewModel {
    var users: [User] = UsersMock.mockUsers
    var currentUser: User?
    var isAuthenticated = false
    var username = ""
    var password = ""
    var showLoginError = false
    var loginErrorMessage = ""
    
    var showAddUserSheet = false
    var newUsername = ""
    var newPassword = ""
    var showAddUserError = false
    var addUserErrorMessage = ""
    
    func login() {
        let passwordHash = hashPassword(password)
        
        if let user = users.first(where: {
            $0.username == username && $0.passwordHash == passwordHash
        }) {
            currentUser = user
            isAuthenticated = true
            username = ""
            password = ""
        } else {
            loginErrorMessage = "Usuário ou senha incorretos"
            showLoginError = true
        }
    }
    
    func logout() {
        currentUser = nil
        isAuthenticated = false
    }
    
    func addNewUser() {
        if users.contains(where: { $0.username == newUsername }) {
            addUserErrorMessage = "Nome de usuário já existe"
            showAddUserError = true
            return
        }
        
        if newUsername.isEmpty || newPassword.isEmpty {
            addUserErrorMessage = "Preencha todos os campos"
            showAddUserError = true
            return
        }
        
        let newUser = User(
            username: newUsername,
            passwordHash: hashPassword(newPassword)
        )
        
        users.append(newUser)
        
        newUsername = ""
        newPassword = ""
        showAddUserSheet = false
    }
    
    func switchUser(to user: User) {
        currentUser = user
    }
    
    private func hashPassword(_ password: String) -> String {
        let data = Data(password.utf8)
        let hashed = SHA256.hash(data: data)
        return hashed.compactMap { String(format: "%02x", $0) }.joined()
    }
}
