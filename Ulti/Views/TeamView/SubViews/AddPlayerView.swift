//
//  AddPlayerView.swift
//  Ulti
//
//  Created by Kamil on 29/04/2022.
//

import SwiftUI

struct AddPlayerView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) var moc
    @State private var name: String = ""
    @State private var surname: String = ""
    @State private var number: Int = 0
    var body: some View {
        VStack{
            Form{
                TextField("Name", text: $name)
                        .padding()
                
                TextField("Surname", text: $surname)
                        .padding()
                Picker("Number", selection: $number) {
                    ForEach(1...100, id: \.self) { number in
                        Text("\(number)")
                    }
                }
                
                Button("Add Player"){
                    let player = Players(context: moc)
                    player.surname = surname
                    player.name = name
                    player.number = Int16(number)
                    try? moc.save()
                    presentationMode.wrappedValue.dismiss()
                }
            }
            Spacer()
        }.navigationBarTitle(Text("New Player"))
    }
}

struct AddPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        AddPlayerView()
    }
}
