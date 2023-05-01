//
//  DataController.swift
//  MyQuiz
//
//  Created by Pawel Swiderski on 07/08/2022.
//

import Foundation
import CoreData

class PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = true) {
        container = NSPersistentContainer(name: "IconModel")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores {_, error in
            if let error = error as NSError? {
                fatalError("Failed to load the data \(error), \(error.userInfo)")
            }
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
            self.container.viewContext.automaticallyMergesChangesFromParent = true

        }
        
        //if isFirstTimeLaunch && !inMemory {
          let viewContext = container.viewContext
          createLevel_1(context: viewContext)
          createLevel_2(context: viewContext)


          do {
            try viewContext.save()
          } catch let dbError {
            let nsError = dbError as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
          }
        //}
        
    }
    
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data saved")
        } catch {
            print("We couldnt save data")
        }
    }
    
    func addIcon(imageName: String, answer: String, level: Int, context: NSManagedObjectContext) {
        let icon = Icon(context: context)
        icon.id = UUID()
        icon.imageName = imageName
        icon.answer = answer
        icon.timestamp = Date()
        
        save(context: context)
    }
}
    // MARK: - First Time Launch
    extension PersistenceController {
      var isFirstTimeLaunch: Bool {
        guard UserDefaults.standard.bool(forKey: "first_time_launch") else {
          UserDefaults.standard.setValue(true, forKey: "first_time_launch")
          return true
        }
        return false
      }
    }
    
    

    extension PersistenceController {
        static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        let level = Level(context: viewContext)
        level.levelNumber = 1
       
                
        for index in 0...10 {
            let even = index % 2 == 0
            let icon = Icon(context: viewContext)
            icon.imageName = even ? "AppleLogo" : "AmazonLogo"
            icon.answer = even ? "Apple" : "Amazon"
            icon.guessed = false
            icon.id = UUID()
            icon.timestamp = Date()
            
            icon.level = level
            //icon.level = Level(context: viewContext)
            //icon.level?.levelNumber = 1
            //icon.level?.numberOfGuessed = 0
        }
       

            
        do {
          try viewContext.save()
        } catch {
          let nsError = error as NSError
          fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
      }()
    }

