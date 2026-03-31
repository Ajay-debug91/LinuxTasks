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
   * OS: Ubuntu 22.04
   * Instance Type: `t2.micro`
   * Key Pair: Create/download `.pem`

3. Security Group:

   * Port 22 (SSH)
   * Port 8080 (Jenkins)

---

# 🔐 Step 2: Connect to EC2

```bash
ssh -i "your-key.pem" ubuntu@<EC2-PUBLIC-IP>
```

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

---

# 📧 Step 9: Email Notification Setup

1. Install Plugin:

   * Email Extension Plugin

2. Configure:

   * SMTP: smtp.gmail.com
   * Port: 587
   * Use TLS: Yes

3. Add in Job:

   * Post-build → Editable Email Notification
   * Add your email

---

# 🧪 Step 10: Test

```bash
echo "Build triggered" >> hello.sh
git add .
git commit -m "Test build"
git push
```

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
