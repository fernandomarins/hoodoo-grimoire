//
//  CustomTabBar.swift
//  hoodoo-grimoire
//
//  Created by Fernando Marins on 22/12/23.
//

import SwiftUI

enum Category: String, Codable {
    case oils
    case mojos
    case jars
    case grisgris
    case curios
}

struct CustomTabBar: View {
    
    @Binding var selectedTab: Category
    
    var body: some View {
        
        HStack {
            Button {
                selectedTab = .oils
            } label: {
                TabBarButton(buttonText: "Óleos", imageName: "drop", isActive: selectedTab == .oils)
            }
            .tint(.white)
            
            Button {
                selectedTab = .mojos
            } label: {
                
                TabBarButton(buttonText: "Mojos", imageName: "archivebox", isActive: selectedTab == .mojos)
            }
            .tint(.white)
            
            Button {
                selectedTab = .jars
            } label: {
                
                TabBarButton(buttonText: "Jars", imageName: "waterbottle", isActive: selectedTab == .jars)
            }
            .tint(.white)
            
            Button {
                selectedTab = .grisgris
            } label: {
                
                TabBarButton(buttonText: "Gris gris", imageName: "light.beacon.max", isActive: selectedTab == .grisgris)
            }
            .tint(.white)
            
            Button {
                selectedTab = .curios
            } label: {
                
                TabBarButton(buttonText: "Cúrios", imageName: "bag", isActive: selectedTab == .curios)
            }
            .tint(.white)

        }
        .frame(height: 82)
        
    }
}

#Preview {
    CustomTabBar(selectedTab: .constant(.oils))
}
