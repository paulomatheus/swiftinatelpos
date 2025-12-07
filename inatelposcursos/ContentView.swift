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
    
    @State private var enrolledCourseIDs: Set<UUID> = []
    
    var body: some View {
        TabView {
            HomeView(enrolledCourseIDs: $enrolledCourseIDs, appBlue: appBlue)
                .tabItem {
                    Label("Início", systemImage: "house.fill")
                }
            
            MyCoursesView(enrolledCourseIDs: enrolledCourseIDs, appBlue: appBlue)
                .tabItem {
                    Label("Meus Cursos", systemImage: "books.vertical.fill")
                }
        }
        .accentColor(appBlue)
    }
}


struct HomeView: View {
    @Binding var enrolledCourseIDs: Set<UUID>
    let appBlue: Color
    let courses = MockData.courses
    let pricingOptions = MockData.pricingOptions
    
    @State private var selectedCourse: Course?
    @State private var showPaymentSheet = false
    @State private var showSuccessAlert = false
    @State private var selectedInstallmentIndex = 0
    @State private var currentCourseIndex = 0
    
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
                    
                    TabView(selection: $currentCourseIndex) {
                        ForEach(0..<courses.count, id: \.self) { index in
                            NavigationLink(value: courses[index]) {
                                VStack(spacing: 20) {
                                    Image(systemName: "laptopcomputer.and.iphone")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: 80)
                                        .foregroundColor(appBlue)
                                    
                                    Text(courses[index].name)
                                        .font(.title3)
                                        .bold()
                                        .foregroundColor(.black)
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal)
                                    
                                    Text(courses[index].description)
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
                        let currentCourse = courses[currentCourseIndex]
                        let isEnrolled = enrolledCourseIDs.contains(currentCourse.id)
                        
                        Button(action: {
                            selectedCourse = currentCourse
                            showPaymentSheet = true
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
            .sheet(isPresented: $showPaymentSheet) {
                VStack {
                    Text("Forma de Pagamento")
                        .font(.title2)
                        .bold()
                        .padding(.top)
                    
                    Text("Escolha o parcelamento")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Picker("Parcelas", selection: $selectedInstallmentIndex) {
                        ForEach(0..<pricingOptions.count, id: \.self) { index in
                            Text(pricingOptions[index].label)
                        }
                    }
                    .pickerStyle(.wheel)
                    .labelsHidden()
                    
                    Button(action: {
                        if let course = selectedCourse {
                            enrolledCourseIDs.insert(course.id)
                            showPaymentSheet = false
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                showSuccessAlert = true
                            }
                        }
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
            .alert("Sucesso", isPresented: $showSuccessAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text("Sua inscrição foi realizada com sucesso!")
            }
        }
    }
}

struct MyCoursesView: View {
    let enrolledCourseIDs: Set<UUID>
    let appBlue: Color
    
    let allCourses = MockData.courses
    
    var myCourses: [Course] {
        return allCourses.filter { enrolledCourseIDs.contains($0.id) }
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
