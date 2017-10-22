//
//  Sequence+FloorplanB.swift
//  FloorplanB
//
//  Created by Matt on 10/22/17.
//  Copyright © 2017 Matt. All rights reserved.
//

import CoreGraphics

extension Sequence where Element == Frameable {
  var sumOfHeights: CGFloat {
    return total { $0.height }
  }

  var sumOfWidths: CGFloat {
    return total { $0.width }
  }

  var minHeight: CGFloat {
    return min { $0.height }
  }

  var maxHeight: CGFloat {
    return max { $0.height }
  }

  var minWidth: CGFloat {
    return min { $0.width }
  }

  var maxWidth: CGFloat {
    return max { $0.width }
  }

  var minTop: CGFloat {
    return min { $0.top }
  }

  var maxTop: CGFloat {
    return max { $0.top }
  }

  var minBottom: CGFloat {
    return min { $0.bottom }
  }

  var maxBottom: CGFloat {
    return max { $0.bottom }
  }

  var minLeft: CGFloat {
    return min { $0.left }
  }

  var maxLeft: CGFloat {
    return max { $0.left }
  }

  var minRight: CGFloat {
    return min { $0.right }
  }

  var maxRight: CGFloat {
    return max { $0.right }
  }

  var minCenterX: CGFloat {
    return min { $0.centerX }
  }

  var maxCenterX: CGFloat {
    return max { $0.centerX }
  }

  var minCenterY: CGFloat {
    return min { $0.centerY }
  }

  var maxCenterY: CGFloat {
    return max { $0.centerY }
  }

  private func apply(operation: @escaping (Frameable)->Frameable) -> AnySequence<Element> {
    return AnySequence(FrameableIterator(base: self.makeIterator(), operation: operation))
  }

  private func total(_ dimensionGetter: @escaping (Frameable) -> CGFloat) -> CGFloat {
    return reduce(CGFloat.leastNormalMagnitude) { memo, frameable in
      return dimensionGetter(frameable) + memo
    }
  }

  private func max(_ dimensionGetter: (Frameable) -> CGFloat) -> CGFloat {
    return reduce(CGFloat.leastNormalMagnitude) { memo, frameable in
      return Swift.max(memo, dimensionGetter(frameable))
    }
  }

  private func min(_ dimensionGetter: (Frameable) -> CGFloat) -> CGFloat {
    return reduce(CGFloat.greatestFiniteMagnitude) { memo, frameable in
      return Swift.min(memo, dimensionGetter(frameable))
    }
  }

  func resize(withWidth width: CGFloat) -> AnySequence<Element> {
    return apply { frameable in
      var mutableFramable = frameable
      return mutableFramable.resize(withWidth: width)
    }
  }

  func resize(withHeight height: CGFloat) -> AnySequence<Element> {
    return apply { frameable in
      var mutableFramable = frameable
      return mutableFramable.resize(withHeight: height)
    }
  }

  func resize(withSize size: CGSize) -> AnySequence<Element> {
    return apply { frameable in
      var mutableFramable = frameable
      return mutableFramable.resize(withSize: size)
    }
  }

  func reposition(withTop top: CGFloat) -> AnySequence<Element> {
    return apply { frameable in
      var mutableFramable = frameable
      return mutableFramable.reposition(withTop: top)
    }
  }

  func reposition(withBottom bottom: CGFloat) -> AnySequence<Element> {
    return apply { frameable in
      var mutableFramable = frameable
      return mutableFramable.reposition(withBottom: bottom)
    }
  }

  func reposition(withLeft left: CGFloat) -> AnySequence<Element> {
    return apply { frameable in
      var mutableFramable = frameable
      return mutableFramable.reposition(withLeft: left)
    }
  }

  func reposition(withRight right: CGFloat) -> AnySequence<Element> {
    return apply { frameable in
      var mutableFramable = frameable
      return mutableFramable.reposition(withRight: right)
    }
  }

