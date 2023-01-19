//
//  DataController.swift
//  JapaneseMemory
//
//  Created by Kel_Jellysh on 17/01/2023.
//
import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Word")
    
    init() {
        container.loadPersistentStores { description, error in
           if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
            do {
                try context.save()
                print("Data saved successfully. WUHU!!!")
            } catch {
                // Handle errors in our database
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
        
    func addWord(japanese: String, romaji: String, french: String, context: NSManagedObjectContext) {
            let word = Word(context: context)
            word.id = UUID()
            word.japanese = japanese
            word.french = french
            word.romaji = romaji
            
            save(context: context)
        }
}
