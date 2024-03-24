//
//  JSONLoader.swift
//  SwiftBootcampUIKit
//
//  Created by Jose Luis Escolá García on 7/3/24.
//

import Foundation

// Creamos un protocolo para reutilizar el getJSON
protocol JSONLoader {
    func getJSON<JSON>(url: URL, type: JSON.Type) throws -> JSON where JSON: Codable
}

// y creamos una extensión para darle funcionalidad default.
extension JSONLoader {
    func getJSON<JSON>(url: URL, type: JSON.Type) throws -> JSON where JSON: Codable {
        let data  = try Data(contentsOf: url)
        return try JSONDecoder().decode(type, from: data)
        // Este type podría ser un JSON.self pero entonces tendríamos que tipar en el lugar donde se use el getJSON
        // algo así como let miVar: [Score] = getJson(...)
    }
}
