//
//  MyCoursesView .swift
//  inatelposcursos
//
//  Created by Paulo Matheus on 07/12/25.
//

import SwiftUI

struct MyCoursesView: View {
    var viewModel: HomeViewModel
    let appBlue: Color
    let logoBlue: Color 
    
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
                        NavigationLink(value: course) {
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
                            }
                            .padding(.vertical, 8)
                        }
                    }
                    .listStyle(.plain)
                    .navigationDestination(for: Course.self) { course in
                        CourseDetailView(course: course, viewModel: viewModel, appBlue: appBlue, logoBlue: logoBlue)
                    }
                }
            }
            .navigationTitle("Meus Cursos")
        }
    }
}

#Preview {
    MyCoursesView(
        viewModel: HomeViewModel(),
        appBlue: Color(red: 0/255, green: 102/255, blue: 204/255),
        logoBlue: Color(red: 35/255, green: 130/255, blue: 161/255)
    )
}
