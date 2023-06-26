//
//  CuurencyIcon.swift
//  LOTR Converter
//
//  Created by Anisa Fatimah Azzahra on 07/04/23.
//

import SwiftUI

struct CurrencyIcon: View {
    @State var image:String
    @State var coinName: String
    
    var body: some View {
        ZStack{
            Image(image).resizable().scaledToFit()
            
            VStack{
                Spacer()
                Text(coinName).font(.caption).background(.brown)
            }
        }.padding(5).frame(width: 100, height: 100).background(.brown).cornerRadius(20)
    }
}

struct CuurencyIcon_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyIcon(image: "copperpenny", coinName: "Copper Penny").previewLayout(.sizeThatFits)
    }
}
