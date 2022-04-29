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
    @State private var gender: Bool = true
    var body: some View {
        VStack{
            Form{
                TextField("Name", text: $name)
                TextField("Surname", text: $surname)
                Picker("Number", selection: $number) {
                    ForEach(0...100, id: \.self) { number in
                        Text("\(number)")
                    }
                }
                Picker(selection: $gender, label: Text("Gender")) {
                    Text("Male").tag(true)
                    Text("Female").tag(false)
                }
                
                Button("Add Player"){
                    let player = Players(context: moc)
                    player.surname = surname
                    player.name = name
                    player.number = Int16(number)
                    player.gender = gender
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
