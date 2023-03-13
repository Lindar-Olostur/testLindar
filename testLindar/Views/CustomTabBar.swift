//
//  TabBarView.swift
//  testLindar
//
//  Created by Lindar Olostur on 17.03.2023.
//

import SwiftUI

struct CustomTabView: View {
    let icons: [String]
    let selectedIndex: Int
    let onTabSelected: (Int) -> Void
    
    var body: some View {
        HStack {
            ForEach(0..<icons.count) { index in
                NavigationLink(destination: getDestinationView(index: index),
                               tag: index,
                               selection: Binding<Int?>.constant(selectedIndex)) {
                    Image(systemName: icons[index])
                        .foregroundColor(selectedIndex == index ? .blue : .gray)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .frame(height: 60)
        .background(Color.white)
        .cornerRadius(15)
        .clipShape(Rectangle())
        .shadow(radius: 5)
        .padding(.bottom, -20)
    }
    private func getDestinationView(index: Int) -> some View {
        switch index {
        case 0:
            return AnyView(Page1View())
        case 1:
            return AnyView(Page1View())
        case 2:
            return AnyView(Page1View())
        case 3:
            return AnyView(Page1View())
        case 4:
            return AnyView(ProfileView())
        default:
            return AnyView(Page1View())
        }
    }
}


struct TabBarView: View {
    let icons = ["house", "heart", "cart", "bubble.left", "person"]
    @State private var selectedIndex = 0
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                switch selectedIndex {
                case 0:
                    Page1View()
                        .navigationBarHidden(true)
                case 1:
                    ProfileView()
                        .navigationBarHidden(true)
                case 2:
                    Page1View()
                        .navigationBarHidden(true)
                case 3:
                    Page1View()
                        .navigationBarHidden(true)
                case 4:
                    Page1View()
                        .navigationBarHidden(true)
                default:
                    Text("Unknown Screen")
                }
                
                Spacer()
                
                CustomTabView(icons: icons, selectedIndex: selectedIndex) { index in
                    selectedIndex = index
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}




struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
