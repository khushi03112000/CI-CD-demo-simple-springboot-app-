# Project: End-to-End CI/CD Pipeline for Spring Boot Application using Jenkins and Docker on AWS EC2

## Overview
Built a complete CI/CD pipeline from scratch on an AWS EC2 Ubuntu instance, automating the build, dockerization, and deployment of a Spring Boot application hosted on GitHub, using Jenkins and Docker.

---

## Project Architecture
- **Source Code:** GitHub 
- **Build Tool:** Maven (inside Docker container)
- **CI/CD Tool:** Jenkins (installed on Ubuntu EC2)
- **Containerization:** Docker
- **Image Registry:** DockerHub
- **Cloud Provider:** AWS (EC2 - Ubuntu 22.04 LTS)
- **Application Type:** Spring Boot (Simple Web Application)



---

## Implementation Details

### 1. **AWS EC2 Instance Setup (Ubuntu Server)**
- Launched an EC2 instance with Ubuntu 22.04 LTS.
- Installed Jenkins, Docker, Git, and Maven.
- Configured Security Group rules to open ports **22 (SSH)**, **8080 (Jenkins UI)**.
<img width="1470" alt="Screenshot 2025-04-28 at 6 03 27 PM" src="https://github.com/user-attachments/assets/f02cc9ef-45a0-4b44-b96c-6e27d3c0c1fb" />

<img width="1470" alt="Screenshot 2025-04-28 at 6 05 10 PM" src="https://github.com/user-attachments/assets/4ce1b59c-bf48-48cc-a68a-afa5723cc182" />

---

### 2. **Jenkins Installation and Configuration**
- Installed Jenkins manually using official package repository.
- Started Jenkins service and configured the initial setup (admin user creation, installing suggested plugins).
- Integrated Docker with Jenkins (added `jenkins` user to `docker` group for permissionless Docker access).

<img width="1470" alt="Screenshot 2025-04-28 at 6 06 35 PM" src="https://github.com/user-attachments/assets/65121485-f90c-473a-b498-2ebaa749f97d" />

---

### 3. **Source Code Management (SCM)**
- Connected Jenkins to GitHub repository:  
  `https://github.com/khushi03112000/CI-CD-demo-simple-springboot-app-`
- Configured a Multibranch Pipeline (or Freestyle job with Pipeline script) to pull code from the `main` branch.

<img width="1470" alt="Screenshot 2025-04-28 at 6 07 49 PM" src="https://github.com/user-attachments/assets/bb127f69-460d-4def-92b6-2c05ea5df8bb" />

---

### 4. **Pipeline-as-Code (Jenkinsfile)**
- Created a `Jenkinsfile` to define the complete pipeline stages:
  - **Clone Repo**
  - **Build with Maven** inside a Docker container (`maven:3.8.1-jdk-8`)
  - **Build Docker Image** of the Spring Boot app
  - **Login to DockerHub** securely using Jenkins credentials
  - **Push Docker Image** to DockerHub
  - **Run Docker Container** to deploy the app locally on EC2


---

### 5. **DockerHub Integration**
- Created **DockerHub credentials** in Jenkins (`dockerhub-credentials-id`) to allow secure login without hardcoding passwords.
- Built and pushed Docker images tagged as:  
  `khushi0311/simple-springboot-app`

<img width="1470" alt="Screenshot 2025-04-28 at 6 09 23 PM" src="https://github.com/user-attachments/assets/a29b52c9-8841-4a73-855d-76865990f62d" />


---

### 6. **Pipeline Execution and Deployment**
- Triggered the Jenkins pipeline manually (or configured Webhooks for GitHub push trigger).
- Verified:
  - Successful Maven build logs
  - Docker image build and push
  - Running container of Spring Boot app on EC2 at port 8080

📸 **Screenshot:**  
- Jenkins Build Console Output (green success)  
- Docker images list (`docker images`)  
- Running container list (`docker ps`)  
- Browser accessing EC2 Public IP:8080 (Spring Boot welcome page)

---

## Key Achievements
- Automated entire build, package, image creation, push, and deploy flow using Jenkins Pipeline.
- Implemented secure credential management using Jenkins’ built-in secrets store.
- Reduced manual deployment efforts and improved release reliability.
- Hands-on experience with real-world CI/CD practices using cloud infrastructure.

---

## Technologies and Tools
| Technology | Purpose |
|:-----------|:--------|
| Jenkins     | CI/CD Automation |
| Docker      | Containerization |
| DockerHub   | Image Hosting |
| Maven       | Java Build Tool |
| Git/GitHub  | Source Code Management |
| AWS EC2     | Cloud Infrastructure |
| Ubuntu      | OS for Jenkins/Docker Host |
| Linux Shell | System Setup and Automation |

---

