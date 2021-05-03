//
//  ContentView.swift
//  WhatsForDinner WatchKit Extension
//
//  Created by Rich Gruskin on 4/20/21.
//

import SwiftUI



struct ContentView: View {
    
    @State var dinner_selection =  "TurDuckin"

    @ObservedObject var DinnerData = DinnerModel()
    
    @State var tabIndex = 0

    
    var body: some View {
    
        if DinnerData.Dinners.count == 0 {
            Text ("Error Getting Data From the Server!")
        }
        else {
            var choice = Int.random(in: 0..<DinnerData.Dinners.count)
            
            //dinner_selection = DinnerData.Dinners[choice].name
            TabView (selection: $tabIndex) {
              VStack {
                Text(dinner_selection)
                    .padding()
                    .font(.title3)
                
                Button (action: {
                    choice = Int.random(in: 0..<DinnerData.Dinners.count)
                    dinner_selection = DinnerData.Dinners[choice].name
                }) {
                    Text ("Select")
                        .font(.headline)
                        .foregroundColor(.white)
          
                }
                .background(Color.blue)
                .frame(width: 77.0, height: 28.0)
                .cornerRadius(7)
                .padding(.top, 29.0)

            }
              .tabItem {  }
              .tag (0)
                
                List(DinnerData.Dinners) { r in
                    VStack {
                        Text(r.name)
                    }
                }
                .tabItem {  }
                .tag (1)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
