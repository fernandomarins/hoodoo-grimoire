//
//  ContentView.swift
//  hoodoo-grimoire
//
//  Created by Fernando Marins on 22/12/23.
//

import SwiftUI

struct RootView: View {
    
    @StateObject var viewModel = ViewModel()
    @State var selectedTab: Tabs = .oils
    
    var body: some View {
        VStack {
            Text("Grimódio Hoodoo")
                .font(.system(size: 40))
                .foregroundColor(.white)
                .padding()
            
            List {
                CustomRow(text: "Coroa de Sucesso")
                    .listRowSeparator(.hidden)
                
                CustomRow(text: "Corta e Limpa")
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .background(.darkPurple)
            .listRowSeparator(.hidden)
            
            Spacer()
            CustomTabBar(selectedTab: $selectedTab)
        }
        .padding()
        .background(Color.darkPurple.edgesIgnoringSafeArea(.all))
        .onAppear(perform: {
            viewModel.readValue()
        })
    }
}

#Preview {
    RootView()
}
