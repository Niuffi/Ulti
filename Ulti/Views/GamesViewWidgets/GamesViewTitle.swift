//
//  GamesViewWidget.swift
//  Ulti
//
//  Created by Kamil on 27/04/2022.
//

import SwiftUI

struct GamesViewTitle: View {
    var teamName: String
    var body: some View {
        HStack{
            Text(teamName)
                .font(.title)
                .fontWeight(.black)
                .multilineTextAlignment(.leading)
                .padding(.leading, 10.0)
            Spacer()
        }
    }
}

struct GamesViewWidget_Previews: PreviewProvider {
    static var previews: some View {
        GamesViewTitle(teamName: "RJP")
    }
}
