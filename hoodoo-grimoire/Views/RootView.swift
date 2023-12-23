//
//  ContentView.swift
//  hoodoo-grimoire
//
//  Created by Fernando Marins on 22/12/23.
//

import SwiftUI

struct RootView: View {
    @StateObject private var viewModel = RootViewModel()
    @State private var selectedTab: Category = .oils
    @Environment(\.dismiss) private var logout
    
    var body: some View {
        NavigationView {
            VStack {
                Image("logo.png")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70)
                
                Text("Grimódio Hoodoo")
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                    .padding()
                
                List {
                    ForEach(viewModel.selectedItems, id: \.id) { item in
                        NavigationLink(destination: DetailView(item: item)) {
                            HStack {
                                Text(item.name.capitalized)
                                    .font(.system(size: 24))
                                    .padding()
                                    .foregroundColor(.white)
                                
                                Spacer()
                                
                                TypeCircleView(type: item.type)
                                    .frame(width: 24, height: 24)

                                Spacer()
                            }
                            .padding(.horizontal)
                            .background(.darkPurple)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .foregroundStyle(.white)
                        .listRowSeparator(.hidden)
                        .background(.darkPurple)
                        .listRowInsets(EdgeInsets())
                    }
                    .listRowInsets(EdgeInsets())
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
            .onFirstAppear(perform: {
                viewModel.readValue()
                viewModel.update(category: .oils)
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Logout") {
                        viewModel.logout { loggedOut in
                            if loggedOut {
                                logout()
                            }
                        }
                    }
                }
            }
        }
        .accentColor(.white)
    }
}

#Preview {
    RootView()
}
