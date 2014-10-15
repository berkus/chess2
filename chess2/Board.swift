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
    required init()
    {
    }
    func pieceAtRank(rank: Int, andFile file: Int) -> Piece
    {
        return Piece(.White, .Queen)
    }
}
