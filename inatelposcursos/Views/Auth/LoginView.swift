//
//  LoginView.swift
//  inatelposcursos
//
//  Created by Paulo Matheus on 07/12/25.
//

import SwiftUI

struct LoginView: View {
    @Bindable var authViewModel: AuthViewModel
    let appBlue: Color
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [appBlue, appBlue.opacity(0.7)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 30) {
                Spacer()
                Image(systemName: "graduationcap.circle.fill")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.white)
                
                Text("Inatel Pós-Graduação")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                
                Spacer()
                
                VStack(spacing: 20) {
                    TextField("Usuário", text: $authViewModel.username)
                        .textFieldStyle(.plain)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .autocapitalization(.none)
                    
                    SecureField("Senha", text: $authViewModel.password)
                        .textFieldStyle(.plain)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                    
                    Button(action: {
                        authViewModel.login()
                    }) {
                        Text("Entrar")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white)
                            .foregroundColor(appBlue)
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal, 40)
                
                Spacer()
            }
        }
        .alert("Erro", isPresented: $authViewModel.showLoginError) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(authViewModel.loginErrorMessage)
        }
    }
}

#Preview {
    LoginView(
        authViewModel: AuthViewModel(),
        appBlue: Color(red: 0/255, green: 102/255, blue: 204/255)
    )
}
