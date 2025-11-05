import SwiftUI

struct DetailsView: View {
    var image: UIImage?
    var name: String
    var branch: String
    var usn: String
    
    var body: some View {
        VStack(spacing: 20) {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .cornerRadius(12)
                    .shadow(radius: 5)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("📛 Name: \(name.isEmpty ? "—" : name)")
                Text("🏫 Branch: \(branch.isEmpty ? "—" : branch)")
                Text("🧾 USN: \(usn.isEmpty ? "—" : usn)")
            }
            .font(.title3)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(12)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Extracted Info")
    }
}

#Preview {
    DetailsView(image: nil, name: "RISHABH JAIN H", branch: "CS & ENGG.", usn: "4PS23CS135")
}
