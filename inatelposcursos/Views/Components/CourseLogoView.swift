//
//  CourseLogoView.swift
//  inatelposcursos
//
//  Created by Paulo Matheus on 08/12/25.
//

import SwiftUI

struct CourseLogoView: View {
    let course: Course
    let size: CGFloat
    let color: Color
    
    var body: some View {
        ZStack {
            Circle()
                .fill(color)
                .frame(width: size * 2, height: size * 2.0)
            
            if let logoName = course.logoName {
                Image(logoName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: size)
                    .padding(size * 0.5)
            } else {
                Image(systemName: "laptopcomputer.and.iphone")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: size)
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview("Com Logo") {
    VStack(spacing: 30) {
        CourseLogoView(
            course: MockData.courses[1],
            size: 80,
            color: Color(red: 35/255, green: 130/255, blue: 161/255)
        )
        
        CourseLogoView(
            course: MockData.courses[1],
            size: 120,
            color: Color(red: 35/255, green: 130/255, blue: 161/255)
        )
    }
}

#Preview("Sem Logo (SF Symbol)") {
    VStack(spacing: 30) {
        CourseLogoView(
            course: MockData.courses[0],
            size: 80,
            color: Color(red: 35/255, green: 130/255, blue: 161/255)
        )
        
        CourseLogoView(
            course: MockData.courses[0],
            size: 120,
            color: Color(red: 35/255, green: 130/255, blue: 161/255)
        )
    }
}
