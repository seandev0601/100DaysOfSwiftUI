//
//  Candy+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Po Hsiang Chao on 2023/9/8.
//
//

import Foundation
import CoreData


extension Candy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Candy> {
        return NSFetchRequest<Candy>(entityName: "Candy")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: Country?
    
    public var wrappedName: String {
        name ?? "Unknown Name"
    }

}

extension Candy : Identifiable {

}
