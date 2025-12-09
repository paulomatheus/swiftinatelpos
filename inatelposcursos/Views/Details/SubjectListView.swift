//
//  SubjectListView.swift
//  inatelposcursos
//
//  Created by Paulo Matheus on 07/12/25.
//

import SwiftUI

struct SubjectListView: View {
    let subjects: [Subject]
    @Bindable var viewModel: HomeViewModel
    let appBlue: Color
    
    var body: some View {
        List(subjects) { subject in
            HStack {
                Button(action: {
                    viewModel.toggleSubjectCompletion(subject.id)
                }) {
                    Image(systemName: viewModel.isSubjectCompleted(subject.id)
                          ? "checkmark.circle.fill"
                          : "circle")
                    .foregroundColor(viewModel.isSubjectCompleted(subject.id)
                                     ? appBlue
                                     : .gray)
                    .font(.title2)
                }
                .buttonStyle(.plain)
                
                Text(subject.name)
                    .font(.body)
                    .foregroundColor(.black)
                    .strikethrough(viewModel.isSubjectCompleted(subject.id), color: .gray)
                    .opacity(viewModel.isSubjectCompleted(subject.id) ? 0.6 : 1.0)
            }
            .padding(.vertical, 4)
        }
        .listStyle(.plain)
    }
}

#Preview {
    SubjectListView(
        subjects: MockData.courses[0].subjects,
        viewModel: HomeViewModel(),
        appBlue: Color(red: 0/255, green: 102/255, blue: 204/255)
    )
}
