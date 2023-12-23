//
//  CustomTabBar.swift
//  hoodoo-grimoire
//
//  Created by Fernando Marins on 22/12/23.
//

import SwiftUI

struct CustomTabBar: View {
    
    @Binding var selectedTab: Category
    
    struct TabBarItem: Identifiable {
        let id: Category
        let buttonText: String
        let imageName: String
    }

    let tabItems: [TabBarItem] = [
        TabBarItem(id: .oils, buttonText: "Óleos", imageName: "drop"),
        TabBarItem(id: .mojos, buttonText: "Mojos", imageName: "archivebox"),
        TabBarItem(id: .jars, buttonText: "Jars", imageName: "waterbottle"),
        TabBarItem(id: .grisgris, buttonText: "Gris gris", imageName: "light.beacon.max"),
        TabBarItem(id: .curios, buttonText: "Cúrios", imageName: "bag")
    ]

    var body: some View {
        HStack {
            ForEach(tabItems) { item in
                Button {
                    selectedTab = item.id
                } label: {
                    TabBarButton(buttonText: item.buttonText, imageName: item.imageName, isActive: selectedTab == item.id)
                }
                .tint(.white)
            }
        }
        .frame(height: 82)
    }
}

#Preview {
    CustomTabBar(selectedTab: .constant(.oils))
}

