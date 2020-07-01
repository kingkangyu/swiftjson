//
//  BDASRResponse.swift
//  json
//
//  Created by kangyu on 2020/7/1.
//  Copyright © 2020 kangyu. All rights reserved.
//

import SwiftUI

struct BDASRResponse: Codable{
    var results_recognition:Array<String>
//    var origin_result:BDASRResult
    var corpus_no:Int
    var err_no:Int
    var raf:Int
    var sn:String
//    var result:BDASRWordResult
    var word:Array<String>
    
    enum CodingKeys: String, CodingKey {
        case originresult = "origin_result"
        case results_recognition
    }

    enum OriginresultKeys: String, CodingKey {
        case corpus_no
        case err_no
        case raf
        case sn
        case result
    }
    
    enum ResultKeys: String, CodingKey {
        case word
    }
}

extension BDASRResponse {
    init(from decoder: Decoder) throws {
        let vals = try decoder.container(keyedBy: CodingKeys.self)
        
        results_recognition = try vals.decode(Array<String>.self, forKey: CodingKeys.results_recognition)
        
        let originresult = try vals.nestedContainer(keyedBy: OriginresultKeys.self, forKey: .originresult)
        corpus_no = try originresult.decode(Int.self, forKey: .corpus_no)
        err_no = try originresult.decode(Int.self, forKey: .err_no)
        raf = try originresult.decode(Int.self, forKey: .raf)
        sn = try originresult.decode(String.self, forKey: .sn)
        
        let result = try originresult.nestedContainer(keyedBy: ResultKeys.self, forKey: .result)
        word = try result.decode(Array<String>.self, forKey: .word)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(results_recognition, forKey: .results_recognition)
        
        var originresult = container.nestedContainer(keyedBy: OriginresultKeys.self, forKey: .originresult)
        try originresult.encode(corpus_no, forKey: .corpus_no)
        try originresult.encode(err_no, forKey: .err_no)
        try originresult.encode(raf, forKey: .raf)
        try originresult.encode(sn, forKey: .sn)
        
        var result = originresult.nestedContainer(keyedBy: ResultKeys.self, forKey: .result)
        try result.encode(word, forKey: .word)
    }
}
