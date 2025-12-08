//
//  HomeViewModels.swift
//  inatelposcursos
//
//  Created by Paulo Matheus on 07/12/25.
//

import Foundation
import SwiftUI

@Observable
class HomeViewModel {
    var enrolledCourseIDs: Set<UUID> = []
    var selectedCourse: Course?
    var showPaymentSheet = false
    var showSuccessAlert = false
    var selectedInstallmentIndex = 0
    var currentCourseIndex = 0
    
    var completedSubjectIDs: Set<UUID> = []
    
    let courses = MockData.courses
    
    var currentCourse: Course {
        return courses[currentCourseIndex]
    }
    
    var isCurrentCourseEnrolled: Bool {
        return enrolledCourseIDs.contains(currentCourse.id)
    }
    
    var currentCoursePricingOptions: [InstallmentOption] {
        return currentCourse.pricingOptions
    }
    
    func openPaymentSheet(for course: Course) {
        selectedCourse = course
        showPaymentSheet = true
    }
    
    func confirmEnrollment() {
        guard let course = selectedCourse else { return }
        enrolledCourseIDs.insert(course.id)
        showPaymentSheet = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.showSuccessAlert = true
        }
    }
    
    func getEnrolledCourses() -> [Course] {
        return courses.filter { enrolledCourseIDs.contains($0.id) }
    }
    
    func toggleSubjectCompletion(_ subjectID: UUID) {
        if completedSubjectIDs.contains(subjectID) {
            completedSubjectIDs.remove(subjectID)
        } else {
            completedSubjectIDs.insert(subjectID)
        }
    }
    
    func isSubjectCompleted(_ subjectID: UUID) -> Bool {
        return completedSubjectIDs.contains(subjectID)
    }
}
