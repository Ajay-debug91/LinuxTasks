1️⃣ Get IP address, check CPU/memory, test connectivity

A. Get the IP address of a domain (guvi.in)

You can use any of these 👇

Option 1: nslookup

nslookup guvi.in

<img width="506" height="311" alt="image" src="https://github.com/user-attachments/assets/73ae4413-fb3c-4c2d-b5e0-bf06d1caae9d" />

➡ Shows the DNS resolution and IP address.

Option 2: dig (preferred in DevOps)

<img width="886" height="94" alt="image" src="https://github.com/user-attachments/assets/06d9688f-0048-4b79-8436-0909fe1e0fea" />

➡ Clean output, only IPs.

Option 3: ping

ping guvi.in

➡ First line usually shows the resolved IP.

<img width="994" height="345" alt="image" src="https://github.com/user-attachments/assets/5b28872c-38bb-4af5-882c-cf957fb1812c" />

B. Check CPU usage of the server

Quick view

top


<img width="990" height="374" alt="image" src="https://github.com/user-attachments/assets/feb0b0e4-9701-49f8-9ad0-f3eb0d5292b0" />

htop

<img width="993" height="538" alt="image" src="https://github.com/user-attachments/assets/88de8b7e-41d7-49e3-bef3-94189744f63b" />


Look for:

%Cpu(s) → CPU usage

High load or processes consuming CPU


<img width="990" height="106" alt="image" src="https://github.com/user-attachments/assets/1d56ddcc-7541-4d1d-a8fa-3e9c42ffa79b" />


C. Check Memory usage

free -h


<img width="844" height="78" alt="image" src="https://github.com/user-attachments/assets/bcdae883-bfcd-41bb-8735-69fab2d89eec" />


<img width="808" height="229" alt="image" src="https://github.com/user-attachments/assets/a067c14d-cc3e-4e24-b613-77c64c735393" />




