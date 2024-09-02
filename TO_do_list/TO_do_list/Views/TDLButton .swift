//
//  TDLButton .swift
//  TO_do_list
//
//  Created by Ziyad Qassem on 02/09/2024.
//

import SwiftUI

struct TDLButton: View {
    let title : String
    let buttonColor : Color
    let buttonAction  :() -> Void
    var body: some View {
        Button(action: {
            //  Action
            buttonAction()
        }, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10 )
                    .foregroundColor(buttonColor)
                
                Text(title)
                    .foregroundStyle(.white)
                    .bold()
                    
            }
        }).padding(.top)
    }
}

#Preview {
    TDLButton(title: "put a title here", buttonColor: .gray, buttonAction: {
        // the button Action to perform when called 
    })
}
