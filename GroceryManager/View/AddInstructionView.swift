//
//  AddInstructionView.swift
//  GroceryManager
//
//  Created by John Jeang on 5/8/21.
//

import SwiftUI
import CoreData

struct AddInstructionView: View {
  @State var text = ""
  @State var order = "0"
  @Environment(\.managedObjectContext) var viewContext: NSManagedObjectContext
  
  
  var body: some View {
    VStack{
      TextField("Add Instruction", text: $text)
      TextField("Add order", text: $order)
      Text("Welcome to the instruction view bro.")
      Button(action: {
        // This function does the whole of adding the item to the view context AND saving it
        Instruction.createInstructionWith(text: text, order: Int16(order)!,  context: viewContext)

        
      }, label: {
        Text("Save")
          .fontWeight(.bold)
      })
    }
    
  }
}

struct AddInstructionView_Previews: PreviewProvider {
  static var previews: some View {
    AddInstructionView()
  }
}
