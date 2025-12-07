//
//  AddUserSheetView.swift
//  inatelposcursos
//
//  Created by Paulo Matheus on 07/12/25.
//

import SwiftUI

struct AddUserSheetView: View {
    @Bindable var authViewModel: AuthViewModel
    let appBlue: Color
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Novo Usuário")) {
                    TextField("Nome de usuário", text: $authViewModel.newUsername)
                        .autocapitalization(.none)
                    
                    SecureField("Senha", text: $authViewModel.newPassword)
                }
            }
            .navigationTitle("Adicionar Usuário")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") {
                        authViewModel.newUsername = ""
                        authViewModel.newPassword = ""
                        authViewModel.showAddUserSheet = false
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Adicionar") {
                        authViewModel.addNewUser()
                    }
                    .bold()
                    .foregroundColor(appBlue)
                }
            }
            .alert("Erro", isPresented: $authViewModel.showAddUserError) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(authViewModel.addUserErrorMessage)
            }
        }
    }
}
