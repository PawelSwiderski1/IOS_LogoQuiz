//
//  Icon+CoreDataProperties.swift
//  MyQuiz
//
//  Created by Pawel Swiderski on 08/08/2022.
//
//

import Foundation
import CoreData


extension Icon {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Icon> {
        return NSFetchRequest<Icon>(entityName: "Icon")
    }

    @NSManaged public var answer: String
    @NSManaged public var guessed: Bool
    @NSManaged public var id: UUID
    @NSManaged public var imageName: String
    @NSManaged public var timestamp: Date
    @NSManaged public var imageScale: Double
    @NSManaged public var level: Level?


}

extension Icon : Identifiable {

}
