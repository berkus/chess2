//
//  Piece.swift
//  chess2
//
//  Created by Berkus on 18/06/14.
//  Copyright (c) 2014 Berkus. All rights reserved.
//

import Foundation
import UIKit // This UI stuff spilled because of UIImage

enum PieceKind
{
    case Pawn
    case Knight
    case Bishop
    case Rook
    case Queen
    case King
}

enum PieceColor
{
    case White
    case Black
}

class Piece : Hashable
{
    let kind: PieceKind
    let color: PieceColor
    var position: String // Rank-and-file format

    init(_ color: PieceColor, _ kind: PieceKind)
    {
        self.color = color
        self.kind = kind
        self.position = "A1"
    }

    var description: String {
        var result = ""
        switch(color) {
            case .White: result = "White"
            case .Black: result = "Black"
        }
        switch(kind) {
            case .Pawn: result += " pawn"
            case .Knight: result += " knight"
            case .Bishop: result += " bishop"
            case .Rook: result += " rook"
            case .Queen: result += " queen"
            case .King: result += " king"
        }
        result += " on " + position
        return result
    }

    var image: UIImage {
        var result = "images/"
        switch(color) {
            case .White:  result += "white_"
            case .Black:  result += "black_"
        }
        switch(kind) {
            case .Pawn:   result += "pawn"
            case .Knight: result += "knight"
            case .Bishop: result += "bishop"
            case .Rook:   result += "rook"
            case .Queen:  result += "queen"
            case .King:   result += "king"
        }
        result += ".svg"
        return UIImage(named: result)
    }

    var hashValue: Int {
        return 67 &* kind.hashValue &+ 31 &* color.hashValue &+ position.hashValue
    }
}

func ==(a: Piece, b: Piece) -> Bool
{
    return (a.kind == b.kind) && (a.color == b.color) && (a.position == b.position)
}
