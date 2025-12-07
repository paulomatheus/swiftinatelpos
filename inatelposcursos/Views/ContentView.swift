//
//  ContentView.swift
//  inatelposcursos
//
//  Created by Paulo Matheus on 06/12/25.
//

import SwiftUI

struct ContentView: View {
    let appBlue = Color(red: 0/255, green: 102/255, blue: 204/255)
    @State private var viewModel = HomeViewModel()

    var body: some View {
        TabView {
            HomeView(viewModel: viewModel, appBlue: appBlue)
                .tabItem {
                    Label("Início", systemImage: "house.fill")
                }
            
            MyCoursesView(viewModel: viewModel, appBlue: appBlue)
                .tabItem {
                    Label("Meus Cursos", systemImage: "books.vertical.fill")
                }
        }
        .accentColor(appBlue)
    }
}
#Preview {
    ContentView()
}
