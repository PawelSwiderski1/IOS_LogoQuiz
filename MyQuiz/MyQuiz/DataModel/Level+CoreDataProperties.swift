//
//  LevelProgress+CoreDataProperties.swift
//  MyQuiz
//
//  Created by Pawel Swiderski on 09/08/2022.
//
//

import Foundation
import CoreData


extension Level {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Level> {
        return NSFetchRequest<Level>(entityName: "Level")
    }

    //@NSManaged public var numberOfGuessed: Int
    @NSManaged public var levelNumber: Int
    @NSManaged public var icons: NSSet?
    
    public var iconsArray: [Icon] {
        let set = icons as? Set<Icon> ?? []
        
        return set.sorted {
            $0.timestamp < $1.timestamp
        }
    }
    
    public var progress: Int {
        var counter = 0
        
        iconsArray.forEach { icon in
            if icon.guessed {
                counter+=1
            }
        }
        return counter
    }
    
}

// MARK: Generated access for icons
extension Level {
    
    @objc(addIconsObject:)
    @NSManaged public func addToIcons(_ value: Icon)
    
    @objc(removeIconsObject:)
    @NSManaged public func removeFromIcons(_ value: Icon)
    
    @objc(addIcons:)
    @NSManaged public func addToIcons(_ values: NSSet)
    
    @objc(removeIcons:)
    @NSManaged public func removeFromIcons(_ values: NSSet)
}

extension Level: Identifiable {

}
