//
//  UserMenuView.swift
//  inatelposcursos
//
//  Created by Paulo Matheus on 07/12/25.
//

import SwiftUI

struct UserMenuView: View {
    @Bindable var authViewModel: AuthViewModel
    let appBlue: Color
    
    var body: some View {
        HStack(spacing: 15) {
            Menu {
                Button(action: {}) {
                    Label(authViewModel.currentUser?.username ?? "Usuário",
                          systemImage: "person.fill")
                }
                .disabled(true)
                
                Divider()
                
                ForEach(authViewModel.users) { user in
                    Button(action: {
                        authViewModel.switchUser(to: user)
                    }) {
                        HStack {
                            Text(user.username)
                            if user.id == authViewModel.currentUser?.id {
                                Image(systemName: "checkmark")
                            }
                        }
                    }
                    .disabled(user.id == authViewModel.currentUser?.id)
                }
            } label: {
                HStack {
                    Image(systemName: "person.circle.fill")
                        .font(.title2)
                    Text(authViewModel.currentUser?.username ?? "Usuário")
                        .font(.headline)
                    Image(systemName: "chevron.down")
                        .font(.caption)
                }
                .foregroundColor(appBlue)
            }
            
            Button(action: {
                authViewModel.showAddUserSheet = true
            }) {
                Image(systemName: "person.badge.plus")
                    .font(.title2)
                    .foregroundColor(appBlue)
            }
            
            Button(action: {
                authViewModel.logout()
            }) {
                Image(systemName: "rectangle.portrait.and.arrow.right")
                    .font(.title2)
                    .foregroundColor(.red)
            }
        }
    }
}

#Preview {
    NavigationStack {
        VStack {
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                UserMenuView(
                    authViewModel: {
                        let vm = AuthViewModel()
                        vm.currentUser = vm.users[0]
                        vm.isAuthenticated = true
                        return vm
                    }(),
                    appBlue: Color(red: 0/255, green: 102/255, blue: 204/255)
                )
            }
        }
    }
}
