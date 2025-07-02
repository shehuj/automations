# scripts
#####
set_up.sh = Creates users, user directories, user groups and adds each user to respective group, sets appropriate permissions to isolate users (separation of concerns) and sets user password.

#####    MONITORING WITH PROMETHEUS    #####
install-monit.yml = is a demo ansible playbook that install and confogure monitoring (prometheus and nginx alongside node and nginx exporters, sets up stub status location to scrape the nginx app and adds the jobs to the prometheus.yml config file on ubuntu linux server.
Prerequisites to use the playbook;
- An existing ubuntu server
- Create hosts.ini file
- create ansible.cfg file.
