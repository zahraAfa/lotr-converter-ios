//
//  ExchangeInfo.swift
//  LOTR Converter
//
//  Created by Anisa Fatimah Azzahra on 04/04/23.
//

import SwiftUI

struct ExchangeInfo: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack{
//            background
            Image("parchment").resizable().edgesIgnoringSafeArea(.all).background(.brown)
            
            VStack{
                Text("Exchange Info").font(.largeTitle).bold()
                
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:").padding(EdgeInsets(top: 10, leading: 0, bottom: 20, trailing: 0))
                
                ExchangeRate(leftImage: "goldpiece", rightImage: "goldpenny", leftText: "1 Gold Piece", rightText: "4 Gold Pennies")
                
                ExchangeRate(leftImage: "goldpenny", rightImage: "silverpiece", leftText: "1 Gold Penny", rightText: "4 Silver Pieces")
                
                ExchangeRate(leftImage: "silverpiece", rightImage: "silverpenny", leftText: "1 Silver Piece", rightText: "4 Silver Pennies")
                
                ExchangeRate(leftImage: "silverpenny", rightImage: "copperpenny", leftText: "1 Silver Penny", rightText: "100 Copper Pennies")
                
                Button("Done") {
                    dismiss()
                }.padding(10).foregroundColor(.white).background(.brown).cornerRadius(10.0)

            }.padding(20)
        }.foregroundColor(.black)
    }
}

struct ExchangeInfo_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeInfo()
    }
}
