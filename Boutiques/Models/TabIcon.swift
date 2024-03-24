//
//  TabIcon.swift
//  Boutiques
//
//  Created by adobada on 3/23/24.
//

import Foundation

enum TabIcon: String, CaseIterable, Hashable {
    case door = "door"
    case map = "map"
    case heart = "heart"
    case gear = "gear"
    
    var selected: String {
        switch self {
        case .door:
            return "door.left.hand.open"
        case .map:
            return "mappin"
        case .heart:
            return "heart.fill"
        case .gear:
            return "gearshape.fill"
        }
    }
    
    var unselected: String {
        switch self {
        case .door:
            return "door.left.hand.closed"
        case .map:
            return "map"
        case .heart:
            return "heart"
        case .gear:
            return "gear"
        }
    }
}
