# DISA-STIG-Remediation-Template

This project showcases how Security Technical Implementation Guide (STIG) findings—identified through Tenable vulnerability scans—can be addressed both manually and through automation on a Windows virtual machine. It demonstrates practical skills in vulnerability scanning with Tenable, interpreting STIG requirements, performing manual remediations, and implementing scripted solutions. These tasks are essential for system hardening and reducing the attack surface in Windows environments.

For this demonstration, in Azure, a Windows 10 virtual machine made named windows-10-test was intentionally configured in a vulnerable state by disabling the Windows Firewall and enabling the guest account and adding it as an administrator account. Once the environment was set up, the system was scanned using Tenable Vulnerability Management.

## 🛠️ Technology & Tools Utilized

- **`Azure:`**  
  Served as the cloud computing platform for the host Windows 10 virtual machine used for this scan in a controlled lab environment.

- **`Tenable:`**  
  The scan platform used to run scans on the Windows 10 virtual machine to identify vulnerabilites and weaknesses that are able to be exploited

- **`Powershell:`**  
  Used as the primary command-line shell within the Windows 10 VM to execute scripts and automate tasks.


Steps taken to weaken the VM prior to scan

- Logged into VM and disabled firewall
- <img width="568" height="306" alt="firewall down" src="https://github.com/user-attachments/assets/4d9d1839-328a-49a2-8ba5-0df195e429ef" />

- create/enable administrator account, set password to “password” with no expiration and add it to the “administrators” group
- <img width="390" height="387" alt="admin acc" src="https://github.com/user-attachments/assets/42b0029a-8559-466e-8e79-c3f021bcfd13" />

- Add “guest” account to the “administrators” group, and enable it
- <img width="398" height="454" alt="guest as admin" src="https://github.com/user-attachments/assets/36ca95bb-dce0-467c-9a23-ff26a8b0e330" />


# Tenable Scan 
- Advanced Network Scan 
<img width="351" height="106" alt="advanced net scan" src="https://github.com/user-attachments/assets/43802bb6-a14a-4d35-8272-dafe36d946f7" />

- Configuring the scan
- <img width="601" height="466" alt="scan config" src="https://github.com/user-attachments/assets/c4bbbf21-919d-4260-ade3-cc18e7045bbb" />

-Authenticated added for authenticated scan
<img width="532" height="267" alt="credentials for scan" src="https://github.com/user-attachments/assets/5cc5d0ed-0ad5-401d-b669-41eaea1b4ea3" />

Compliance Check
- <img width="239" height="119" alt="compliance" src="https://github.com/user-attachments/assets/44f8ce65-a7a5-4b6c-8b99-d2a578aad445" />
<img width="1261" height="131" alt="compliande audit" src="https://github.com/user-attachments/assets/5a33064b-1dfd-462b-b3fe-b1a59d8f4bf9" />


- All plugins were enabled
- <img width="1250" height="445" alt="plugins 4 scan" src="https://github.com/user-attachments/assets/63f9ccb9-e19c-47a4-9f6e-9561f9f55810" />

#Scan Report 

# Investigating and remediating
- Once scan was completed the Microsoft 3D Viewer was the highest vulnerability.
- The scan identified that the guest account was undisabled and the administrator account based on the failed audit complicance check
-  <img width="1176" height="222" alt="wintrust" src="https://github.com/user-attachments/assets/364e6c42-ac3b-4f07-b026-bf0222b271d4" />
<img width="769" height="25" alt="admin not disable" src="https://github.com/user-attachments/assets/4a83bca2-0a5b-4878-b4a3-cc579507dd09" />
<img width="963" height="26" alt="guest not disabled" src="https://github.com/user-attachments/assets/40420dd8-a336-4a93-b578-86cdf66c3b78" />


