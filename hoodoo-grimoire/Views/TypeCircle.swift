//
//  SwiftUIView.swift
//  hoodoo-grimoire
//
//  Created by Fernando Marins on 23/12/23.
//

import SwiftUI

struct TypeCircle: View {
    let type: `Type`
    
    var body: some View {
        switch type {
        case .protection:
            return Circle()
                .fill(Color.black)
                .foregroundColor(.white)
        case .defense:
            return Circle()
                .fill(Color.gray)
                .foregroundColor(.white)
        case .prosperity:
            return Circle()
                .fill(Color.yellow)
                .foregroundColor(.white)
        case .selfLove:
            return Circle()
                .fill(Color.red)
                .foregroundColor(.white)
        case .love:
            return Circle()
                .fill(Color.pink)
                .foregroundColor(.white)
        case .lucky:
            return Circle()
                .fill(Color.green)
                .foregroundColor(.white)
        case .control:
            return Circle()
                .fill(Color.purple)
                .foregroundColor(.white)
        case .domination:
            return Circle()
                .fill(Color.mediumPurple)
                .foregroundColor(.white)
        case .heal:
            return Circle()
                .fill(Color.green)
                .foregroundColor(.white)
        case .clearingPaths:
            return Circle()
                .fill(Color.orange)
                .foregroundColor(.white)
        case .jinx:
            return Circle()
                .fill(Color.indigo)
                .foregroundColor(.white)
        }
    }
}

#Preview {
    TypeCircle(type: .protection)
}

