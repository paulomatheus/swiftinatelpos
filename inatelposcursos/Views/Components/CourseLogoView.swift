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
                .frame(width: size * 1.3, height: size * 1.3)
            
            if let logoName = course.logoName {
                Image(logoName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: size)
                    .padding(size * 0.15)
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
