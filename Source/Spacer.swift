//
//  File.swift
//  FloorplanB
//
//  Created by Matt on 10/22/17.
//  Copyright © 2017 Matt. All rights reserved.
//

import CoreGraphics

struct Spacer: Frameable {
  var frame: CGRect

  init(height: CGFloat) {
    frame = CGRect(x: 0, y: 0, width: 0, height: height)
  }

  init(width: CGFloat) {
    frame = CGRect(x: 0, y: 0, width: width, height: 0)
  }
}
