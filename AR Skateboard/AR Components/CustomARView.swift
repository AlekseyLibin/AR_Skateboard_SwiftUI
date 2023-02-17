//
//  CustomARView.swift
//  AR Skateboard
//
//  Created by Aleksey Libin on 17.02.2023.
//

import SwiftUI
import Combine
import ARKit
import RealityKit

final class CustomARView: ARView {
  
  required init(frame frameRect: CGRect) {
    super.init(frame: frameRect)
  }
  
  @MainActor required dynamic init?(coder decoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  convenience init() {
    self.init(frame: UIScreen.main.bounds)
    
    subscribeToActionStream()
  }
  
  private var cancellables: Set<AnyCancellable> = []
  
  func subscribeToActionStream() {
    ARManager.shared
      .actionStream
      .sink { [weak self] action in
        switch action {
        case .removeAllAnchors:
          self?.scene.anchors.removeAll()
        case .placeBlock(color: let color):
          self?.placeBlock(ofColor: color)
        }
      }
      .store(in: &cancellables)
  }
  
  func configurationExample() {
    
    let configuration = ARWorldTrackingConfiguration()
    session.run(configuration)
    
    let _ = ARGeoTrackingConfiguration()
    
    let _ = ARFaceTrackingConfiguration()
    
    let _ = ARBodyTrackingConfiguration()
  }
  
  func anchorExample() {
    let coordinateAnchor = AnchorEntity(world: .zero)
    scene.addAnchor(coordinateAnchor)
  }
  
  func entutyExample() {
    /*
     let _ = try? Entity.load(named: "ustzFileName")
     let _ = try? Entity.load(named: "fileName")
     */
    
    let box = MeshResource.generateBox(size: 1)
    let entity = ModelEntity(mesh: box)
    
    let anchor = AnchorEntity()
    anchor.addChild(entity)
  }
  
  func placeBlock(ofColor color: Color) {
    let block = MeshResource.generateBox(size: 1)
    let material = SimpleMaterial(color: UIColor(color), isMetallic: true)
    let entity = ModelEntity(mesh: block, materials: [material])
    
    let anchor = AnchorEntity(plane: .horizontal)
    anchor.addChild(entity)
    
    scene.addAnchor(anchor)
  }
}
