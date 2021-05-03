//
//  ContentView.swift
//  WhatsForDinner
//
//  Created by Rich Gruskin on 4/20/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var dinner_selection =  "TurDuckin"
    
    @ObservedObject var DinnerData = DinnerModel()

    
    var body: some View {
        
        var choice = Int.random(in: 0..<DinnerData.Dinners.count)
        
        //dinner_selection = DinnerData.Dinners[choice].name
        
        VStack {
            Text(dinner_selection)
                .padding()
                .font(.headline)
            
            Button (action: {
                choice = Int.random(in: 0..<DinnerData.Dinners.count)
                dinner_selection = DinnerData.Dinners[choice].name
            }) {
                Text ("Select")
                    .font(.headline)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(6)
      
            }

        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
