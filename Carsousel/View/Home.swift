//
//  Home.swift
//  Carsousel
//
//  Created by Sopnil Sohan on 3/10/21.
//

import Foundation
import SwiftUI

struct Home: View {
    
    @State var x: CGFloat = 0
    @State var count: CGFloat = 0
    @State var screen = UIScreen.main.bounds.width - 30
    
    @State var data = [
        
        Card(id: 0, img: "p1", name: "Taj Mahal", show: false),
        Card(id: 1, img: "p2", name: "The Colosseum", show: false),
        Card(id: 2, img: "p3", name: "The Chichen Itez", show: false),
        Card(id: 3, img: "p4", name: "MAchu Picchu", show: false),
        Card(id: 4, img: "p5", name: "Petra", show: false),
        Card(id: 5, img: "p6", name: "Great Wall of chaina", show: false),
        
    ]
    
    var body: some View {
        
        NavigationView{
            
            VStack {
                Spacer()
                
                HStack(spacing: 15) {
                    ForEach(data) {item in
                        CardView(data: item)
                            .offset(x: self.x)
                            .highPriorityGesture(DragGesture()
                                                    .onChanged({ (value) in
                                if value.translation.width > 0 {
                                    
                                    self.x = value.location.x
                                }
                                else{
                                    
                                    self.x = value.location.x - self.screen
                                    
                                }
                            })
                                                    .onEnded({ (value) in
                                if value.translation.width > 0 {
                                    if value.translation.width > ((self.screen - 80) / 2) && Int(self.count) != self.getMid(){
                                        
                                        self.count += 1
                                        self.updateHeight(value: Int(self.count))
                                        self.x = (self.screen + 15) * self.count
                                        
                                    }
                                    else{
                                        self.x = (self.screen + 15) * self.count
                                    }
                                }
                                else{
                                    if -value.translation.width > ((self.screen - 80) / 2) && -Int(self.count) != self.getMid(){
                                        
                                        self.count -= 1
                                        self.updateHeight(value: Int(self.count))
                                        self.x = (self.screen + 15) * self.count
                                        
                                    }
                                    else{
                                        self.x = (self.screen + 15) * self.count
                                    }
                                }
                                
                            })
                        )
                    }
                }
                
                Spacer()
            }
            .background(Color.black.opacity(0.07).edgesIgnoringSafeArea(.all))
            .navigationBarTitle(" World Seven Wonders")
            .animation(.spring())
            .onAppear {
                self.data[self.getMid()].show = true
            }
        }
    }
    func getMid()->Int{
        return data.count / 2
    }
    func updateHeight(value: Int) {
        var id: Int
        
        if value < 0 {
            id = -value + getMid()
        }
        else{
            id = getMid() - value
        }
        for item in 0..<data.count {
            data[item].show = false
        }
        data[id].show = true
    }
}
