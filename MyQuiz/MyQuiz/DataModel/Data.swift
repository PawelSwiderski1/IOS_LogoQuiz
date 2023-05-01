//
//  Data.swift
//  MyQuiz
//
//  Created by Pawel Swiderski on 12/08/2022.
//

import CoreData

extension PersistenceController {
    func createLevel_1(context: NSManagedObjectContext) {
        let level_1 = Level(context: context)
        level_1.levelNumber = 1
        
        let mcdonalds = Icon(context: context)
        mcdonalds.imageName = "Mcdonalds"
        mcdonalds.answer = "Mcdonalds"
        mcdonalds.guessed = false
        mcdonalds.timestamp = Date()
        mcdonalds.imageScale = 1
        mcdonalds.id = UUID()
        mcdonalds.level = level_1
        
        let google = Icon(context: context)
        google.imageName = "Google"
        google.answer = "Google"
        google.guessed = false
        google.timestamp = Date()
        google.imageScale = 1
        google.id = UUID()
        google.level = level_1
        
        let youtube = Icon(context: context)
        youtube.imageName = "Youtube"
        youtube.answer = "Youtube"
        youtube.guessed = false
        youtube.timestamp = Date()
        youtube.id = UUID()
        youtube.imageScale = 1
        youtube.level = level_1
        
        let uber = Icon(context: context)
        uber.imageName = "Uber"
        uber.answer = "Uber"
        uber.guessed = false
        uber.timestamp = Date()
        uber.id = UUID()
        uber.imageScale = 1
        uber.level = level_1
        
        let amazon = Icon(context: context)
        amazon.imageName = "Amazon"
        amazon.answer = "Amazon"
        amazon.guessed = false
        amazon.timestamp = Date()
        amazon.id = UUID()
        amazon.imageScale = 1
        amazon.level = level_1
        
        let playstation = Icon(context: context)
        playstation.imageName = "Playstation"
        playstation.answer = "Playstation"
        playstation.guessed = false
        playstation.timestamp = Date()
        playstation.id = UUID()
        playstation.imageScale = 1
        playstation.level = level_1
        
        let nike = Icon(context: context)
        nike.imageName = "Playstation"
        nike.answer = "Nike"
        nike.guessed = false
        nike.timestamp = Date()
        nike.id = UUID()
        nike.imageScale = 1
        nike.level = level_1
        
        let netflix = Icon(context: context)
        netflix.imageName = "Netflix"
        netflix.answer = "Netflix"
        netflix.guessed = false
        netflix.timestamp = Date()
        netflix.id = UUID()
        netflix.imageScale = 1
        netflix.level = level_1
        
        let pringles = Icon(context: context)
        pringles.imageName = "Pringles"
        pringles.answer = "Pringles"
        pringles.guessed = false
        pringles.timestamp = Date()
        pringles.id = UUID()
        pringles.imageScale = 1
        pringles.level = level_1
    }
    
    func createLevel_2(context: NSManagedObjectContext) {
        let level_2 = Level(context: context)
        level_2.levelNumber = 2
        
        let uber = Icon(context: context)
        uber.imageName = "UberLogo"
        uber.answer = "Uber"
        uber.guessed = false
        uber.timestamp = Date()
        uber.imageScale = 1
        uber.id = UUID()
        uber.level = level_2
        
        let mcdonalds = Icon(context: context)
        mcdonalds.imageName = "McdonaldsLogo"
        mcdonalds.answer = "Mcdonalds"
        mcdonalds.guessed = false
        mcdonalds.timestamp = Date()
        mcdonalds.imageScale = 1
        mcdonalds.id = UUID()
        mcdonalds.level = level_2
        
        let samsung = Icon(context: context)
        samsung.imageName = "SamsungLogo"
        samsung.answer = "Samsung"
        samsung.guessed = false
        samsung.timestamp = Date()
        samsung.id = UUID()
        samsung.imageScale = 2
        samsung.level = level_2
        
        
    }
    
}
