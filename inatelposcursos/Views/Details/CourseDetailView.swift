import SwiftUI

struct CourseDetailView: View {
    let course: Course
    @Bindable var viewModel: HomeViewModel
    let appBlue: Color
    let logoBlue: Color
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Spacer()
                    CourseLogoView(course: course, size: 120, color: logoBlue)
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
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Sobre o Curso")
                        .font(.title2)
                        .bold()
                    
                    Text(course.detailedDescription)
                        .font(.body)
                        .foregroundColor(.gray)
                        .lineSpacing(5)
                }
                
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
                    
                    VStack(alignment: .leading, spacing: 0) {
                        ForEach(course.subjects) { subject in
                            SubjectRowView(
                                subject: subject,
                                viewModel: viewModel,
                                appBlue: appBlue
                            )
                            
                            if subject.id != course.subjects.last?.id {
                                Divider()
                                    .padding(.leading, 50)
                            }
                        }
                    }
                    .background(Color(red: 248/255, green: 248/255, blue: 248/255))
                    .cornerRadius(10)
                    .padding(.top, 5)
                }
                
                Spacer(minLength: 20)
            }
            .padding()
        }
        .navigationTitle("Detalhes")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SubjectRowView: View {
    let subject: Subject
    @Bindable var viewModel: HomeViewModel
    let appBlue: Color
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Button(action: {
                viewModel.toggleSubjectCompletion(subject.id)
            }) {
                Image(systemName: viewModel.isSubjectCompleted(subject.id)
                      ? "checkmark.circle.fill"
                      : "circle")
                .foregroundColor(viewModel.isSubjectCompleted(subject.id)
                                 ? appBlue
                                 : .gray)
                .font(.title3)
            }
            .buttonStyle(.plain)
            
            Text(subject.name)
                .font(.body)
                .foregroundColor(.black)
                .strikethrough(viewModel.isSubjectCompleted(subject.id), color: .gray)
                .opacity(viewModel.isSubjectCompleted(subject.id) ? 0.6 : 1.0)
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)
            
            Spacer()
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 16)
        .contentShape(Rectangle())
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

