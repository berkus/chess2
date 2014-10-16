//
//  Board.swift
//  chess2
//
//  Created by Berkus on 18/06/14.
//  Copyright (c) 2014 Berkus. All rights reserved.
//

import Foundation
import UIKit

class BoardView : UIView
{
    var TOP_OFFSET: CGFloat = 21.0
    var LEFT_OFFSET: CGFloat = 21.0
    var FONT_SIZE: CGFloat = 14.0
    var boardImage: UIImage
    
    var board: Board

    required init(coder aDecoder: NSCoder)
    {
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            boardImage = UIImage(named: "board_ipad.png")
            TOP_OFFSET = 50.0
            LEFT_OFFSET = 50.0
            FONT_SIZE = 21.0
        } else {
            boardImage = UIImage(named: "board_iphone.png")
        }
        board = Board()
        super.init(coder: aDecoder)
    }
    
    override func drawRect(rect: CGRect) {
        // Divide rect into 8x8 subrects
        
        let width = CGRectInset(rect, LEFT_OFFSET, 0.0).width / 8.0
        let height = CGRectInset(rect, 0.0, TOP_OFFSET).height / 8.0
        let startX = CGRectGetMinX(rect)
        let endX = CGRectGetMaxX(rect) - LEFT_OFFSET
        let startY = CGRectGetMinY(rect)
        let endY = CGRectGetMaxY(rect) - TOP_OFFSET
        
        // Draw the board (only in one orientation atm).
        boardImage.drawInRect(rect)
        
        // Draw board text labels, rank and file.
        let font = UIFont(descriptor: UIFontDescriptor.preferredFontDescriptorWithTextStyle(UIFontTextStyleBody), size: FONT_SIZE)
        
        let context = UIGraphicsGetCurrentContext()
        CGContextSaveGState(context)
        CGContextClipToRect(context, rect)
        
        CGContextSetTextDrawingMode(context, kCGTextFill)
        CGContextSetRGBFillColor(context, /*R*/0.7, /*G*/0.7, /*B*/0.7, /*A*/0.7)
        
        //NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[NSFont systemFontOfSize:[NSFont systemFontSizeForControlSize:NSRegularControlSize]], NSFontAttributeName, DIMENSION_LINE_LABEL_TEXT_COLOR, NSForegroundColorAttributeName, DIMENSION_LINE_LABEL_BACKGROUND_COLOR, NSBackgroundColorAttributeName, nil];
        
        
        for var rank: CGFloat = 0.0; rank < 8.0; rank += 1.0
        {
            let ranks = "\(Int(rank+1))"
            let dim = ranks.sizeWithAttributes([:])
            let locl = CGPointMake(startX + (LEFT_OFFSET - dim.width) / 2.0, startY + TOP_OFFSET + dim.height / 2.0 + height * rank)
            let locr = CGPointMake(endX   + (LEFT_OFFSET - dim.width)/2.0, startY + TOP_OFFSET + dim.height/2.0 + height * rank)
            ranks.drawAtPoint(locl, withAttributes:[:])
            ranks.drawAtPoint(locr, withAttributes:[:])
        }
        for var file: CGFloat = 0.0; file < 8.0; file += 1.0
        {
            let files = ["h","g","f","e","d","c","b","a"][Int(file)]
            let dim = files.sizeWithAttributes([:])
            let loct = CGPointMake(startX + LEFT_OFFSET + (width - dim.width)/2 + width * file, startY + (TOP_OFFSET - dim.height)/2)
            let locb = CGPointMake(startX + LEFT_OFFSET + (width - dim.width)/2 + width * file, endY   + (TOP_OFFSET - dim.height)/2)
            files.drawAtPoint(loct, withAttributes:[:])
            files.drawAtPoint(locb, withAttributes:[:])
        }
        
        CGContextRestoreGState(context);
        
        // Draw the pieces.
        for var rank: CGFloat = 0.0; rank < 8.0; rank += 1
        {
            for var file: CGFloat = 0.0; file < 8.0; file += 1
            {
                let p = CGPointMake(startX + LEFT_OFFSET + width * file, startY + TOP_OFFSET + height * rank);
                let s = CGSizeMake(width, height);
                
                board.pieceAtRank(Int(rank), andFile:Int(file)).image.drawInRect(CGRect(origin: p, size: s))
            }
        }
    
    }
}
