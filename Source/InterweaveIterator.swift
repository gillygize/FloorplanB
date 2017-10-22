//
//  InterweaveIterator.swift
//  FloorplanB
//
//  Created by Matt on 10/22/17.
//  Copyright © 2017 Matt. All rights reserved.
//

import Foundation

struct InterweaveIterator<FirstBase: IteratorProtocol, SecondBase: IteratorProtocol>: IteratorProtocol, Sequence where FirstBase.Element == Frameable, SecondBase.Element == Frameable {
  typealias Element = Frameable

  private var firstBase: FirstBase
  private var secondBase: SecondBase

  private var isFirstTurn = true
  private var dropLastBufferElement = true
  private var upcomingValuesBuffer: [Frameable] = []

  init(firstBase: FirstBase, secondBase: SecondBase) {
    self.firstBase = firstBase
    self.secondBase = secondBase
  }

  mutating func next() -> Frameable? {
    var isFirstEmpty = false

    if let firstFrameable = firstBase.next() {
      upcomingValuesBuffer.append(firstFrameable)
    } else {
      isFirstEmpty = true

      if dropLastBufferElement {
        upcomingValuesBuffer = Array(upcomingValuesBuffer.dropLast())
      }
    }

    if !isFirstEmpty, let secondFrameable = secondBase.next() {
      upcomingValuesBuffer.append(secondFrameable)
    } else if !isFirstEmpty {
      dropLastBufferElement = false
    }

    if upcomingValuesBuffer.count > 0 {
      return upcomingValuesBuffer.removeFirst()
    } else {
      return nil
    }
  }
}
