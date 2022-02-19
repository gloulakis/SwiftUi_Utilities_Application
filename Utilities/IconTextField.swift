//
//  IconTextField.swift
//  Utilities
//
//  Created by Georgios Loulakis on 19.02.22.
//

import SwiftUI

struct IconTextField: View {
    var placeholder = "Enter value"
    var icon: String
    
    @Binding var text:String
    
    var body: some View {
        HStack{
            Image(systemName: icon)
            TextField(placeholder, text: $text)
                .foregroundColor(.black)
        }
    }
}

struct IconTextField_Previews: PreviewProvider {
    static var previews: some View {
        IconTextField(icon: "bolt", text: .constant("123"))
    }
}
