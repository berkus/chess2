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
    var TOP_OFFSET = 21
    var LEFT_OFFSET = 21
    var FONT_SIZE = 14.0
    var boardImage: UIImage

    required init(coder aDecoder: NSCoder)
    {
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            boardImage = UIImage(named: "board_ipad.png")
            TOP_OFFSET = 50
            LEFT_OFFSET = 50
            FONT_SIZE = 21.0
        } else {
            boardImage = UIImage(named: "board_iphone.png")
        }
        super.init(coder: aDecoder)
    }
    
    func drawPiece(piece: Piece, atPoint point: CGPoint, withSize size: CGSize)
    {
        let rect = CGRect(origin: point, size: size)
        piece.image.drawInRect(rect);
    }
}
