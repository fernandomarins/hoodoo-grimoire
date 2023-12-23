//
//  DetailView.swift
//  hoodoo-grimoire
//
//  Created by Fernando Marins on 22/12/23.
//

import SwiftUI

struct DetailView: View {
    let item: Item?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(item?.name.uppercased() ?? String())
                .font(.system(size: 40))
                .foregroundStyle(.white)
                .frame(height: 100)
            
            Text(item?.description ?? String())
                .font(.system(size: 24))
                .bold()
                .foregroundStyle(.white)
            
            Spacer()
            
            Text("Ingredientes:")
                .font(.system(size: 24))
                .bold()
                .foregroundStyle(.white)
                .frame(height: 50)
            
            List {
                ForEach(item?.items ?? [], id: \.self) {
                    Text($0.capitalized)
                        .foregroundStyle(.white)
                        .background(.darkPurple)
                        .listRowBackground(Color.darkPurple)
                }
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.plain)
            
            Spacer()
            
            Text("Preparação:")
                .font(.system(size: 24))
                .bold()
                .foregroundStyle(.white)
                .frame(height: 50)
            
            Text(item?.instructions ?? String())
                .foregroundStyle(.white)
            
            Spacer()
        }
        .padding()
        .background(Color.darkPurple.edgesIgnoringSafeArea(.all))
        
    }
}

#Preview {
    DetailView(item: nil)
}
