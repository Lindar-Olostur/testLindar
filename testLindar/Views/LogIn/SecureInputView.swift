//
//  SecureInputView.swift
//  testLindar
//
//  Created by Lindar Olostur on 28.03.2023.
//

import SwiftUI

struct SecureInputView: View {
    @Binding private var text: String
    @State private var isSecured: Bool = true
    private var title: String
    
    init(_ title: String, text: Binding<String>) {
        self.title = title
        self._text = text
    }
    
    var body: some View {
        ZStack(alignment: .trailing) {
            Group {
                if isSecured {
                    SecureField(title, text: $text)
                } else {
                    TextField(title, text: $text)
                }
            }.padding(.trailing, 32)

            Button(action: {
                isSecured.toggle()
            }) {
                Image(systemName: self.isSecured ? "eye.slash" : "eye")
                    .accentColor(.gray)
            }
        }
        .padding(7)
        .background(Color(.lightGray).opacity(0.25))
        .cornerRadius(20)
        .multilineTextAlignment(TextAlignment.center)
        .padding(.horizontal)
        .padding(.vertical)
    }
}

struct SecureInputView_Previews: PreviewProvider {
    static var previews: some View {
        SecureInputView("", text: .constant(""))
    }
}
