import SwiftUI

struct ProfileView: View {
    @State private var fullName: String = "John Doe"
    @State private var jobTitle: String = "Senior Software Engineer at TechCorp"

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                // Profile Image
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.blue)

                // Editable Name
                TextField("Full Name", text: $fullName)
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)

                // Editable Job Title
                TextField("Job Title", text: $jobTitle)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                // Description (still static, but you can make this editable too)
                Text("Specialized in AI Swift Development, and Networking Technologies.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                // LinkedIn Button
                Link(destination: URL(string: "https://www.linkedin.com/in/johndoe")!) {
                    Label("Connect LinkedIn Profile", systemImage: "link")
                        .font(.subheadline)
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                }

                // Resume, Projects, GitHub sections
                VStack(spacing: 12) {
                    NavigationLink(destination: Text("Upload or View Resume")) {
                        HStack {
                            Text("Resume")
                                .font(.system(size: 18, weight: .medium))
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
                    }

                    NavigationLink(destination: Text("Add or View Projects")) {
                        HStack {
                            Text("Projects")
                                .font(.system(size: 18, weight: .medium))
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
                    }

                    NavigationLink(destination: Text("Add GitHub Repository")) {
                        HStack {
                            Text("GitHub")
                                .font(.system(size: 18, weight: .medium))
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
                    }
                }
                .padding(.horizontal)
            }
            .padding()
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


