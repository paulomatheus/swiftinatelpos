//
//  CourseDetailView.swift
//  inatelposcursos
//
//  Created by Paulo Matheus on 07/12/25.
//

import SwiftUI

struct CourseDetailView: View {
    let course: Course
    @Bindable var viewModel: HomeViewModel
    let appBlue: Color
    let logoBlue: Color
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Spacer()
                        CourseLogoView(course: course, size: 120, color: appBlue)
                        Spacer()
                    }
                    .padding(.top, 40)
                    
                    Text(course.name)
                        .font(.title)
                        .bold()
                        .foregroundColor(appBlue)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                    
                    HStack {
                        Spacer()
                        Label("\(course.workload) horas", systemImage: "clock.fill")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    
                    Divider()
                    
                    Text("Sobre o Curso")
                        .font(.title2)
                        .bold()
                    
                    Text(course.detailedDescription)
                        .font(.body)
                        .foregroundColor(.gray)
                        .lineSpacing(5)
                    
                    if !course.subjects.isEmpty {
                        Divider()
                            .padding(.top, 10)
                        
                        HStack {
                            Text("Disciplinas")
                                .font(.title2)
                                .bold()
                            
                            Spacer()
                            
                            Text("\(course.subjects.count) matérias")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .padding(.bottom, 5)
                    }
                }
                .padding()
            }
            
            if !course.subjects.isEmpty {
                SubjectListView(subjects: course.subjects, viewModel: viewModel, appBlue: appBlue)
            }
        }
        .navigationTitle("Detalhes")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview("Com Disciplinas") {
    NavigationStack {
        CourseDetailView(
            course: MockData.courses[0],
            viewModel: HomeViewModel(),
            appBlue: Color(red: 0/255, green: 102/255, blue: 204/255),
            logoBlue: Color(red: 35/255, green: 130/255, blue: 161/255)
        )
    }
}

#Preview("Sem Disciplinas") {
    NavigationStack {
        CourseDetailView(
            course: Course(
                name: "CURSO TESTE",
                description: "Sem disciplinas",
                detailedDescription: "Este é um curso de teste sem disciplinas cadastradas.",
                subjects: [],
                workload: 368,
                pricingOptions: MockData.standardPricing,
                logoName: nil
            ),
            viewModel: HomeViewModel(),
            appBlue: Color(red: 0/255, green: 102/255, blue: 204/255),
            logoBlue: Color(red: 35/255, green: 130/255, blue: 161/255)
        )
    }
}
