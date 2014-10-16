//
//  Board.swift
//  chess2
//
//  Created by Berkus on 15/10/14.
//  Copyright (c) 2014 Berkus. All rights reserved.
//

import Foundation

class Board
{
    var pieces = [Piece]()

    required init()
    {
        pieces.append(Piece(.White,.Rook))
        pieces.append(Piece(.White,.Knight))
        pieces.append(Piece(.White,.Bishop))
        pieces.append(Piece(.White,.King))
        pieces.append(Piece(.White,.Queen))
        pieces.append(Piece(.White,.Bishop))
        pieces.append(Piece(.White,.Knight))
        pieces.append(Piece(.White,.Rook))

        for i in 8...15
        {
            pieces.append(Piece(.White,.Pawn))
        }

        for i in 16...47
        {
            pieces.append(Piece(.None,.Empty))
        }

        for i in 48...55
        {
            pieces.append(Piece(.Black,.Pawn))
        }

        pieces.append(Piece(.Black,.Rook))
        pieces.append(Piece(.Black,.Knight))
        pieces.append(Piece(.Black,.Bishop))
        pieces.append(Piece(.Black,.King))
        pieces.append(Piece(.Black,.Queen))
        pieces.append(Piece(.Black,.Bishop))
        pieces.append(Piece(.Black,.Knight))
        pieces.append(Piece(.Black,.Rook))
    }
    func pieceAtRank(rank: Int, andFile file: Int) -> Piece
    {
        return pieces[rank*8+file]
    }
}
