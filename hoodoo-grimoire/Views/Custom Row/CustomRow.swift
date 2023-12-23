//
//  CustomRow.swift
//  hoodoo-grimoire
//
//  Created by Fernando Marins on 22/12/23.
//

import SwiftUI

struct CustomRow: View {
    @State var text: String

    var body: some View {
        HStack {
            Text(text)
                .font(.system(size: 24))
                .padding()
                .foregroundColor(.white)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundColor(.white)
                .frame(width: 44, height: 44)
        }
        .padding(.horizontal)
        .background(Color.darkPurple)
    }
}


#Preview {
    CustomRow(text: "Coroa de Sucesso")
}
