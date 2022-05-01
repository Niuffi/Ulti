//
//  ScoresGameView.swift
//  Ulti
//
//  Created by Kamil on 30/04/2022.
//

import SwiftUI

struct ScoresGameView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(
        entity: Players.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Players.number, ascending: true),
        ]
    ) var players: FetchedResults<Players>
    
    @State var ourScore = 0
    @State var enemyScore = 0
    @State var gameStart = Date()
    @State var start = false
    @State var playersList = [Player]()
    @State var line = [Player]()
    @State var withDisk: Int16 = 100
    @State var offence = true
    
    var body: some View {
        VStack{
            HStack{
                Text(String(ourScore))
                    .padding()
                    .font(.title)
                Spacer()
                if start {
                    StatsViewTimer(gameStart: gameStart)
                }
                else {
                    Text("00:00")
                        .font(.title)
                }
                Spacer()
                Text(String(enemyScore))
                    .padding()
                    .font(.title)
            }
            HStack{
                if !offence {
                    Button("Enemy score") {
                        offence = true
                        enemyScore = enemyScore + 1
                    }.buttonStyle(PlainButtonStyle())
                    Button("Enemy throwaway") {
                        offence = true
                    }.buttonStyle(PlainButtonStyle())
                }
                else {
                    Button("Enemy Callahan"){
                        enemyScore = enemyScore + 1
                    }.buttonStyle(PlainButtonStyle())
                }
            }
            List {
                ForEach(players, id: \.number) { player in
                    HStack{
                        Text("\(player.surname ?? "")")
                        Spacer()
                        if offence {
                            if player.number == withDisk {
                                Button("Throw away") {
                                    withDisk = 100
                                    offence = false
                                }.buttonStyle(PlainButtonStyle())
                                Button("Blocked") {
                                    withDisk = 100
                                    offence = false
                                }.buttonStyle(PlainButtonStyle())
                                
                            }
                            else if withDisk == 100 {
                                Button("Pick up") {
                                    withDisk = player.number
                                }.buttonStyle(PlainButtonStyle())
                            }
                            else {
                                
                                Button("Drop") {
                                    withDisk = 100
                                    offence = false
                                }.buttonStyle(PlainButtonStyle())
                                Button("Goal") {
                                    ourScore = ourScore + 1
                                    offence = false
                                    withDisk = 100
                                }.buttonStyle(PlainButtonStyle())
                                Button("Catch") {
                                    withDisk = player.number
                                }.buttonStyle(PlainButtonStyle())
                            }
                        }
                        else {
                            Button("D") {
                                offence = true
                            }.buttonStyle(PlainButtonStyle())
                            Button("Callahan"){
                                ourScore = ourScore + 1
                                offence = false
                            }.buttonStyle(PlainButtonStyle())
                            Button("Takeover"){
                                offence = true
                                withDisk = player.number
                            }.buttonStyle(PlainButtonStyle())
                        }
                    }
                }
            }
            
            Spacer()
            Button("Start Game"){
                gameStart = Date()
                start = true
            }
            
            Spacer()
        }
    }
}

struct ScoresGameView_Previews: PreviewProvider {
    static var previews: some View {
        ScoresGameView()
            .preferredColorScheme(.dark)
    }
}

class Player {
    let id: UUID
    let name: String
    let surname: String
    let number: Int
    let gender: Bool
    
    init(id: UUID, name: String, surname: String, number: Int, gender: Bool){
        self.id = id
        self.name = name
        self.surname = surname
        self.number = number
        self.gender = gender
    }
}
