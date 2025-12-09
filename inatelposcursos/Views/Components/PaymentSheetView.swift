//
//  PaymentSheetView.swift
//  inatelposcursos
//
//  Created by Paulo Matheus on 07/12/25.
//

import SwiftUI

struct PaymentSheetView: View {
    @Bindable var viewModel: HomeViewModel
    let appBlue: Color
    
    var body: some View {
        VStack {
            Text("Forma de Pagamento")
                .font(.title2)
                .bold()
                .padding(.top)
            
            Text("Escolha o parcelamento")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            let pricingOptions = viewModel.selectedCourse?.pricingOptions ?? []
            
            Picker("Parcelas", selection: $viewModel.selectedInstallmentIndex) {
                ForEach(0..<pricingOptions.count, id: \.self) { index in
                    Text(pricingOptions[index].label)
                }
            }
            .pickerStyle(.wheel)
            .labelsHidden()
            
            Button(action: {
                viewModel.confirmEnrollment()
            }) {
                Text("Confirmar Inscrição")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(appBlue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .presentationDetents([.height(400)])
    }
}

#Preview {
    PaymentSheetView(
        viewModel: {
            let vm = HomeViewModel()
            vm.selectedCourse = MockData.courses[0]
            vm.showPaymentSheet = true
            return vm
        }(),
        appBlue: Color(red: 0/255, green: 102/255, blue: 204/255)
    )
}
