//
//  ExchangeRate.swift
//  LOTR Converter
//
//  Created by Anisa Fatimah Azzahra on 04/04/23.
//

import SwiftUI

struct ExchangeRate: View {
    @State var leftImage : String
    @State var rightImage : String
    @State var leftText : String
    @State var rightText : String
    
    var body: some View {
        HStack{
            Image(leftImage).resizable().scaledToFit().frame(height: 33)
            Text(leftText)

            Image(systemName: "equal")

            Text(rightText)
            Image(rightImage).resizable().scaledToFit().frame(height: 33)
        }
    }
}

struct ExchangeRate_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeRate(leftImage: "goldpiece", rightImage: "goldpenny", leftText: "1 Gold Piece", rightText: "4 Gold Pennies")
            .previewLayout(.sizeThatFits)
    }
}
