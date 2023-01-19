//
//  MainScreenView.swift
//  JapaneseMemory
//
//  Created by Kel_Jellysh on 19/01/2023.
//

import SwiftUI

struct MainScreenView: View {
    @State private var showingAddView = false
    @State private var degree = 0.0
    
    @Environment(\.managedObjectContext) var mock
    @FetchRequest(sortDescriptors: [SortDescriptor(\.french)]) var words: FetchedResults<Word>
    
    var body: some View {
        ZStack{

            Image("neko")
                .resizable()
            VStack{
                Text("Mon Carnet de Japonais")
                    .bold()
                    .font(.custom("Hashiba", size: 30))
                    .foregroundColor(.black)
                Spacer()
            }
            
            if words.isEmpty {
                ZStack {
                    Color.white
                        .frame(width: 300, height: UIScreen.main.bounds.height / 8)
                        .cornerRadius(40)
                        .opacity(0.8)
                    
                    Text("Ajouter des mots en appuyant sur \(Image(systemName: "plus.circle")).")
                        .font(.custom("Hashiba", size: 25))
                        .lineLimit(2)
                        .foregroundColor(.black)
                }
            }
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                    ForEach(words) { word in
                        NavigationLink(destination : WordPage( word: word)) {
                            CardFront(width: 100, height: 100, textSize: 20, circleHeight: 40 ,circleWidth: 40, degree: $degree, word: word)
                        }
                    }
                }
                .padding(.top, 50)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddView.toggle()
                    } label: {
                        Label("Add word", systemImage: "plus.circle")
                    }
                    .foregroundColor(.green)
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: DeleteWordView()) {
                        Label("delete word", systemImage: "minus.circle")
                    }
                    .foregroundColor(.red)
                }
            }
            .sheet(isPresented: $showingAddView) {
                AddNewWordView()
            }
           
        }
        .navigationViewStyle(.automatic)
        .navigationBarBackButtonHidden(true)
    }
        
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}
