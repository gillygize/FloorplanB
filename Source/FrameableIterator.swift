//
//  FrameableIterator.swift
//  FloorplanB
//
//  Created by Matt on 10/22/17.
//  Copyright © 2017 Matt. All rights reserved.
//

import Foundation

struct FrameableIterator<Base: IteratorProtocol>: IteratorProtocol, Sequence where Base.Element == Frameable {
  typealias Element = Frameable

  private var base: Base
  let operation: (Frameable)->Frameable

  init(base: Base, operation: @escaping (Frameable)->Frameable) {
    self.base = base
    self.operation = operation
  }

  mutating func next() -> Frameable? {
    guard let frameable = base.next() else { return nil }
    return operation(frameable)
  }
}
