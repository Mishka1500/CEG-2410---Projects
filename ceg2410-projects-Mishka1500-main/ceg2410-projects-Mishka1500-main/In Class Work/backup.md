# My Backups Information

***

### **My Data & Backups**

1. Personal
   * My backup strategies for my personal files are rather sporadic in that I tend to forget to back my data up. I have backups of some of my files but the backup is from like six months ago as I have not set up any backup schedule. 
2. Work
   * Currently there is no backup strategy for work as I have no need to back up any work files as I don't have a job currently that deals with files or any sort of data. 
3. School 
   * Same backup strategy as my personal files as I combine both my school work and personal files into the same backup. Due to this, I have also not updated my school files in six months as that was the last time I updated my personal files. 

**Even though I have not updated my personal or school files in a while, I have a storage server at home which I use to store all my data. This storage server is in raid 6 which allows me to have more drive failures without destroying my data. When I do backup my data to this server, I normally would just copy the data I want to be backed up to it instead of setting a backup schedule. This is because Windows had a tendency to back up everything even if I told it to just back up specific files. This caused Windows to try and back up 2TB worth of games that don't need a backup.**

_Weak Areas of My Backups_
* As I mentioned above, the weakness of my backups is related to the frequency of backups. Since I often forget to back up my data or figure out a better method to set backup schedules, I have a high chance of losing any new files that were not backed up in whatever my last backup was. 

_How Easy is it to Lose Data and How Long Will it Take to Recover?_
* If I am taking into consideration how I normally backup data to my storage server, it is relatively hard to lose data as the server storage is set up in raid 6 which gives me two drive failures. While it is relatively hard to lose data, there is still a possibility that because my server is in the same house, I could lose everything to a fire or other freak accident. Even though it is hard for me to lose data that I have backed up, the raid 6 configuration takes forever to recover data. I know this because my storage server had one drive failure about a year ago and after replacing the drive, it took the server I want to say a full day to rebuild the data back onto the drive. 

***

### Better Backups for My Data

_To implement a better backup strategy, I would choose both external storage in the form of my storage server and also cloud storage such as One Drive or Google Drive_

1. External Storage
   * For external storage, I will utilize my storage server that is set up in a raid 6 configuration. To make this better than how I have backed up data to this server, I will implement a backup schedule with a different software other than the built-in backup scheduler in Windows. 
2. Cloud Storage One Drive / Google Drive
   * Implementing a backup strategy with a cloud storage system like One Drive or Google Drive ensures that my data is off-site in case something happens to my house. Using cloud storage as a backup also reduces the cost and maintenance of the servers. This is because you don't have to make sure that the servers aren't experiencing any hardware or software issues like I have had to fix on my storage server. 

_Backup Frequency and Loss from a System_
* When I used to be on top of my backups, I used to back up my data every month. This was fine for me as it gave me enough time to add new files so that the backup would actually be worth completing as there would be more stuff to add. Even though a backup every month was fine, I would probably change it to backup every week because of the amount of schoolwork that I create every week. Recovering from a loss on a local system would be easy with these two backup options. My storage server is set up to host Windows SMB shares so I can just map the share as a drive and transfer everything back to the local system. The same thing is the case for cloud storage as your cloud storage backups can be accessed from the internet through the cloud provider's system. The only downside to cloud storage is it relies on good download speed to transfer your files back to your local system. 


***

**Just because I feel like sharing it, the picture below is the DIY rack that I built to hold them all. I have way more than I actually need and currently only use two of the servers shown. The storage server that I have talked about is the second HP server if you look near the network switches**

![Storage Server Rack](https://user-images.githubusercontent.com/122462972/225372805-f1cca283-1b42-4561-a226-a3871db39a95.jpg)
