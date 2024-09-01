//
//  HeaderView.swift
//  TO_do_list
//
//  Created by Ziyad Qassem on 01/09/2024.
//

import SwiftUI

struct HeaderView: View {
    let title : String
    let subtitle : String
    let angel : Double
    let backgoundColor : Color
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(backgoundColor)
                .rotationEffect(Angle(degrees:angel ))
            
            VStack {
                Text(title)
                    .fontWeight(.bold)
                    .font(.system(size: 45))
                    .foregroundStyle(.white)  
                
                Text(subtitle)
                    .font(.system(size: 25))
                    .foregroundStyle(.white)
            }
            .padding(.top, 40)
        }.frame(width: UIScreen.main.bounds.width * 3 , height:  300)
            .offset(y: -105)
            
    }
}

#Preview {
    HeaderView(title: "title", subtitle: "subtitle", angel: 20, backgoundColor: .blue)
}
