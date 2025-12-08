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
    
    var body: some View {
        VStack(spacing: 0) {
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
