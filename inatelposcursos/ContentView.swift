//
//  ContentView.swift
//  inatelposcursos
//
//  Created by Paulo Matheus on 06/12/25.
//

import SwiftUI

struct Course: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let description: String
}

struct ContentView: View {
    let appBlue = Color(red: 0/255, green: 102/255, blue: 204/255)
    let appWhite = Color(red: 255/255, green: 255/255, blue: 255/255)
    
    let courses = [
        Course(name: "Cloud Computing and Mobile Development", description: "Matérias sobre computação em nuvem e desenvolvimento mobile."),
        Course(name: "Redes 5G", description: "Tecnologias e aplicações de redes 5G."),
        Course(name: "MBA em negócios", description: "Fundamentos de administração e gestão empresarial."),
    ]
    
    @State private var enrolledCourseIDs: Set<UUID> = []
    @State private var selectedCourse: Course?
    @State private var showPaymentSheet = false
    @State private var showSuccessAlert = false
    @State private var selectedInstallments = 1
    @State private var currentCourseIndex = 0
    
    var body: some View {
        ZStack {
            appWhite.ignoresSafeArea()
            
            VStack {
                HStack {
                    Image(systemName: "book.fill")
                        .font(.title)
                        .foregroundColor(appBlue)
                    Text("Matérias Disponíveis")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.black)
                    Spacer()
                }
                .padding()
                
                TabView(selection: $currentCourseIndex) {
                    ForEach(0..<courses.count, id: \.self) { index in
                        VStack(spacing: 20) {
                            Image(systemName: "doc.text.image")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 100)
                                .foregroundColor(appBlue)
                            
                            Text(courses[index].name)
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                            
                            Text(courses[index].description)
                                .font(.body)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                                .padding()
                        }
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(radius: 5)
                        .padding()
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
                        selectedInstallments = 1
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
        .sheet(isPresented: $showPaymentSheet) {
            VStack {
                Text("Forma de Pagamento")
                    .font(.title2)
                    .bold()
                    .padding(.top)
                
                Text("Escolha o parcelamento")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Picker("Parcelas", selection: $selectedInstallments) {
                    ForEach(1...24, id: \.self) { number in
                        Text("\(number)x")
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

#Preview {
    ContentView()
}
