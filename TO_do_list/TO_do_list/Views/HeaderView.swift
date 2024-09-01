//
//  HeaderView.swift
//  TO_do_list
//
//  Created by Ziyad Qassem on 01/09/2024.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.pink)
                .rotationEffect(Angle(degrees:20 ))
            
            VStack {
                Text("To Do List")
                    .fontWeight(.bold)
                    .font(.system(size: 45))
                    .foregroundStyle(.white)  
                
                Text("Get Things Done")
                    .font(.system(size: 25))
                    .foregroundStyle(.white)
            }
            .padding(.top, 40)
        }.frame(width: UIScreen.main.bounds.width * 3 , height:  300)
            .offset(y: -105)
            
    }
}

#Preview {
    HeaderView()
}
