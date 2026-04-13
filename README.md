# 🚀 CI/CD Automation for Dockerized Application

## 📌 Project Overview
This project demonstrates a **CI/CD pipeline using GitHub Actions** to automate the process of building and pushing Docker images.

Whenever code is pushed to GitHub, the pipeline automatically:
- Builds a Docker image
- Pushes it to Docker Hub
- Makes it ready for deployment

---

## 🛠️ Tools & Technologies Used
- Git & GitHub  
- GitHub Actions  
- Docker  
- Docker Hub  
- HTML & CSS  

---

## ⚙️ CI/CD Workflow

### 🔹 Step 1: Code Push
Code is pushed to the GitHub repository.

### 🔹 Step 2: Trigger Pipeline
GitHub Actions workflow is triggered automatically.

### 🔹 Step 3: Build Docker Image
Docker image is built using the Dockerfile.

### 🔹 Step 4: Push to Docker Hub
The image is pushed to Docker Hub repository.

---

## 📂 Project Structure

    project-root/
    │
    ├── index.html
    ├── styles.css
    ├── Dockerfile
    ├── README.md
    └── .github/
        └── workflows/
            └── docker-ci.yml

---

## 🔐 GitHub Secrets Used
The following secrets are configured:

- DOCKER_USERNAME  
- DOCKER_PASSWORD  

These are used to securely log in to Docker Hub.

---

## ▶️ How to Run the Project

### 1. Pull Docker Image
    docker pull sidh25/portfolio-website:latest

### 2. Run Container
    docker run -d -p 8080:80 sidh25/portfolio-website

### 3. Open in Browser
    http://localhost:8080

---

## 📸 Screenshots
- GitHub Actions workflow success  
- Docker Hub image  
- Running container  
- Website output  

---

## 🎯 Key Learning Outcomes
- Understanding CI/CD pipeline  
- Automating Docker build and push  
- Using GitHub Actions  
- Managing secrets securely  

---

## 🧠 Conclusion
This project successfully demonstrates how to automate Docker image creation and deployment using GitHub Actions.

---

## 👨‍💻 Author
**Siddhesh Pallor**
