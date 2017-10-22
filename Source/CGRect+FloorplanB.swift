//
//  CGRect+FloorplanB.swift
//  FloorplanB
//
//  Created by Matt on 10/22/17.
//  Copyright © 2017 Matt. All rights reserved.
//

import CoreGraphics

extension CGRect: Frameable {
  var frame: CGRect {
    get {
      return self
    }
    set(newValue) {
      self = newValue
    }
  }
}
