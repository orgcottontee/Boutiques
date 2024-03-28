//
//  TabIcon.swift
//  Boutiques
//
//  Created by adobada on 3/23/24.
//

import Foundation

enum Constants {
    
    // MARK: - Tab icons for root screen
    
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
    
    // MARK: - Map screen
    
    enum MapScreen {
        static let initialLatitude = 39.831395
        static let initialLongitude = -98.450229
        static let latitudeDelta = 50.0
        static let longitudeDelta = 50.0
    }
    
    // MARK: - List of States
    
    enum USState: String, CaseIterable {
      case allStates
      case california = "CA"
      case colorado = "CO"
      case illinois = "IL"
      case michigan = "MI"
      case minnesota = "MN"
      case newYork = "NY"
      case oregon = "OR"
      case pennsylvania = "PA"
      case washington = "WA"
      case wisconsin = "WI"
       
      var id: String { self.rawValue }
     
      var stateAbbreviation: String {
        switch self {
        case .allStates:
          return "All"
        default:
          return self.rawValue
        }
      }
    }

}
