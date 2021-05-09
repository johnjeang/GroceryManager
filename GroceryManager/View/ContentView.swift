//
//  ContentView.swift
//  GroceryManager
//
//  Created by John Jeang on 5/8/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
  
  // There is an cleaner way to do this with property wrappers
  /*
   @FetchRequest(Instruction.basicFetchRequest()) var instructions: FetchedResults<Instruction>
   */
  
  
  // The commented out code here is the long-hand way of doing the property wrapper version above
  
  let instructionFetchRequest = Instruction.sortedFetchRequest()
  var instructions: FetchedResults<Instruction> {
    instructionFetchRequest.wrappedValue
  }
  @Environment(\.managedObjectContext) var viewContext: NSManagedObjectContext
  
  
  var body: some View {
    NavigationView{
      
      VStack {
        NavigationLink(destination: AddInstructionView()){
          Text("Add Instruction")
        }
        ForEach(instructions, id: \.self) {instruction in
          Text("\(instruction.text ?? "")")
        }
        Button(action: {
          viewContext.delete(instructions[0])
          do{
          try viewContext.save()
          } catch {
            print(error)
          }
          
        }, label: {
          Text("Delete Instructions")
        })
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
