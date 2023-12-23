//
//  PasswordMatchView.swift
//  hoodoo-grimoire
//
//  Created by Fernando Marins on 23/12/23.
//

import SwiftUI

struct PasswordMatchView: View {
    let passwordsMatch: Bool
    
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: passwordsMatch ? "checkmark" : "x.circle")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundStyle(passwordsMatch ? .green : .red)
            Text(passwordsMatch ? "As senhas são iguais!" : "As senhas devem ser iguais!")
                .font(.headline)
                .foregroundStyle(.white)
        }
        .background(.clear)
        .padding()
    }
}

#Preview {
    PasswordMatchView(passwordsMatch: true)
}
