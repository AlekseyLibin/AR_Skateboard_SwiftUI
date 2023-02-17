//
//  ARManager.swift
//  AR Skateboard
//
//  Created by Aleksey Libin on 17.02.2023.
//

import Combine

class ARManager {
  static let shared = ARManager()
  private init() { }
  
  let actionStream = PassthroughSubject<ARAction, Never>()
}
