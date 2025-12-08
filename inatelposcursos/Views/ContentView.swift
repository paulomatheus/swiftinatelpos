//
//  ContentView.swift
//  inatelposcursos
//
//  Created by Paulo Matheus on 06/12/25.
//

import SwiftUI

struct ContentView: View {
    let appBlue = Color(red: 0/255, green: 102/255, blue: 204/255)
    let logoBlue = Color(red: 35/255, green: 130/255, blue: 161/255)  // #2382A1
    
    @State private var homeViewModel = HomeViewModel()
    @State private var authViewModel = AuthViewModel()
    
    var body: some View {
        if authViewModel.isAuthenticated {
            NavigationStack {
                TabView {
                    HomeView(viewModel: homeViewModel, appBlue: appBlue, logoBlue: logoBlue)
                        .tabItem {
                            Label("Início", systemImage: "house.fill")
                        }
                    
                    MyCoursesView(viewModel: homeViewModel, appBlue: appBlue, logoBlue: logoBlue)
                        .tabItem {
                            Label("Meus Cursos", systemImage: "books.vertical.fill")
                        }
                }
                .accentColor(appBlue)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        UserMenuView(authViewModel: authViewModel, appBlue: appBlue)
                    }
                }
            }
            .sheet(isPresented: $authViewModel.showAddUserSheet) {
                AddUserSheetView(authViewModel: authViewModel, appBlue: appBlue)
            }
        } else {
            LoginView(authViewModel: authViewModel, appBlue: appBlue)
        }
    }
}

#Preview {
    ContentView()
}