  func reposition(withTopLeftCorner topLeftCorner: CGPoint) -> AnySequence<Element> {
    return apply { frameable in
      var mutableFramable = frameable
      return mutableFramable.reposition(withTopLeftCorner: topLeftCorner)
    }
  }

  func reposition(withTopRightCorner topRightCorner: CGPoint) -> AnySequence<Element> {
    return apply { frameable in
      var mutableFramable = frameable
      return mutableFramable.reposition(withTopRightCorner: topRightCorner)
    }
  }

  func reposition(withBottomLeftCorner bottomLeftCorner: CGPoint) -> AnySequence<Element> {
    return apply { frameable in
      var mutableFramable = frameable
      return mutableFramable.reposition(withBottomLeftCorner: bottomLeftCorner)
    }
  }

  func reposition(withBottomRightCorner bottomRightCorner: CGPoint) -> AnySequence<Element> {
    return apply { frameable in
      var mutableFramable = frameable
      return mutableFramable.reposition(withBottomRightCorner: bottomRightCorner)
    }
  }

  func reposition(withCenter center: CGPoint) -> AnySequence<Element> {
    return apply { frameable in
      var mutableFramable = frameable
      return mutableFramable.reposition(withCenter: center)
    }
  }

  func reposition(withCenterX centerX: CGFloat) -> AnySequence<Element> {
    return apply { frameable in
      var mutableFramable = frameable
      return mutableFramable.reposition(withCenterX: centerX)
    }
  }

  func reposition(withCenterY centerY: CGFloat) -> AnySequence<Element> {
    return apply { frameable in
      var mutableFramable = frameable
      return mutableFramable.reposition(withCenterY: centerY)
    }
  }

  func arrangeTopToBottom(fromTop top: CGFloat) -> AnySequence<Element> {
    var currentPosition = top

    return apply { frameable in
      var mutableFrameable = frameable
      mutableFrameable.top = currentPosition
      currentPosition += frameable.height
      return mutableFrameable
    }
  }

  func arrangeBottomToTop(fromBottom bottom: CGFloat) -> AnySequence<Element> {
    var currentPosition = bottom

    return apply { frameable in
      var mutableFrameable = frameable
      mutableFrameable.bottom = currentPosition
      currentPosition -= frameable.height
      return mutableFrameable
    }
  }

  func arrangeLeftToRight(fromLeft left: CGFloat) -> AnySequence<Element> {
    var currentPosition = left

    return apply { frameable in
      var mutableFrameable = frameable
      mutableFrameable.left = currentPosition
      currentPosition += mutableFrameable.width
      return mutableFrameable
    }
  }

  func arrangeRightToLeft(fromRight right: CGFloat) -> AnySequence<Element> {
    var currentPosition = right

    return apply { frameable in
      var mutableFrameable = frameable
      mutableFrameable.right = currentPosition
      currentPosition -= mutableFrameable.width
      return mutableFrameable
    }
  }

  func fitVertically(within height: CGFloat, byResizing frameable: Frameable) -> Self {
    var mutableFrameable = frameable
    mutableFrameable.height += height - sumOfHeights
    return self
  }

  func fitHorizonatally(within width: CGFloat, byResizing frameable: Frameable) -> Self {
    var mutableFrameable = frameable
    mutableFrameable.width += width - sumOfWidths
    return self
  }

  func space(with spacers: [Frameable]) -> AnySequence<Element> {
    return AnySequence(InterweaveIterator(firstBase: makeIterator(), secondBase: spacers.makeIterator()))
  }

  func space(withHeight height: CGFloat) -> AnySequence<Element> {
    return AnySequence(InterweaveIterator(firstBase: makeIterator(), secondBase: ConstantIterator(value: Spacer(height: height))))
  }

  func space(withWidth width: CGFloat) -> AnySequence<Element> {
    return AnySequence(InterweaveIterator(firstBase: makeIterator(), secondBase: ConstantIterator(value: Spacer(width: width))))
  }

  @discardableResult func toArray() -> [Element] {
    return Array(self)
  }
}
