//
//  ContentView.swift
//  JapaneseMemory
//
//  Created by Kel_Jellysh on 17/01/2023.
//
import CoreData
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
        VStack {
            ZStack {
                Image("JapaneseBackground")
                    .scaledToFit()
                
                VStack {
                    SplashAnimation()
                    }
                }
            }
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
