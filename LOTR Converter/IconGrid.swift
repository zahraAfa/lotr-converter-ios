//
//  IconGrid.swift
//  LOTR Converter
//
//  Created by Anisa Fatimah Azzahra on 23/06/23.
//

import SwiftUI

struct IconGrid: View {
    @Binding var currency : Currency
    @State var gridItems = [GridItem(), GridItem(), GridItem()]
    
    var body: some View {
        LazyVGrid(columns:gridItems){
            ForEach(0..<5){ i in
                
                if Currency.allCases[i] == currency {
                        CurrencyIcon(
                            image: CurrencyImage.allCases[i].rawValue, coinName: CurrencyText.allCases[i].rawValue
                        ).overlay(RoundedRectangle(cornerRadius: 20).stroke(.black, lineWidth: 2).opacity(0.5)).shadow(color: .black, radius: 9)
                } else {
                    CurrencyIcon(
                        image: CurrencyImage.allCases[i].rawValue, coinName: CurrencyText.allCases[i].rawValue
                    ).onTapGesture {
                        currency = Currency.allCases[i]
                    }
                }
            }
        }.padding([.bottom, .leading, .trailing])
    }
}

struct IconGrid_Previews: PreviewProvider {
    static var previews: some View {
        IconGrid(currency: .constant(.silverPiece))
    }
}
