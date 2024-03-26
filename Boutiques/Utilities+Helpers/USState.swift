//
//  StateList.swift
//  Boutiques
//
//  Created by adobada on 3/23/24.
//

import Foundation

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
