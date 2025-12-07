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
                                VStack(spacing: 20) {
                                    Image(systemName: "laptopcomputer.and.iphone")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: 80)
                                        .foregroundColor(appBlue)
                                    
                                    Text(viewModel.courses[index].name)
                                        .font(.title3)
                                        .bold()
                                        .foregroundColor(.black)
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal)
                                    
                                    Text(viewModel.courses[index].description)
                                        .font(.body)
                                        .foregroundColor(.gray)
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal)
                                    
                                    Text("Toque para ver detalhes")
                                        .font(.caption)
                                        .foregroundColor(appBlue)
                                        .padding(.top, 10)
                                }
                                .padding()
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(Color.white)
                                .cornerRadius(20)
                                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
                                .padding()
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
                CourseDetailView(course: course, appBlue: appBlue)
            }
            .sheet(isPresented: $viewModel.showPaymentSheet) {
                VStack {
                    Text("Forma de Pagamento")
                        .font(.title2)
                        .bold()
                        .padding(.top)
                    
                    Text("Escolha o parcelamento")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Picker("Parcelas", selection: $viewModel.selectedInstallmentIndex) {
                        ForEach(0..<viewModel.pricingOptions.count, id: \.self) { index in
                            Text(viewModel.pricingOptions[index].label)
                        }
                    }
                    .pickerStyle(.wheel)
                    .labelsHidden()
                    
                    Button(action: {
                        viewModel.confirmEnrollment()
                    }) {
                        Text("Confirmar Inscrição")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(appBlue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding()
                }
                .presentationDetents([.height(400)])
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

struct CourseDetailView: View {
    let course: Course
    let appBlue: Color
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Spacer()
                    Image(systemName: "laptopcomputer.and.iphone")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 120)
                        .foregroundColor(appBlue)
                    Spacer()
                }
                .padding(.top, 40)
                
                Text(course.name)
                    .font(.title)
                    .bold()
                    .foregroundColor(appBlue)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                
                Divider()
                
                Text("Sobre o Curso")
                    .font(.title2)
                    .bold()
                
                Text(course.detailedDescription)
                    .font(.body)
                    .foregroundColor(.gray)
                    .lineSpacing(5)
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Detalhes")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ContentView()
}
