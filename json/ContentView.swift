//
//  ContentView.swift
//  json
//
//  Created by kangyu on 2020/7/1.
//  Copyright © 2020 kangyu. All rights reserved.
//

import SwiftUI

struct GroceryProduct: Codable {
    var name: String
    var points: Int
    var description: String?
}


struct ContentView: View {
    var body: some View {
//        Text("Hello, World!")
        VStack {
            Button(action: {
                let pear = GroceryProduct(name: "Pear", points: 250, description: "A ripe pear.")

                let encoder = JSONEncoder()
                encoder.outputFormatting = .prettyPrinted
                
                do {
                    let data = try encoder.encode(pear)
                    print(String(data: data, encoding: .utf8)!)
                }catch let error as NSError {
                  print("Error: \(error.localizedDescription)")
                }
                
            }){
                Text("Encode")
            }.padding()
            
            Button(action: {
                let json = """
                {
                    "name": "Durian",
                    "points": 600,
                    "description": "A fruit with a distinctive scent."
                }
                """.data(using: .utf8)!
                let decoder = JSONDecoder()
                
                do {
                    let product = try decoder.decode(GroceryProduct.self, from: json)
                    print(product)
                    print(product.name)
                }catch let error as NSError {
                  print("Error: \(error.localizedDescription)")
                }
                
            }){
                Text("Decode")
            }.padding()
            
            Button(action: {

                let json = """
                {
                    "origin_result":{
                        "corpus_no":6844008743596235000,
                        "err_no":0,
                        "raf":111,
                        "result":{
                            "word":[
                                "怎么说没有限制"
                            ]
                        },
                        "sn":"48BE0439-46CF-422B-862C-E5B1AF9EA415"
                    },
                    "results_recognition":[
                        "怎么说没有限制"
                    ]
                }
                """.data(using: .utf8)!
                let decoder = JSONDecoder()
                
                do {
                    let product = try decoder.decode(BDASRResponse.self, from: json)
                    print(product)
//                    print(product.origin_result)
                    
                    let encoder = JSONEncoder()
                    encoder.outputFormatting = .prettyPrinted
                    let data = try encoder.encode(product)
                    print(String(data: data, encoding: .utf8)!)
                }catch let error as NSError {
                  print("Error: \(error.localizedDescription)")
                }
                
            }){
                Text("RealDe||En")
            }.padding()
            
            Button(action: {
                let json = """
                {"title":"swift","age":24,"body":{"weight":80,"height":180}}
                """.data(using: .utf8)!
                let decoder = JSONDecoder()
                
                do {
                    let product = try decoder.decode(Person.self, from: json)
                    print(product)
                    print(product.name)
                    
                    let encoder = JSONEncoder()
                    encoder.outputFormatting = .prettyPrinted
                    let data = try encoder.encode(product)
                    print(String(data: data, encoding: .utf8)!)
                }catch let error as NSError {
                  print("Error: \(error.localizedDescription)")
                }
        
                
            }){
                Text("PersonDe||En")
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
