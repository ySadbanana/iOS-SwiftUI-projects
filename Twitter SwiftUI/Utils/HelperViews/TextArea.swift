//
//  TextArea.swift
//  Twitter SwiftUI
//
//  Created by Yerlan Nurumov on 01.02.2021.
//

import SwiftUI

struct TextArea: View {
    @Binding var text: String
    let placeHolder: String
    
    init( placeHolder: String, text: Binding<String>) {
        self._text = text
        self.placeHolder = placeHolder
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            if text.isEmpty{
                Text(placeHolder)
                    .foregroundColor(Color(.placeholderText))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
                
                
            }
            TextEditor(text: $text)
                .padding(4)
        }.font(.body)
    }
}

struct TextArea_Previews: PreviewProvider {
    static var previews: some View {
        TextArea(placeHolder: "What's happening?", text: .constant(""))
    }
}
