The majority of the files in this repository were used to configure the network depicted below.

!/Desktop/GitHub/Cybersecurity/Diagrams/ELKStackDiagram
!https://github.com/kldawson53/Cybersecurity/blob/master/Diagrams/ELKStack%20Diagram.png

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the playbook file may be used to install only certain pieces of it, such as Filebeat.

  - _filebeat-playbook.yml (relevant ansible playbook to install and enable filebeat and metricbeat)
  - _install-elk.yml (relevant ansible playbook to install and enable elk container) 
The associated configuration files are: 
  - _ansible_config.yml
  - _filebeat-config.yml
  - _metricbeat-config.yml
This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build
### Description of the Topology
The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.
Load balancing ensures that the application will be highly redundant, in addition to restricting traffic to the network.
- The load balancer receives any traffic that comes into the website and distributes it across multiple servers.  This helps distribute traffic evenly among the servers and mitigates DDoS attacks._ 
- A jump box provides an enterprise's admins with a secure computer to connect to before launching any administrative task.  Additionally, it can be used, as it is here, as an origination point to connect to other servers or untrusted environments.  The Jump-Box provides a highly secured environment that is used solely for administrative tasks.  
[For further discussion of the benefits of 'Jump boxes' and SAWs, see Grimes, R. 'Jump boxes' and SAWs improve security, if you set them up right. (July 26, 2017).  Available at https://www.csoonline.com/article/2612700/security-jump-boxes-improve-security-if-you-set-them-up-right.html.
Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the server and system application.
- Filebeat monitors specified log files and collects log events._
- Metricbeat periodically collects metrics from an operating stystem and from services running on a server.  It takes the metrics and statistics it collects and ships them to specified output, such as Elasticsearch or Logstash.  [See elasticsearch.co/guide]_
The configuration details of each machine may be found below.
| Name      | Function  | IP Address | Operating System |
|-----------|-----------|------------|------------------|
| Jump Box  | Gateway   | 10.0.0.4   | Linux            |
| Web-1     | Webserver | 10.0.0.7   | "                |
| Web-2     | Webserver | 10.0.0.6   | "                |
| Web-3     | Webserver | 10.0.0.4   | "                |
| ElkServer | Elk w/    | 10.1.0.4   | "                |
| Docker    |           |            |                  |
### Access Policies
The machines on the internal network are not exposed to the public Internet. 
Only the Jump-box-provisioner machine can accept connections from the Internet. Access to this machine is only allowed from the following IP address(es):
- 72.66.46.247
Machines within the network can only be accessed by SSH.
- The Elk VM can be accessed from the Ansible container on the Jump-box-provisioner (52.249.188.139; 10.0.0.4)._
A summary of the access policies in place can be found in the table below.
| Name       	| Publicly Accessible 	| Allowed IP Addresses 	|
|------------	|---------------------	|----------------------	|
| Jump Box   	| Yes                 	| 138.91.227.144         	|
| Web-1      	| No                  	| 10.0.0.7 10.0.0.5    	|
| Web-2      	| No                  	| 10.0.0.6 10.0.0.5    	|
| Web-3      	| No                  	| 10.0.0.4 10.0.0.5    	|
| Elk Server 	| No                  	| 10.0.0.5             	|
### Elk Configuration
Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- This approach employs Infrastructure as code (IaC), which allows each component to be individually defined with code.  So, from a security standpoint, we can quickly bring a particular piece of infrastructure up and running within a few minutes by running the code that defines the piece of infrastructure.  Conversely, if the infrastructure is compromised, we can destroy it and deploy a new version within minutes.  As such, we can clearly build in security protocols from the ground up.
The playbook implements the following tasks:
- Specify targets using the hosts option to specify that the playbook tasks should only be run on the machines in the elk group.
- Run sysctl -w vm.max_map_count=262144 to configure the target VM to use more memory.
- Run shell: echo "vm.max_map_count=262144" >> /etc/sysctl.conf so that the target VM is automatically configured if the VM has been restarted.
- Install the Docker engine to run containers, and the pip package used to install Python software using the apt command.
- Downloads the Docker container called sebp/elk:761.
- Configures the container to start with the following port mappings: 5601:5601, 9200:9200, 5044:5044
The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.
!https://github.com/kldawson53/Cybersecurity/blob/master/Ansible/Images/Docker_ps_output.png.PNG
### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web-1, 10.0.0.7
- Web-2, 10.0.0.6
- Web-3, 10.0.0.4
We have installed the following Beats on these machines:
- Filebeat and Metricbeat
These Beats allow us to collect the following information from each machine:
- Filebeat collects data about the filesystem, including those generated by Apache, Microsoft Azure tools, the Nginx web server, and MySQL databases.  Metricbeat collects data showing machine metrics.  We would expect to see statistics like uptime.  
### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 
SSH into the control node and follow the steps below:
- Copy the filebeat-playbook.yml file to /etc/ansible/roles. Within the playbook, a command will copy the playbook to your ElkServer.
- Modify the filebeat-config.yml and metricbeat-config.yml files to include the following information that will specify on which machine to install Filebeat and Metricbeat: 
	-In filebeat-config.yml, update Elasticsearch output "hosts" to reflect ["10.1.0.4:9200"], and input a new password for password: "changeme", if applicable.  Elasticsearch output begins at line 1095/2064 of the config file.  Additionally, at line 1803/2064, setup.kibana should reflect host "10.1.0.4:5601".     
	-Similarly, in metricbeat-config.yml, at line 61/164, update setup.kibana to reflect host: "10.1.0.4:5601".  And at 93/164, udpate output.elasticsearch to reflect host: ["10.1.0.4:9200"].  If applicable, update the password.
- Run the playbook, and navigate to http://<localhostip>:5601/app/kibana to check that the installation worked as expected. (For this deployment, we would navigate to http://13.89.241.191:5601/app/kibana to confirm.)
_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
- Accessed Jump-Box-Provisioner VM (JBP VM) using ssh -i /Downloads/Jump-box-provisioner-key.pem azadmin@52.249.188.139.  To repeat using any authorized machine:  ssh -i <publickeyfilepath> <username>.<localmachineip>
- From within the JBP VM, access the ansible container by running the following commands:
    - docker start boring_goldwasser
	- docker attach boring_goldwasser
- Navigate to browser and enter http://<localhostip>:5601/app/kibana to load the Elk Stack server. 
- While the Elk Stack server should automatically load (so that the user should be able to access http://<localhost.ip>:5601]/app/kibana once the ansible container is launched), this may not always be the case.  If kibana fails to launch, take the following steps: 
	- SSH from ansible container to ElkServer (in this case, enter SSH ansibadmin@10.1.0.4).   
	- Run sudo docker container list -a (this will confirm whether the Elk container is up and running.) 
	- If it is not running, enter docker start elk. 
	- If this was successful, the Elk Stack server (kibana webpage) should load.  
- To download and enable Filebeat and Metricbeat: 
	- Run curl command to download the Filebeat and Metricbeat config files.  
	- Update the config files per the above instructions. 
- Run the Filebeat/Metricbeat playbook: ansible-playbook /etc/ansible/roles/filebeat-playbook.yml
- Navigate to http://<localhostip>:5601/app/kibana to confirm transmission of logs and metrics data.