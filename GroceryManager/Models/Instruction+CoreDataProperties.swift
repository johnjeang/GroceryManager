//
//  Instruction+CoreDataProperties.swift
//  GroceryManager
//
//  Created by John Jeang on 5/8/21.
//
//

import SwiftUI
import CoreData


extension Instruction {
  
  @nonobjc public class func fetchRequest() -> NSFetchRequest<Instruction> {
    return NSFetchRequest<Instruction>(entityName: "Instruction")
  }
  
  // Attributes defined by the data model (including relatinoships)
  @NSManaged public var text: String?
  @NSManaged public var order: Int16
  @NSManaged public var instructionList: InstructionList?
  
  static func createInstructionWith(text: String, order: Int16, context: NSManagedObjectContext){
    // the instruction is officially part of the context now
    let instruction = Instruction(context: context)
    // whatever changes made the object now will propogate to the context
    // so we can assign values to the fields
    instruction.text = text
    instruction.order = order
    // Now you actually need to call save so that the context records the change to
    // the persistent store
    do {
    try context.save()
    } catch{
    let nserror = error as NSError
    fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
    }
  }
  
  static func basicFetchRequest() -> FetchRequest<Instruction>{
    FetchRequest(entity: Instruction.entity(), sortDescriptors: [])
  }
  
  static func sortedFetchRequest() -> FetchRequest<Instruction> {
    let orderSort = NSSortDescriptor(key: "order", ascending: true)
    return FetchRequest(entity: Instruction.entity(), sortDescriptors: [orderSort])
  }
  
  static func deleteAllInstructions(){
    
  }
  
  
  
}

extension Instruction : Identifiable {
  
}
