//
//  CardView.swift
//  Carsousel
//
//  Created by Sopnil Sohan on 3/10/21.
//

import Foundation
import SwiftUI

struct CardView: View {
    
    var data: Card
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            Image(data.img)
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width - 30, height: data.show ? 460 : 460)
                //.frame(width: 300, height: 300)
            
            Text(data.name)
                .fontWeight(.bold)
                .padding(.vertical, 10)
                .padding(.leading)
        }
        .background(Color.white)
        .cornerRadius(25)
    }
}
