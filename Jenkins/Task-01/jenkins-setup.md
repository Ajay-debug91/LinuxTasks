# Connect to EC2

<img width="1918" height="827" alt="image" src="https://github.com/user-attachments/assets/c94fe0f4-0ec3-4e1d-bcff-bd6fa3bca274" />

# Install Java (Required for Jenkins)

sudo apt update

sudo apt install openjdk-21-jdk -y

java -version

# Install Jenkins

curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]  https://pkg.jenkins.io/debian binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt update

sudo apt install jenkins -y

# Start Jenkins

sudo systemctl start jenkins

sudo systemctl enable jenkins

## Check status:

sudo systemctl status jenkins

# Access Jenkins UI


# Unlock Jenkins

sudo cat /var/lib/jenkins/secrets/initialAdminPassword

# Install Plugins

Click Install Suggested Plugins

Wait until installation completes


# Create Admin User

Fill:

Username

Password

Email


# Create Jenkins Project (Job)

## Steps:

Dashboard → New Item

Enter name → my-first-job

Select → Freestyle Project

Click OK

## Configure:

Scroll to Build Section

Click Execute Shell

## Add:

echo "Hello from Jenkins"

date


## Save & Run:

Click Build Now

Click build → Console Output


# Create Users in Jenkins

## Steps:

Manage Jenkins → Manage Users

Click Create User

## Fill:

Username

Password

Full Name

Email


# Role-Based Access (Optional Advanced)

Manage Jenkins → Plugin Manager

## Install:

Role-based Authorization Strategy

## Configure:

Manage Jenkins → Configure Global Security

Select Role-Based Strategy

## Assign roles:

Admin

Developer

Viewer



