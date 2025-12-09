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
            CourseLogoView(course: course, size: 80, color: logoBlue)
            
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

#Preview {
    CourseCardView(
        course: MockData.courses[0],
        appBlue: Color(red: 0/255, green: 102/255, blue: 204/255),
        logoBlue: Color(red: 35/255, green: 130/255, blue: 161/255)
    )
    .frame(height: 400)
}
