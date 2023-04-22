# Project 03 - AD

***

### **Setup AD DC**
1.  **Configuring a Windows Server to be a Domain Controller: [How To](https://petri.com/how-to-install-active-directory-in-windows-server-2019-server-manager/)**
    * _Configure a static IP address on your Windows Server 2019_
        * _This static IP address will be an IPv4 address_
    * _Name your Windows Server 2019 machine_.
        * _Navigate to Server Manager and click on Local Server_
        * _In here click on your server's name and click on "Change" in the pop-up window_
        * _This name will be the name of your Domain Controller_
    * _Install Active Directory Domain Services role_
        * _Open `PowerShell` and copy the command `Install-WindowsFeature -name AD-Domain-Services -IncludeManagementTools` to install AD DS_
    * _Configure Active Directory_
        * _Navigate to "Server Manager" and there should be a flag that says `Promote this server to a domain controller`. Click on this link._
        * _From here, follow the installation wizard and also reference the website that I used for this._
        * _Once you have gotten to the end of the installation wizard, click install, and you're done!_
2. **Domain Name**
    * CEG2410
3. **Domain Controller Name**
    * CEG2410-DC01
4. **Domain DNS IP**
    * 10.0.0.125

***

## **AD Structure**
### **Create OUs**
* _This was completed with a `PowerShell script` and a `.csv` file_

![image](https://user-images.githubusercontent.com/122462972/231702862-03165dc9-4621-403e-848e-a6624254c6f4.png)

***

### **Joining Users**
* _This was created using the `users.csv` file in this project and the `users-bulkcreate.ps1` script_
    * _This image shows just the `Engineers` OU but the other OUs are similar in that they have their appropriate users._

![image](https://user-images.githubusercontent.com/122462972/231719052-7670c3ce-132e-4a2a-86fb-397e6867bac7.png)

***

### **Joining Computers: [How To](https://adamtheautomator.com/add-computer-to-domain/)**
* _Modified the IPv4 information of my joiner system by setting the static IP and changing the DNS to my DC system_
    * _Navigated to `Server Manager`, `Local Server`, and clicked on `Computer Name` link to get to the system properties
    * _In `System Properties` click `Change` and in `Domain:` field, enter the domain of our DC_
    * _Logged on to the domain through the joiner system with the Administrator account just to show that it works_

![image](https://user-images.githubusercontent.com/122462972/231730302-a303fceb-b02b-41df-b641-aae2a2e85fec.png)

***

### **Creating Groups**
* `project_repos_RW`
    * Located in CEG2410 Servers OU
* `finance_RW`
    * Located in CEG2410 Servers OU
* `onboarding_R`
    * Located in CEG2410 Computers\Secure OU
* `server_access`
    * Located in CEG2410 Servers OU
* `dev_eng_admins`
    * Located in CEG2410 Users OU
* `hr_finance_admins`
    * Located in CEG2410 Users OU
* `remote_workstation`
    * Located in CEG2410 Computers\Workstations OU

***

## **OUs & GPOs**
### **Applying Group Policies**

* _Lock out Workstations after 15 minutes of inactivity._
    * _[Guide](https://activedirectorypro.com/group-policy-lock-screen/): Should be applied to CEG2410 Computers OU._
* _Prevent execution of programs on computers in Secure OU._
    * _[Guide](https://www.thewindowsclub.com/how-to-block-exe-files-from-running-using-group-policy-in-windows-11-10): Should be applied to the Secure OU_
* _Disable Guest account login to computers in Secure OU._
    * _[Guide](https://techexpert.tips/windows/gpo-disable-guest-account/): Should be applied to Secure OU_
* _Allow server_access to sign on to Servers._
    * _[Guide](https://woshub.com/restrict-workstation-logon-ad-users/): Should be applied to CEG2410 OU with it applying to the group `server_access`._
* _Set Desktop background for Conference computers to the company logo._
    * _[Guide](https://www.techcrafters.com/portal/en/kb/articles/using-group-policy-to-change-desktop-background-wallpaper#How_to_Deploy_the_Desktop_Background_Wallpaper_using_Group_Policy): Should be applied to CEG2410 Computers\Conference OU._
* _Allow users in remote_workstation group to RDP to Workstations_
    * _[Guide](https://www.prajwaldesai.com/enable-remote-desktop-using-group-policy-gpo/): Should be applied to CEG2410 Computers\Workstations OU with it applying to the `remote_workstations` group._

* _The two screenshots below show that the 15-minute Lock Out GPO works as intended._

![image](https://user-images.githubusercontent.com/122462972/231761883-804fa626-72e2-475e-8c9e-f63220fd941e.png)

![image](https://user-images.githubusercontent.com/122462972/231761656-c0a2c6f6-5dbc-468d-a4b4-2c5942241f02.png)

***

### **Managing OUs**
* _Just for this assignment and testing, I added `Max Lopez` to `hr_finance_admins` and `James Usman` to `dev_eng_admins`._

* _To delegate control of an OU to a group, navigate to `AD Users and Computers`._
    * _Right-click on the OU you want and select `Delegate Control`._
    * _In the `Delegation Control Wizard` select `Add` and list the name of the group you want._
    * _Select the tasks or permissions that you want to delegate to the `hr_finance_admins`_
    * _Repeat this process for the `dev_eng_admins` group for there corresponding OUs._

* _The `hr_finance_admins` delegate the `Finance OU` and the `HR OU`_
* _The `dev_eng_admins` delegate the `Developers OU` and the `Engineers OU`_

* **_I personally think that the permission set that I gave, the picture below, handles all the basic and more in-depth tasks that an IT admin might encounter when managing a group of users for a specific department. The list of permissions that I gave both admin groups take care of all the important tasks that might arise without being too permission-heavy where something crucial might be messed up._**
 
* _Screen-shot below is the permissions I set for the Finance OU but contains the same permissions that I set for the dev_eng_admins and their corresponding user groups_

![image](https://user-images.githubusercontent.com/122462972/231757967-deb35b27-e9a6-441d-a1d5-965bebcbdfcc.png)
