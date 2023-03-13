//
//  Extentions.swift
//  testLindar
//
//  Created by Lindar Olostur on 14.03.2023.
//

import SwiftUI

struct MontserratSemiBoldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Montserrat-SemiBold", size: 16))
    }
}

struct GrayTextField: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(7)
            .background(Color(.lightGray).opacity(0.25))
            .cornerRadius(20)
            .multilineTextAlignment(TextAlignment.center)
            .padding(.horizontal)
            .padding(.vertical)
    }
}

struct BigBlueButton: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(Color("Btn"))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.vertical)
            .font(.custom("Montserrat-SemiBold", size: 18))
            .animation(.easeIn, value: 5)
            .opacity(configuration.isPressed ? 0.5 : 1)
        }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
