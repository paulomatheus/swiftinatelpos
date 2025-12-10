import SwiftUI

struct LoginView: View {
    @Bindable var authViewModel: AuthViewModel
    let appBlue: Color
    @State private var isButtonPressed = false
    
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
                Image("predio5")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 300, height: 200)
                    .foregroundColor(.white)
                
                Text("Inatel Pós-Graduação")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                
                Spacer()
                
                VStack(spacing: 20) {
                    HStack(spacing: 12) {
                        Image(systemName: "person.fill")
                            .foregroundColor(appBlue.opacity(0.7))
                            .frame(width: 20)
                        
                        TextField("Usuário", text: $authViewModel.username)
                            .textFieldStyle(.plain)
                            .autocapitalization(.none)
                            .autocorrectionDisabled()
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(15)
                    .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
                    
                    HStack(spacing: 12) {
                        Image(systemName: "lock.fill")
                            .foregroundColor(appBlue.opacity(0.7))
                            .frame(width: 20)
                        
                        SecureField("Senha", text: $authViewModel.password)
                            .textFieldStyle(.plain)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(15)
                    .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
                    
                    Button(action: {
                        authViewModel.login()
                    }) {
                        HStack(spacing: 10) {
                            Text("Entrar")
                                .font(.system(size: 18, weight: .semibold))
                            
                            Image(systemName: "arrow.right.circle.fill")
                                .font(.system(size: 20))
                        }
                        .foregroundColor(appBlue)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.white)
                                .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: 4)
                        )
                    }
                    .scaleEffect(isButtonPressed ? 0.95 : 1.0)
                    .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isButtonPressed)
                    .simultaneousGesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged { _ in
                                isButtonPressed = true
                            }
                            .onEnded { _ in
                                isButtonPressed = false
                            }
                    )
                    .padding(.top, 10)
                    
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
