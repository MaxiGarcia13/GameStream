//
//  File.swift
//  GameStream
//
//  Created by Maxi Garcia on 31/10/21.
//

import SwiftUI

struct CButton: View {
    enum Types {
        case primary
        case secondary
    }
    
    var type:Types
    var label: String
    var action: () -> Void
    
    init(label: String, action: @escaping () -> Void, type: Types = Types.primary ) {
        self.type = type
        self.label = label
        self.action = action
    }
    
    var body: some View {
        
        switch self.type {
            case Types.secondary:
                Button(action: self.action, label: {
                    Text(self.label)
                        .bold()
                        .foregroundColor(Color("ligth-gray"))
                        .frame(
                            maxWidth: .infinity,
                            alignment: .center
                        )
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("ligth-blue"), lineWidth: 3.0))
                        .background(Color("ligth-blue"))
                })
            default:
                Button(action: self.action, label: {
                    Text(self.label).bold().foregroundColor(Color("dark-cian")).frame(maxWidth: .infinity,alignment: .center).padding().overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("dark-cian"), lineWidth: 3.0))
                })
        }
        
    }
}
