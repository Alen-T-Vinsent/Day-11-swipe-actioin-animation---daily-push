//
//  Home.swift
//  Day-11-SwipeAnimation
//
//  Created by Apple  on 24/12/22.
//

import SwiftUI

struct Home: View {
    //colors as tabs
    //use your own tabs here
    var colors:[Color] = [.red,.blue,.pink,.purple]
    
    @State var offset:CGFloat = 0
    var body: some View {
        ScrollView(.init()){
            TabView {
                ForEach(colors.indices,id:\.self){index in
                    
                    if index == 0{
                        colors[index]
                            .overlay(
                            //geometry Reader for getting offset....
                                GeometryReader{proxy -> Color in
                                    
                                    let minX = proxy.frame(in: .global).minX
                                    DispatchQueue.main.async {
                                        withAnimation {
                                            self.offset = -minX
                                        }
                                        
                                    }
                                    return Color.clear
                                    
                                }
                                    .frame(width:0,height: 0),alignment: .leading
                            )
                    }
                    
                    colors[index]
                    
                }
                
                
                
                
     
                
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .overlay(
                //Animation Indicators....
                HStack(spacing:15){
                    
                    ForEach(colors.indices,id:\.self){index in
                        
                       
                        
                        Capsule()
                            .fill(Color.white)
                            .frame(width: 7,height: 7)
                        
                    }
                  
                }
                    
            )
        }
        .ignoresSafeArea()
    }
        
        
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
