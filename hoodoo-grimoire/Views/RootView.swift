//
//  ContentView.swift
//  hoodoo-grimoire
//
//  Created by Fernando Marins on 22/12/23.
//

import SwiftUI

struct RootView: View {
    @StateObject var viewModel = ViewModel()
    @State var selectedTab: Category = .oils
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Grimódio Hoodoo")
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                    .padding()
                
                List {
                    ForEach(viewModel.selectedItems, id: \.id) { item in
                        ZStack {
                            NavigationLink(destination: DetailView(item: item)) {
                                HStack {
                                    Text(item.name.capitalized)
                                        .font(.system(size: 24))
                                        .padding()
                                        .foregroundColor(.white)

                                    Spacer()
                                }
                                .padding(.horizontal)
                                .background(.darkPurple)
                            }
                            .buttonStyle(PlainButtonStyle())
                            .foregroundStyle(.white)
                        }
                        .listRowSeparator(.hidden)
                        .background(.darkPurple)
                        .listRowInsets(EdgeInsets())
                    }
                }
                .listStyle(.plain)
                .listRowSeparator(.hidden)
                
                Spacer()
                
                CustomTabBar(selectedTab: $selectedTab)
                    .onChange(of: selectedTab) {
                        viewModel.update(category: selectedTab)
                    }
            }
            .padding()
            .background(Color.darkPurple.edgesIgnoringSafeArea(.all))
            .onAppear(perform: {
                viewModel.readValue()
                viewModel.update(category: .oils)
        })
        }
    }
}

#Preview {
    RootView()
}
