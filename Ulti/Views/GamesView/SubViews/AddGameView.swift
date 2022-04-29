//
//  AddGameView.swift
//  Ulti
//
//  Created by Kamil on 28/04/2022.
//

import SwiftUI

struct AddGameView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) var moc
    @State private var opponent: String = ""
    @State private var tournament: String = ""
    @State var date: Date = Date()
    var body: some View {
        VStack{
            Form{
                TextField("Opponent", text: $opponent)
                TextField("Tournament", text: $tournament)
                DatePicker("Date", selection: $date, in: Date.now...)
                Button("Add game"){
                    let game = Games(context: moc)
                    game.tournament = tournament
                    game.opponent = opponent
                    game.date = date
                    game.ourPoints = 0
                    game.enemyPoints = 0
                    game.ended = false
                    try? moc.save()
                    presentationMode.wrappedValue.dismiss()
                }
            }
            Spacer()
        }.navigationBarTitle(Text("New Game"))
    }
}

struct AddGameView_Previews: PreviewProvider {
    static var previews: some View {
        AddGameView()
            .preferredColorScheme(.dark)
    }
}
