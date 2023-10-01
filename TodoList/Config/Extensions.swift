//
//  Extensions.swift
//  TodoList
//
//  Created by Ольга Ширявцева on 01.10.2023.
//

import Foundation

extension Encodable {
    func asDict() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
        }
        
        
    }
}
