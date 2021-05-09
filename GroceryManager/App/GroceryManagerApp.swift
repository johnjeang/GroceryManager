//
//  GroceryManagerApp.swift
//  GroceryManager
//
//  Created by John Jeang on 5/8/21.
//


/*
 Core Data Steps
 
 1. Create Data Model file that holds all the entities and relationships (apparently done for you if you check add core data at app initialization).
 2. Create the Persistent Container below to set up the stack (apparently done for you is you check add core data at app initialization).  You have to import CoreData for this step. Given a data model the persistent container creates MOM, MOC, and Persistent coordinator.  It just needs the name of the data model as input.  (Check out what the autogenerated code looks like for this)
 3. Create subclasses for the entities.  Since CoreData is an objective C framework you have to expose the subclass to objective C code.
 
     a) No changes need to be made the to DataClass auto-generated file (could remove foundation import)
     b) No changes need to be made ot the DataProperties auto-generated filed (could remove foundation import)
4. Create both a fetching and creating function to both save and fetch data to the persistence store
 
    a) Creating an instance of the entity subclass is as simple as initializing it with a context.  From then on the context knows of its existence and will be able to persist.
    b) In swiftUI we'll return the SwiftUI FetchRequest object instead of the NSFetchRequest object so we'll have to import SwiftUI.  This is ok because we will use property wrappers later.
 
 5. Deleting from the managed context is pretty easy too.  You can get the object from jsut indexing the fetchedResult from a fetch request.
 
 
 
  
 
 
 
 */

import SwiftUI
import CoreData

@main
struct GroceryManagerApp: App {
  var body: some Scene {
    WindowGroup {
      let persistenceController = PersistenceController.shared
      
      
      ContentView()
        .environment(\.managedObjectContext, persistenceController.container.viewContext)
    }
  }
  
  // MARK: Core Data Stack -
  // This actually got put in the persistence file

  
}
