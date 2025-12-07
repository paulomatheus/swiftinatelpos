//
//  HomeView.swift
//  inatelposcursos
//
//  Created by Paulo Matheus on 07/12/25.
//

import SwiftUI

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
