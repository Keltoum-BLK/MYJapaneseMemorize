//
//  DeleteWordView.swift
//  JapaneseMemory
//
//  Created by Kel_Jellysh on 19/01/2023.
//

import SwiftUI

struct DeleteWordView: View {
    @Environment(\.managedObjectContext) var mock
    @FetchRequest(sortDescriptors: []) var words: FetchedResults<Word>
    
    var body: some View {
        List {
            ForEach(words) { word in
                Text(word.french ?? "")
                    .bold()
                    .font(.custom("Hashiba", size: 30))
            }
            .onDelete(perform: deleteWord)
        }
        .listStyle(.plain)
        .toolbar {
            
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
            }
        }
        
    }
    private func deleteWord(offsets: IndexSet) {
        withAnimation {
            offsets.map { words[$0] }
            .forEach(mock.delete)
            
            // Saves to our database
            DataController().save(context: mock)
        }
    }
}



struct DeleteWordView_Previews: PreviewProvider {
    static var previews: some View {
        DeleteWordView()
    }
}
