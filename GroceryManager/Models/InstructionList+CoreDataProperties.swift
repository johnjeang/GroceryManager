//
//  InstructionList+CoreDataProperties.swift
//  GroceryManager
//
//  Created by John Jeang on 5/8/21.
//
//

import Foundation
import CoreData


extension InstructionList {
  
  @nonobjc public class func fetchRequest() -> NSFetchRequest<InstructionList> {
    return NSFetchRequest<InstructionList>(entityName: "InstructionList")
  }
  
  @NSManaged public var title: String?
  @NSManaged public var instructions: Array<Instruction>
  @NSManaged public var menuItem: MenuItem?
  
  static func createInstructionListWith(title: String, context: NSManagedObjectContext){
    
    let instructionList = InstructionList(context: context)
    instructionList.title = title
    do {
    try context.save()
    } catch{
    let nserror = error as NSError
    fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
    }
  }
  
  
  
}

