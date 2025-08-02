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

- Create/enable administrator account, set password to “password” with no expiration and add it to the “administrators” group
- <img width="390" height="387" alt="admin acc" src="https://github.com/user-attachments/assets/42b0029a-8559-466e-8e79-c3f021bcfd13" />

- Add “guest” account to the “administrators” group, and enable it
- <img width="398" height="454" alt="guest as admin" src="https://github.com/user-attachments/assets/36ca95bb-dce0-467c-9a23-ff26a8b0e330" />


# Tenable Scan 

- After creating the scan, essential fields such as the scan name, scanner, and target IP were configured. The scan was directed at the private IP address of the virtual machine windows-10-test.

- Advanced Network Scan 
<img width="351" height="106" alt="advanced net scan" src="https://github.com/user-attachments/assets/43802bb6-a14a-4d35-8272-dafe36d946f7" />

- For full compliance auditing, authentication credentials were added. Under Host > Windows, credentials for the Windows account were supplied and all relevant settings under Scan-wide Credential Type Settings were enabled.
  
- <img width="601" height="466" alt="scan config" src="https://github.com/user-attachments/assets/c4bbbf21-919d-4260-ade3-cc18e7045bbb" />

- Authentication for the windows virtual machine login was added for an authenticated scan

<img width="532" height="267" alt="credentials for scan" src="https://github.com/user-attachments/assets/5cc5d0ed-0ad5-401d-b669-41eaea1b4ea3" />

- The Compliance section was configured next by selecting the Windows 10 STIG v3r4 audit version.
Compliance Check
- <img width="239" height="119" alt="compliance" src="https://github.com/user-attachments/assets/44f8ce65-a7a5-4b6c-8b99-d2a578aad445" />
<img width="1261" height="131" alt="compliande audit" src="https://github.com/user-attachments/assets/5a33064b-1dfd-462b-b3fe-b1a59d8f4bf9" />


- All plugins were enabled
- <img width="1250" height="445" alt="plugins 4 scan" src="https://github.com/user-attachments/assets/63f9ccb9-e19c-47a4-9f6e-9561f9f55810" />

#Scan Report 



# Investigating and remediating

- Upon scan completion, the Audit tab within the scan details revealed many failed compliance checks. Among the failed were the guest account not disabled, the administrator account not disabled, and the firewall disabled.
- The scan identified that the guest account was undisabled and the administrator account based on the failed audit complicance check

<img width="769" height="25" alt="admin not disable" src="https://github.com/user-attachments/assets/4a83bca2-0a5b-4878-b4a3-cc579507dd09" />
<img width="963" height="26" alt="guest not disabled" src="https://github.com/user-attachments/assets/40420dd8-a336-4a93-b578-86cdf66c3b78" />


 # Automation with Powershell
 Script was executed in Powershell ISE in administrator mode to remediate the vulnerabilies and harden the system. The virtual machine was then rebooted and the scan was done again and showed that the system was succesffuly hardened and the firewall, admin and guest account bulnerabilies were rectfiied.

<img width="893" height="503" alt="fireeall script" src="https://github.com/user-attachments/assets/be47de9d-2d3c-4f4e-aa85-0bed70211133" />

<img width="890" height="504" alt="guest script" src="https://github.com/user-attachments/assets/c7c6a353-e974-4d3a-b7b3-5f35af2298a8" />

<img width="890" height="496" alt="admin script" src="https://github.com/user-attachments/assets/647426d9-b7bd-4505-aada-8db92868936c" />


# Conclusion

This project demonstrates how DISA STIG findings on Windows systems can be remediated both manually and through automation using available tools. Tenable played a key role in identifying compliance gaps, enabling targeted configuration changes via manual adjustments or PowerShell scripting. These efforts help ensure Windows systems are securely configured and remain compliant with DISA STIG standards.
