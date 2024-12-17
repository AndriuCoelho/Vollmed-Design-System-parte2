//
//  SnackBarView.swift
//  Pods
//
//  Created by Ândriu Coelho on 12/12/24.
//

import SwiftUI

public struct VollmedSnackBarView: View {
    
    // MARK: - Attributes
    
    public var title: String
    public var description: String
    
    // MARK: - Initializer
    
    public init(title: String, description: String) {
        self.title = title
        self.description = description
    }
    
    // MARK: - Class methods
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.blue)
                Text("Consulta agendada com sucesso!")
                    .font(.headline)
            }
            
            Text("Data e horário: 06/06/22, 09:40")
                .font(.subheadline)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .shadow(radius: 2)
        .padding()
    }
}

#Preview {
    VollmedSnackBarView(title: "Agendamento de consulta",
                        description: "Consulta agendada com sucesso")
}
