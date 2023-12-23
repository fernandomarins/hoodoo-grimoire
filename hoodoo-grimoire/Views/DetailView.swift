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
        Text(item?.name ?? String())
        VStack {
            Text("Ingredientes")
            List {
                ForEach(item?.items ?? [], id: \.self) {
                    Text($0)
                }
            }
            
            Spacer()
            
            Text("Preparação")
            Text(item?.instructions ?? String())
        }
    }
}

#Preview {
    DetailView(item: nil)
}
