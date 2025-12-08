//
//  CourseCardView .swift
//  inatelposcursos
//
//  Created by Paulo Matheus on 07/12/25.
//

import SwiftUI

import SwiftUI

struct CourseCardView: View {
    let course: Course
    let appBlue: Color
    let logoBlue: Color 
    
    var body: some View {
        VStack(spacing: 20) {
            CourseLogoView(course: course, size: 80, color: appBlue)
            
            Text(course.name)
                .font(.title3)
                .bold()
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Text(course.description)
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
}
