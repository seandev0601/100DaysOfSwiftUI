//
//  CacheFriend+CoreDataProperties.swift
//  MemberDirectory
//
//  Created by Po Hsiang Chao on 2023/9/16.
//
//

import Foundation
import CoreData


extension CachedFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedFriend> {
        return NSFetchRequest<CachedFriend>(entityName: "CachedFriend")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var origin: CachedUser?
    
    public var wrappedName: String {
        name ?? "Unknown Name"
    }

}

extension CachedFriend : Identifiable {

}
