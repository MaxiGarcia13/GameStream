//
//  CTextField.swift
//  GameStream
//
//  Created by Maxi Garcia on 31/10/21.
//

import SwiftUI

struct CTextField: View {
    
    enum Types {
        case field
        case securePassword
        case email
        case phone
    }
    
    @Binding var value: String
    var placeHolder: String
    var label: String
    var type: Types
    
    init(
        label: String,
        value: Binding<String>,
        placeHolder: String,
        type: Types = CTextField.Types.field
    ) {
        _value = value
        self.placeHolder = placeHolder
        self.label = label
        self.type = type
    }
        
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(self.label).foregroundColor(Color("dark-cian")).bold()
            
            ZStack(alignment: .leading) {
                if value.isEmpty {
                    Text(self.placeHolder).foregroundColor(Color(.gray)).padding(.bottom)
                }
                
                switch self.type {
                    case Types.securePassword:
                        SecureField("", text: _value).foregroundColor(Color("ligth-gray")).padding(.bottom)
                    case Types.email:
                        TextField("", text: _value).foregroundColor(Color("ligth-gray")).keyboardType(
                            .emailAddress
                        ).autocapitalization(.none).padding(.bottom)
                    case Types.phone:
                        TextField("", text: _value).foregroundColor(Color("ligth-gray")).keyboardType(
                            .phonePad
                        ).padding(.bottom)
                    default:
                        TextField("", text: _value).foregroundColor(Color("ligth-gray")).padding(.bottom)
                        
                }
            }
            
            Divider().background(Color("dark-cian")).padding(.bottom).frame(height: 1)
        }
    }
}
