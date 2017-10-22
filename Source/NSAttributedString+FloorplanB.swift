//
//  NSAttributedString+FloorplanB.swift
//  FloorplanB
//
//  Created by Matt on 10/22/17.
//  Copyright © 2017 Matt. All rights reserved.
//

import UIKit

extension NSAttributedString {
  private func rectFitting(size: CGSize, lineFragmentPadding: CGFloat) -> CGRect {
    let layoutManager = NSLayoutManager()

    let textContainer = NSTextContainer(size: size)
    textContainer.lineFragmentPadding = lineFragmentPadding

    let textStorage = NSTextStorage(attributedString: self)

    layoutManager.addTextContainer(textContainer)
    textStorage.addLayoutManager(layoutManager)
    return layoutManager.usedRect(for: textContainer)
  }

  func height(forWidth width: CGFloat, lineFragmentPadding: CGFloat) -> CGFloat {
    return rectFitting(size: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude), lineFragmentPadding: lineFragmentPadding).height
  }

  func width(forHeight height: CGFloat, lineFragmentPadding: CGFloat) -> CGFloat {
    return rectFitting(size: CGSize(width: CGFloat.greatestFiniteMagnitude, height: height), lineFragmentPadding: lineFragmentPadding).width
  }

  func minimalSize(toFitWidth width: CGFloat, lineFragmentPadding: CGFloat) -> CGSize {
    let fitHeight = self.height(forWidth: width, lineFragmentPadding: lineFragmentPadding)
    let fitWidth = rectFitting(size: CGSize(width: width, height: fitHeight), lineFragmentPadding: lineFragmentPadding).width
    return CGSize(width: fitWidth, height: fitHeight)
  }

  func minimalSize(toFitHeight height: CGFloat, lineFragmentPadding: CGFloat) -> CGSize {
    let fitWidth = self.width(forHeight: height, lineFragmentPadding: lineFragmentPadding)
    let fitHeight = rectFitting(size: CGSize(width: fitWidth, height: height), lineFragmentPadding: lineFragmentPadding).height
    return CGSize(width: fitWidth, height: fitHeight)
  }

  private func firstBaseline(for size: CGSize, lineFragmentPadding: CGFloat) -> CGFloat {
    let layoutManager = NSLayoutManager()

    let textContainer = NSTextContainer(size: size)
    textContainer.lineFragmentPadding = lineFragmentPadding

    let textStorage = NSTextStorage(attributedString: self)

    layoutManager.addTextContainer(textContainer)
    textStorage.addLayoutManager(layoutManager)
    layoutManager.glyphRange(for: textContainer)

    let attributesAtFirstCharacter = attributes(at: 0, effectiveRange: nil)
    let font = attributesAtFirstCharacter[NSAttributedStringKey.font] as! UIFont
    let baseline = font.ascender + 1
    return baseline
  }

  func firstBaseline(forWidth width: CGFloat, lineFragementPadding: CGFloat) -> CGFloat {
    return firstBaseline(
      for: minimalSize(toFitWidth: width, lineFragmentPadding: lineFragementPadding),
      lineFragmentPadding: lineFragementPadding
    )
  }

  func firstBaseline(forHeight height: CGFloat, lineFragementPadding: CGFloat) -> CGFloat {
    return firstBaseline(
      for: minimalSize(toFitHeight: height, lineFragmentPadding: lineFragementPadding),
      lineFragmentPadding: lineFragementPadding
    )
  }

  private func lastBaseline(forSize size: CGSize, lineFragmentPadding: CGFloat) -> CGFloat {
    let layoutManager = NSLayoutManager()

    let textContainer = NSTextContainer(size: size)
    textContainer.lineFragmentPadding = lineFragmentPadding

    let textStorage = NSTextStorage(attributedString: self)

    layoutManager.addTextContainer(textContainer)
    textStorage.addLayoutManager(layoutManager)

    let range = layoutManager.glyphRange(for: textContainer)
    let index: Int = range.length > 0 ? range.length - 1 : 0
    let rect = layoutManager.lineFragmentRect(forGlyphAt: index, effectiveRange: nil)
    let attributesAtLastCharacter = attributes(at: length-1, effectiveRange: nil)
    let font = attributesAtLastCharacter[NSAttributedStringKey.font] as! UIFont
    let baseline = rect.minY + font.ascender + 1
    return baseline
  }

  func lastBaseline(forWidth width: CGFloat, lineFragementPadding: CGFloat) -> CGFloat {
    return lastBaseline(
      forSize: minimalSize(toFitWidth: width, lineFragmentPadding: lineFragementPadding),
      lineFragmentPadding: lineFragementPadding
    )
  }

  func lastBaseline(forHeight height: CGFloat, lineFragementPadding: CGFloat) -> CGFloat {
    return lastBaseline(
      forSize: minimalSize(toFitHeight: height, lineFragmentPadding: lineFragementPadding),
      lineFragmentPadding: lineFragementPadding
    )
  }
}
