//
//  VollmedTip.swift
//  Pods
//
//  Created by Ândriu Coelho on 03/12/24.
//

import SwiftUI

public struct VollmedTooltipView: View {
    
    // MARK: - Attributes
    
    private let title: String
    private let description: String
    
    // MARK: - Initialize
    
    public init(title: String, description: String) {
        self.title = title
        self.description = description
    }
    
    // MARK: - View
    
    public var body: some View {
        VStack(spacing: 12) {
            Text(title)
                .padding(.bottom, 5)
                .bold()
            
            Text(description)
        }
        .padding(15)
        
        .background {
            Rectangle()
                .fill(Color(red: 230.0/255.0, green: 243.0/255.0, blue: 255.0/255.0))
        }
    }
}
