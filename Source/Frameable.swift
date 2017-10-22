//
//  Frameable.swift
//  FloorplanB
//
//  Created by Matt on 10/22/17.
//  Copyright © 2017 Matt. All rights reserved.
//

import UIKit

protocol Frameable {
  var frame: CGRect { get set }
}

extension Frameable {
  var fpb: Frameable {
    get {
      return self
    }
    set(newValue) {
      frame = newValue.frame
    }
  }

  var width: CGFloat {
    get {
      return frame.width
    }
    set(newValue) {
      let originalOrigin = frame.origin
      frame.size.width = newValue
      frame.origin = originalOrigin
    }
  }

  var height: CGFloat {
    get {
      return frame.height
    }
    set(newValue) {
      let originalOrigin = frame.origin
      frame.size.height = newValue
      frame.origin = originalOrigin
    }
  }

  var top: CGFloat {
    get {
      return frame.minY
    }
    set(newValue) {
      frame.origin.y = newValue
    }
  }

  var bottom: CGFloat {
    get {
      return frame.maxY
    }
    set(newValue) {
      frame.origin.y = newValue - height
    }
  }

  var left: CGFloat {
    get {
      return frame.minX
    }
    set(newValue) {
      frame.origin.x = newValue
    }
  }

  var right: CGFloat {
    get {
      return frame.maxX
    }
    set(newValue) {
      frame.origin.x = newValue - width
    }
  }

  var topLeftCorner: CGPoint {
    get {
      return CGPoint(x: left, y: top)
    }
    set(newValue) {
      left = newValue.x
      top = newValue.y
    }
  }

  var topRightCorner: CGPoint {
    get {
      return CGPoint(x: right, y: top)
    }
    set(newValue) {
      right = newValue.x
      top = newValue.y
    }
  }

  var bottomLeftCorner: CGPoint {
    get {
      return CGPoint(x: left, y: bottom)
    }
    set(newValue) {
      left = newValue.x
      bottom = newValue.y
    }
  }

  var bottomRightCorner: CGPoint {
    get {
      return CGPoint(x: right, y: bottom)
    }
    set(newValue) {
      right = newValue.x
      bottom = newValue.y
    }
  }

  var center: CGPoint {
    get {
      return CGPoint(x: frame.midX, y: frame.midY)
    }
    set(newValue) {
      frame.origin = CGPoint(x: newValue.x - frame.size.width / 2, y: newValue.y - frame.size.height / 2)
    }
  }

  var centerX: CGFloat {
    get {
      return frame.midX
    }
    set(newValue) {
      center.x = newValue
    }
  }

  var centerY: CGFloat {
    get {
      return frame.midY
    }
    set(newValue) {
      center.y = newValue
    }
  }

  var size: CGSize {
    get {
      return CGSize(width: width, height: height)
    }
    set(newValue) {
      width = newValue.width
      height = newValue.height
    }
  }

  func leading(forUserInterfaceDirection direction: UIUserInterfaceLayoutDirection) -> CGFloat {
    switch (direction) {
      case .leftToRight:
        return left
      case .rightToLeft:
        return right
    }
  }

  mutating func set(leading: CGFloat, forUserInterfaceDirection direction: UIUserInterfaceLayoutDirection) {
    switch (direction) {
      case .leftToRight:
        left = leading
      case .rightToLeft:
        right = leading
    }
  }

  func trailing(forUserInterfaceDirection direction: UIUserInterfaceLayoutDirection) -> CGFloat {
    switch (direction) {
      case .leftToRight:
        return right
      case .rightToLeft:
        return left
    }
  }

  mutating func set(trailing: CGFloat, forUserInterfaceDirection direction: UIUserInterfaceLayoutDirection) {
    switch (direction) {
      case .leftToRight:
        right = trailing
      case .rightToLeft:
        left = trailing
    }
  }

  mutating func resize(withWidth width: CGFloat) -> Frameable {
    self.width = width
    return self
  }

  mutating func resize(withHeight height: CGFloat) -> Frameable {
    self.height = height
    return self
  }

  mutating func resize(withSize size: CGSize) -> Frameable {
    self.size = size
    return self
  }

  mutating func resizeHeight(toFit attributedString: NSAttributedString, lineFragmentPadding: CGFloat) -> Frameable {
    self.height = attributedString.height(forWidth: width, lineFragmentPadding: lineFragmentPadding)
    return self
  }

  mutating func resizeWidth(toFit attributedString: NSAttributedString, lineFragmentPadding: CGFloat) -> Frameable {
    self.width = attributedString.width(forHeight: height, lineFragmentPadding: lineFragmentPadding)
    return self
  }

  mutating func reposition(withTop top: CGFloat) -> Frameable {
    self.top = top
    return self
  }

  mutating func reposition(withBottom bottom: CGFloat) -> Frameable {
    self.bottom = bottom
    return self
  }

  mutating func reposition(withLeft left: CGFloat) -> Frameable {
    self.left = left
    return self
  }

  mutating func reposition(withRight right: CGFloat) -> Frameable {
    self.right = right
    return self
  }

  mutating func reposition(withTopLeftCorner topLeftCorner: CGPoint) -> Frameable {
    self.topLeftCorner = topLeftCorner
    return self
  }

  mutating func reposition(withTopRightCorner topRightCorner: CGPoint) -> Frameable {
    self.topRightCorner = topRightCorner
    return self
  }

  mutating func reposition(withBottomLeftCorner bottomLeftCorner: CGPoint) -> Frameable {
    self.bottomLeftCorner = bottomLeftCorner
    return self
  }

  mutating func reposition(withBottomRightCorner bottomRightCorner: CGPoint) -> Frameable {
    self.bottomRightCorner = bottomRightCorner
    return self
  }

  mutating func reposition(withCenter center: CGPoint) -> Frameable {
    self.center = center
    return self
  }

  mutating func reposition(withCenterX centerX: CGFloat) -> Frameable {
    self.centerX = centerX
    return self
  }

  mutating func reposition(withCenterY centerY: CGFloat) -> Frameable {
    self.centerY = centerY
    return self
  }
}
