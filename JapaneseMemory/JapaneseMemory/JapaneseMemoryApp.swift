//
//  JapaneseMemoryApp.swift
//  JapaneseMemory
//
//  Created by Kel_Jellysh on 17/01/2023.
//

import SwiftUI

@main
struct JapaneseMemoryApp: App {
    @StateObject private var dataCOntroller = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataCOntroller.container.viewContext)
        }
    }
}
