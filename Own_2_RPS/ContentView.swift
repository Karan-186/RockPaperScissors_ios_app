//
//  ContentView.swift
//  Own_2_RPS
//
//  Created by KARAN  on 01/06/22.
//

import SwiftUI

struct ContentView: View {
    let game = "game"
    @State private var pcChoice = Bool.random()
    @State private var playerScore = 0
    @State private var pcSelection = ""
    @State private var showingScore = false
    @State private var win = ""
    @State private var numberOfRoundsPlayed = 0
    @State private var maxReached = false
    @State private var title = "Game Finished"
    
    
    var body: some View {
        ZStack{
            Color.blue
                .ignoresSafeArea()
            VStack(spacing: 0){
                Text("Rochambeau")
                    .font(.largeTitle.bold())
                Image(game)
                    .renderingMode(.original)
                VStack(spacing : 5){
                    Spacer()
                    
                    Text("No Draws Here")
                        .font(.title.bold())
                    Text("Current Score is \(playerScore)")
                        .font(.title2.bold())
                    
                    Button{
                        pcPlaying1()
                        if numberOfRoundsPlayed==3{
                            maxReached=true
                        }
                        
                    }label: {
                        Image("rock")
                            .renderingMode(.original)
                    }
                    Button{
                        pcPlaying2()
                        if numberOfRoundsPlayed==3{
                            maxReached=true
                        }
                        
                    }label:{
                        Image("paper")
                            .renderingMode(.original)
                    }
                    Button{
                        pcPlaying3()
                        if numberOfRoundsPlayed==3{
                            maxReached=true
                        }
                        
                    }label:{
                        Image("scissor")
                            .renderingMode(.original)
                        
                    }
                }
                
                
            }
        }
        .alert(pcSelection,isPresented: $showingScore){
            Button("continue",action: reset)
        }message: {
            Text("\(win) \n your score is \(playerScore)" )
        }
        .alert(title,isPresented: $maxReached){
            Button("Restart" , action: Reset)
        }message: {
            Text("Total score in 3 round's is \(playerScore)")
        }
        
        
    }
    
    func pcPlaying1(){
        numberOfRoundsPlayed+=1
        if pcChoice{
            pcSelection = "paper"
            win="You lost"
            playerScore-=1
        }else{
            pcSelection = "scissor"
            win="You won"
            playerScore+=1
        }
        showingScore=true
        
    }
    
    func pcPlaying2(){
        numberOfRoundsPlayed+=1
        if pcChoice{
            pcSelection = "scissor"
            win="You lost"
            playerScore-=1
        }else{
            pcSelection = "rock"
            win="You won"
            playerScore+=1
        }
        showingScore=true
        
    }
    
    func pcPlaying3(){
        numberOfRoundsPlayed+=1
        if pcChoice{
            pcSelection = "rock"
            win="You lost"
            playerScore-=1
        }else{
            pcSelection = "paper"
            win="You won"
            playerScore+=1
        }
        showingScore=true
        
    }
    
    func reset(){
        //pass
    }
    
    func Reset(){
        pcChoice=Bool.random()
        playerScore = 0
        numberOfRoundsPlayed=0
        maxReached = false
        showingScore = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
