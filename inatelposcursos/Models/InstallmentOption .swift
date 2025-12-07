//
//  InstallmentOption .swift
//  inatelposcursos
//
//  Created by Paulo Matheus on 07/12/25.
//

import Foundation

struct InstallmentOption: Hashable { //installment = parcelamento
    let count: Int
    let value: String
    
    var label: String {
        return "\(count)x \(value)"
    }
}
