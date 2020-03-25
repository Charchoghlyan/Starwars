//
//  Personage.swift
//  StarWars
//
//  Created by Sergey Charchoghlyan on 3/22/20.
//  Copyright © 2020 Sergey Charchoghlyan. All rights reserved.
//

import Foundation
import RxDataSources
import Realm
import RealmSwift

class PersonageSearchResponse: Decodable {
    var count: Int = 0
    var personages = List<Personage>()
    
    enum CodingKeys: String, CodingKey {
        case count
        case next
        case previous
        case personages = "results"
    }
    
    required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.count = try container.decode(Int.self, forKey: .count)
        // Map array
        let personageList = try container.decodeIfPresent([Personage].self, forKey: .personages) ?? [Personage()]
        personages.append(objectsIn: personageList)
        
    }
}

class Personage: Object, Decodable {
    @objc dynamic var name: String = ""
    @objc dynamic var eyeColor: String = ""
    @objc dynamic var gender: String = ""
    @objc dynamic var hairColor: String = ""
    @objc dynamic var url: String = ""
    
    private enum CodingKeys: String, CodingKey {
        case name
        case eyeColor = "eye_color"
        case gender
        case hairColor = "hair_color"
        case url
    }
    
    override class func primaryKey() -> String? {
        return "url"
    }
    
    required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.eyeColor = try container.decode(String.self, forKey: .eyeColor)
        self.gender = try container.decode(String.self, forKey: .gender)
        self.hairColor = try container.decode(String.self, forKey: .hairColor)
        self.url = try container.decode(String.self, forKey: .url)
    }
}


extension Personage: IdentifiableType {
    var identity: String {
        return name
    }
}

