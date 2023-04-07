//
//  CuurencyIcon.swift
//  LOTR Converter
//
//  Created by Anisa Fatimah Azzahra on 07/04/23.
//

import SwiftUI

struct CurrencyIcon: View {
    var body: some View {
        ZStack{
            Image("copperpenny").resizable().scaledToFit()
            
            VStack{
                Spacer()
                Text("Copper penny").font(.caption).background(.brown)
            }
        }.padding(5).frame(width: 100, height: 100)
    }
}

struct CuurencyIcon_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyIcon()
    }
}
