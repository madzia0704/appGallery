//
//  PhotoDetailsView.swift
//  AppGallery
//
//  Created by Magdalena Popińska on 19/12/2021.
//

import SwiftUI
import MessageUI

struct PhotoDetailsView: View {
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false
    @State private var isShowingMessages = false
    @State var photoAvailable = false
    
    let photo: PhotoListItem
    var body: some View {
        VStack(spacing: 10) {
            Text("Author: \(photo.author)")
                ZStack {
                UrlImageView(urlString: photo.imageUrl)
                if !photoAvailable {
                    CustomActivityIndicatorView()
                }
            }
            Button(action: {
                self.isShowingMailView.toggle()
            }) {
                #if DEBUG
                    Text("Send email")
                #endif
            }
            .disabled(!MFMailComposeViewController.canSendMail() || !photoAvailable)
            .sheet(isPresented: $isShowingMailView) {
                MailView(result: self.$result, photo: photo)
            }
            Button("Send MMS") {
              self.isShowingMessages = true
            }.disabled(!photoAvailable)
            .sheet(isPresented: self.$isShowingMessages) {
              MessageView( recipients: [], body: "\(photo.author)'s awesome picture", photo: photo) { messageSent in
                  #if DEBUG
                    print("MessageView with message sent? \(messageSent)")
                  #endif
              }
            }
        }
        .onAppear {
            photoAvailable = photo.getImage() != nil
            if !photoAvailable {
                photo.downloadImage(url: photo.imageUrl) { int in
                    self.photoAvailable = true
                }
            }
        }
    }
}
