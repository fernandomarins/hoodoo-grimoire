//
//  ContentView.swift
//  hoodoo-grimoire
//
//  Created by Fernando Marins on 22/12/23.
//

import SwiftUI

struct RootView: View {
    
    @State var selectedTab: Tabs = .oils
    
    var body: some View {
        VStack {
            Text("Grimódio Hoodoo")
                .font(.system(size: 40))
                .foregroundColor(.white)
                .padding()
            
//            List {
//                
//            }
            Spacer()
            CustomTabBar(selectedTab: $selectedTab)
        }
        .padding()
        .background(Color.darkPurple)
    }
}

#Preview {
    RootView()
}
