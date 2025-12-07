//
//  ContentView.swift
//  inatelposcursos
//
//  Created by Paulo Matheus on 06/12/25.
//

import SwiftUI

struct InstallmentOption: Hashable {
    let count: Int
    let value: String
    
    var label: String {
        return "\(count)x \(value)"
    }
}


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


struct HomeView: View {
    @Bindable var viewModel: HomeViewModel
    let appBlue: Color
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.white.ignoresSafeArea()
                
                VStack {
                    HStack {
                        Image(systemName: "graduationcap.fill")
                            .font(.title)
                            .foregroundColor(appBlue)
                        Text("Cursos de Pós-Graduação")
                            .font(.title3)
                            .bold()
                            .foregroundColor(.black)
                        Spacer()
                    }
                    .padding()
                    
                    TabView(selection: $viewModel.currentCourseIndex) {
                        ForEach(0..<viewModel.courses.count, id: \.self) { index in
                            NavigationLink(value: viewModel.courses[index]) {
                                CourseCardView(course: viewModel.courses[index], appBlue: appBlue)
                            }
                            .tag(index)
                        }
                    }
                    .tabViewStyle(.page(indexDisplayMode: .always))
                    .indexViewStyle(.page(backgroundDisplayMode: .always))
                    
                    VStack {
                        let currentCourse = viewModel.currentCourse
                        let isEnrolled = viewModel.isCurrentCourseEnrolled

                        Button(action: {
                            viewModel.openPaymentSheet(for: currentCourse)
                        }) {
                            Text(isEnrolled ? "Já Matriculado" : "Inscreva-se")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(isEnrolled ? Color.gray : appBlue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .disabled(isEnrolled)
                        .padding()
                    }
                }
            }
            .navigationDestination(for: Course.self) { course in
                CourseDetailView(course: course, viewModel: viewModel, appBlue: appBlue)
            }
            .sheet(isPresented: $viewModel.showPaymentSheet) {
                PaymentSheetView(viewModel: viewModel, appBlue: appBlue)
            }
            .alert("Sucesso", isPresented: $viewModel.showSuccessAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text("Sua inscrição foi realizada com sucesso!")
            }
        }
    }
}

struct MyCoursesView: View {
    var viewModel: HomeViewModel
    let appBlue: Color
    
    var myCourses: [Course] {
        return viewModel.getEnrolledCourses()
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                if myCourses.isEmpty {
                    VStack(spacing: 20) {
                        Image(systemName: "books.vertical")
                            .font(.system(size: 60))
                            .foregroundColor(.gray.opacity(0.5))
                        Text("Você ainda não possui cursos.")
                            .font(.title3)
                            .foregroundColor(.gray)
                        Text("Visite a aba Início para se matricular.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                } else {
                    List(myCourses) { course in
                        HStack {
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundColor(appBlue)
                                .font(.largeTitle)
                            
                            VStack(alignment: .leading) {
                                Text(course.name)
                                    .font(.headline)
                                    .foregroundColor(.black)
                                Text("Em andamento")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .padding(.vertical, 8)
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Meus Cursos")
        }
    }
}


#Preview {
    ContentView()
}
