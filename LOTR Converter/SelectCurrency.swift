//
//  SelectCurrency.swift
//  LOTR Converter
//
//  Created by Anisa Fatimah Azzahra on 07/04/23.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss //for button
    @Binding var leftCurrency:Currency
    @Binding var rightCurrency:Currency
    
    var body: some View {
        ZStack{
            Image("parchment").resizable().background(.brown).edgesIgnoringSafeArea(.all)
            
            VStack{
                Text("Select the currency you are starting with:").fontWeight(.bold).multilineTextAlignment(.center)
                
                IconGrid(currency: $leftCurrency) // $ sign is to bind
                
                
                Text("Select the currency you would like to convert to:").fontWeight(.bold).multilineTextAlignment(.center)
                
                IconGrid(currency: $rightCurrency)
                
                Button("done"){
                    dismiss()
                }.padding(10).foregroundColor(.white).background(.brown).cornerRadius(10.0)
            }
        }
    }
}

struct SelectCurrency_Previews: PreviewProvider {
    static var previews: some View {
        SelectCurrency(
            leftCurrency: .constant(.silverPiece),
            rightCurrency: .constant(.goldPiece)
        )
    }
}
