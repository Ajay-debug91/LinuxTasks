# 🚀 Jenkins CI/CD Task using AWS EC2, GitHub

## 📌 Task Overview

Create a simple script, push it to GitHub, configure Jenkins on AWS EC2, and trigger automatic builds with email notifications on every commit.

---

# 🧱 Tech Stack

* AWS EC2
* Jenkins
* GitHub

---

# ☁️ Step 1: Launch EC2 Instance

1. Go to AWS Console → EC2 → Launch Instance

2. Configuration:

   * Name: `jenkins-server`
   * OS: Ubuntu 24.04 LTS
   * Instance Type: `t3.micro`
   * Key Pair: Create/download `.pem`
<img width="1918" height="875" alt="image" src="https://github.com/user-attachments/assets/4e3e55e3-0dc2-4aa4-b69d-cf085bd549c0" />

3. Security Group:

   * Port 22 (SSH)
   * Port 8080 (Jenkins)
<img width="1918" height="826" alt="image" src="https://github.com/user-attachments/assets/de195238-6b7e-4f68-ad3c-eb25c9fa7372" />

---

# 🔐 Step 2: Connect to EC2

```bash
ssh -i "your-key.pem" ubuntu@<EC2-PUBLIC-IP>
```
<img width="1911" height="877" alt="image" src="https://github.com/user-attachments/assets/fb158f92-a3c1-45c4-9488-b7dde5c743ab" />

---

# ⚙️ Step 3: Install Jenkins

```bash
sudo apt update -y
sudo apt install openjdk-11-jdk -y

curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt update
sudo apt install jenkins -y

sudo systemctl start jenkins
sudo systemctl enable jenkins
```

---

# 🌐 Step 4: Access Jenkins

Open in browser:

```
http://<EC2-PUBLIC-IP>:8080
```

Get admin password:

```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```
<img width="1918" height="878" alt="image" src="https://github.com/user-attachments/assets/af5152b0-7e26-4ea7-bdc2-12eaaa65f07d" />

---

# 📁 Step 5: Create Script & Push to GitHub

```bash
mkdir jenkins-ci-task
cd jenkins-ci-task
```

Create file:

```bash
nano hello.sh
```

Add:

```bash
#!/bin/bash
echo "Hello from Jenkins Build!"
date
```

Make executable:

```bash
chmod +x hello.sh
```

Push to GitHub:

```bash
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin <YOUR_GITHUB_REPO_URL>
git push -u origin main
```

---

# 🔗 Step 6: Create Jenkins Job

1. New Item → Freestyle Project
2. Name: `my-ci-job`

### Source Code Management:

* Git
* Paste GitHub Repo URL

### Build Trigger:

✔ GitHub hook trigger for GITScm polling

---

# 🔨 Step 7: Add Build Step

```bash
chmod +x hello.sh
./hello.sh
```
<img width="1913" height="872" alt="image" src="https://github.com/user-attachments/assets/1caa5f94-48f1-41ec-8478-92cddfaf1609" />

---

# 🔔 Step 8: Configure GitHub Webhook

Go to:
GitHub → Repo → Settings → Webhooks → Add Webhook

* Payload URL:

```
http://<EC2-PUBLIC-IP>:8080/github-webhook/
```

* Content Type:

```
application/json
```

* Event:

```
Just the push event
```
<img width="1918" height="892" alt="image" src="https://github.com/user-attachments/assets/a6af7df5-9464-4776-aa86-702147e92359" />

---

# 📧 Step 9: Email Notification Setup

1. Install Plugin:

   * Email Extension Plugin

2. Configure:

   * SMTP: smtp.gmail.com
   * Port: 465
   * Use TLS: Yes

3. Add in Job:

   * Post-build → Editable Email Notification
   * Add your email

<img width="1917" height="935" alt="image" src="https://github.com/user-attachments/assets/b0e4d9f3-a056-4fe1-8955-f9c75fbbf809" />

<img width="1918" height="972" alt="image" src="https://github.com/user-attachments/assets/0c6c443a-e617-4aab-83e6-b17020d6afbe" />

<img width="1918" height="955" alt="image" src="https://github.com/user-attachments/assets/642b08a3-c271-427d-967c-9dc950e9bd69" />

<img width="1913" height="752" alt="image" src="https://github.com/user-attachments/assets/57e341a9-7c03-414b-ac84-2e6a51eda44f" />

---

# 🧪 Step 10: Test

```bash
echo "Build triggered" >> hello.sh
git add .
git commit -m "Test build"
git push
```
<img width="1918" height="971" alt="image" src="https://github.com/user-attachments/assets/fa4a7a22-1383-49de-b074-0cca49da3f42" />
<img width="1918" height="968" alt="image" src="https://github.com/user-attachments/assets/ff1547ec-be7a-4521-ab69-23194634fa16" />

---

# ✅ Final Output

✔ Code pushed to GitHub
✔ Jenkins auto build triggered
✔ Script executed
✔ Email notification sent

---

# ⚠️ Common Issues

* Jenkins not opening → Check port 8080
* Webhook not working → Check URL
* Email not sending → Use App Password

---

# 🎯 Conclusion

Successfully implemented CI pipeline:
GitHub → Jenkins → Email Notification

---
