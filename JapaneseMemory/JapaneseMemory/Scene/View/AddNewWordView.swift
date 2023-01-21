//
//  AddNewWord.swift
//  JapaneseMemory
//
//  Created by Kel_Jellysh on 18/01/2023.
//

import SwiftUI

struct AddNewWordView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @State private var french = ""
    @State private var japanese = ""
    @State private var romaji = ""

    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            Form {
                Section() {
                    TextField("Entrez le mot en français", text: $french)
                        .font(.custom("American Typewriter", size: 18))
                    TextField("Entrez le mot en japonais", text: $japanese)
                        .font(.custom("American Typewriter", size: 18))
                    TextField("Entrez le mot en romaji", text: $romaji)
                        .font(.custom("American Typewriter", size: 18))
                        .italic()
                    
                    HStack {
                        Spacer()
                        Button("Ajouter le nouveau mot.") {
                            DataController().addWord(japanese: japanese, romaji: romaji, french: french, context: managedObjContext)
                            dismiss()
                        }
                        .font(.custom("American Typewriter", size: 18))
                        .bold()
                        Spacer()
                    }
                }
                .foregroundColor(.red)
            }
        }
        
    }
}

struct AddFoodView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewWordView()
    }
}
