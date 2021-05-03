//
//  DinnerModel.swift
//  WhatsForDinner
//
//  Created by Rich Gruskin on 4/20/21.
//

import Foundation

class DinnerModel : ObservableObject {
     @Published var Dinners = [Dinner]()
    
    init () {

       //GetLocalData()
        
       GetRemoteData()
    }
    
    func GetRemoteData() {
        let urlString = "https://rgruskin.github.io/DinnerData/DinnerData.json"
        
        let url = URL(string: urlString)
        
        guard url != nil else {
            return
        }
        
        let request = URLRequest(url: url!)
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
               print("Error from session task...")
               //print(error)
               return
            }
            
            
         // work with decoder
            let decoder = JSONDecoder()
        
            do {
               let DinnerData = try decoder.decode([Dinner].self, from: data!)

                DispatchQueue.main.async {
                    
                    for d in DinnerData {
                        d.id = UUID()
                    }
                    self.Dinners = DinnerData
                }
                
                for d in DinnerData {
                    d.id = UUID()
                }
            
            } catch {
               print ("Caught error in decoder...")
               print(error)
            }
        }
        
        dataTask.resume()

    }
    
    func GetLocalData() {
        let pathString = Bundle.main.path(forResource: "Data", ofType: "json")
        
        if let path = pathString {
            let url = URL(fileURLWithPath: path)
        
            do {
            
                let data = try Data(contentsOf: url)
                
                let decoder = JSONDecoder()
            
                do {
                   let DinnerData = try decoder.decode([Dinner].self, from: data)
                    
                    for d in DinnerData {
                        d.id = UUID()
                    }
                    
                    self.Dinners = DinnerData
                
                } catch {
                   print(error)
                }
            
            } catch {
                print(error)
            }
        }
    }
    
}
