//
//  GamesViewNextGame.swift
//  Ulti
//
//  Created by Kamil on 27/04/2022.
//

import SwiftUI

struct GamesViewNextGame: View {
    
    var body: some View {
        VStack{
            HStack{
                Text("Next game: \n12:40 \n vs. FLOW")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Spacer()
            }
            Spacer()
        }
            .padding(.all)
            .background(LinearGradient(gradient: Gradient(colors: [Color.green, Color.blue]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(20)
            .frame(maxHeight: 200)
        
    }
}

struct GamesViewNextGame_Previews: PreviewProvider {
    static var previews: some View {
        GamesViewNextGame()
            .preferredColorScheme(.dark)
.previewInterfaceOrientation(.portrait)
    }
}
