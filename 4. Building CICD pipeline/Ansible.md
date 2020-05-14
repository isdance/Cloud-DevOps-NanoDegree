### Lesson 3: Ansible and Configuration Manager

#### 1. Ansible Intro

Here’s what you’re going to learn in this Ansible lesson:

- Ansible overview
- Configuration management philosophy
- How to install/update software with Ansible
- What are templates and how to use them
- Managing services with Systemd
- Controlling when actions are taken conditionally
- Classification of machines for conditionals
- How to create and manage roles
- What is an inventory file
- Ansible file structure

Ansible - Introduction
Ansible is an IT automation tool that can automate the system configuration, software deployment, and infrastructure orchestration for continuous deployments or zero downtime rolling updates. It is an open-source community project sponsored by Red Hat

Ansible is a `agent-less` language which does not use agent (a lightweight software program that lives on a server or container, constantly reporting back to your configuration management server), but uses SSH to connect to servers, opening/closing a session. For Linux uses Python+Ruby, for Windows uses Python+Powershell

Ansible uses YAML to write `Ansible Playbooks`. Playbook files describe the automation tasks. The following are the benefits of using this automation tool:

- Well-Suited Architecture - Ansible connects to the nodes (processing entities) and launches tiny programs, called `Ansible modules`. Modules are removed when they finish executing.

- Secure - Ansible uses SSH keys with ssh-agent. It supports Kerberos and other identity management systems.

- Simple, Scalable, and Manageable - Ansible uses INI file that contains the grouped information of all the nodes and machines that it is managing. This file makes it easy to deal with large scale infrastructure.

#### 2. Templates

- Ansible templates enable you to apply configuration files which are customized to fit the application
- Variables are abstracted using the format: `{{ VARIABLE_NAME }}`

Templates Example Code
File: repo.conf.j2

```
server {
        listen   80;
        server_name  {{ SERVER_NAME }};
        root   {{ REPO_PATH }};
        location / {
                index  index.php index.html index.htm;
                autoindex on;    #enable listing of directory index
        }
}
```

To Apply Template to the system which is where this module template takes place.

```
- name: generate all configmap configs
  template:
      src: repo.conf.j2
      dest: /etc/nginx/conf.d/repo.conf
      owner: root
      group: root
      mode: 0744
```

#### 3. Services

This refers to the Linux means of managing how a service is run.

- enabling: means when the system restarts, that service will start automatically.
- starting: means the temporal moment of now of making that service run. But when the system restarts, the service will not necessarily start again unless it's in enabled state.

What is daemon-reload
It is for services recently Systemd must be reloaded for changes to take effect

![Systemd](./docs/images/sytemd-01.png)

#### 4. Conditionals (Controlling Execution)

Conditionals Register
Set an Ansible variable to the output of the module

```
- name: How long has the server been up
  shell: uptime
  register: sys_uptime
```

![Conditionals](./docs/images/conditionals-01.png)

Built-in Ansible Variables

- To see every built-in variable for the system you are using (every host is different) (change localhost to the host you are checking): `$ ansible -m setup localhost`

- Some common ones:
  - ansible_hostname
  - ansible_all_ipv4_addresses
  - ansible_architecture
  - ansible_kernel

#### 5. Roles

A role is a collection of tasks(including templates, variables and files) that are designed to perform some common activity.

**Ansible Role Definition**
Each role is contained in a subdirectory: roles/name_of_role

Containing additional directories:

- Tasks
- Templates
- Vars
- Files

**Ansible Role Assignment**

To include a role:

```
- name: Initialize Vault Server
      include_role:
        name: vault
```

#### 6. Running Ansible

**What are Playbooks?**
Playbooks are the YAML files that describe the policy for configuration, deployment, and orchestration tasks. These playbooks are utilized by the "Ansible Modules" to manage configurations and deployments to remote machines (nodes). Playbooks can deploy multi-tier rolling updates and can assign actions for other nodes. [Working With Playbooks ](https://docs.ansible.com/ansible/latest/user_guide/playbooks.html)

Ansible Inventory file:
Denoting different collection of servers.

![Inventory file](./docs/images/inventory-file-01.png)

Running Ansible Playbook with Inventory example:

```
ansible-playbook -i my_hosts -a SE_LINUX=”true” init_servers.yaml
```

-i Your inventory
-a Variables. Here we have 1 SE_LINUX=”true”

and init_servers.yaml file will be executed.

#### 7. Ansible Review

- Ansible templates
- Ansible systemd
- Ansible conditionals
- Ansible package installs
- Ansible inventory
- Ansible roles

#### 8. Ansible Practice

##### Practice 1:

Step 1: Install Ansible using `sudo apt install -y ansible`

Step 2: Create a new directory structure using the command. This is for the Ansible role to install Nginx. Roles can also be put inside default location `/etc/ansible/roles`

```
mkdir -p nginx_ansible/roles/nginx/tasks # -p create folder structure recursively
```

Step 3: Create an maim.yaml (role file for install nginx)

roles/nginx/tasks/main.yaml:

```yaml
- name: Install Nginx
  apt:
    name: nginx
    state: present
  when: ansible_facts['os_family'] == 'Debian'
```

Step 4: Create your playbook file under project root `nginx_ansible/`

nginx_ansible/playbook-nginx.yaml

```yaml
# Install Nginx
- hosts: localhost
  connection: local
  become: True # set to 'yes' to activate privilege escalation.
  become_user: root # set to user with desired privileges — the user you become, NOT the user you login as.
  roles:
    - nginx
```

Step 5: Create an inventory file under project root `nginx_ansible/`

nginx_ansible/inventory.txt

```
localhost ansible_connection=local
```

Step 6: Execute the playbook file `sudo ansible-playbook -i inventory.txt playbook-nginx.yaml`

```sh
osboxes@ansiblecontroller:~/nginx_ansible$ sudo ansible-playbook -i inventory.txt playbook-nginx.yaml
[sudo] password for osboxes:

PLAY [localhost] ***************************************************************

TASK [Gathering Facts] *********************************************************
[DEPRECATION WARNING]: Distribution Ubuntu 18.04 on host localhost should use
/usr/bin/python3, but is using /usr/bin/python for backward compatibility with
prior Ansible releases. A future Ansible release will default to using the
discovered platform python for this host. See https://docs.ansible.com/ansible/
2.9/reference_appendices/interpreter_discovery.html for more information. This
feature will be removed in version 2.12. Deprecation warnings can be disabled
by setting deprecation_warnings=False in ansible.cfg.
ok: [localhost]

TASK [nginx : Install Nginx] ***************************************************
[WARNING]: Updating cache and auto-installing missing dependency: python-apt
changed: [localhost]

PLAY RECAP *********************************************************************
localhost                  : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

```

As you can see the installation is completed successfully.

Step 7: Test nginx is running

```sh
osboxes@ansiblecontroller:~/nginx_ansible$ curl http://localhost:80
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>

```

#### Practice Exercise 2

On top of Practice 1, create a template to generate your configuration file.

Step 01: Update `roles/nginx/tasks/main.yaml` to add a new play, which is for updating the nginx config file

roles/nginx/tasks/main.yaml

```yaml
- name: Install Nginx
  apt:
    name: nginx
    state: present
  when: ansible_facts['os_family'] == 'Debian'

- name: generate Nginx site config
  template: # Template a file out to a remote server
    src: site.conf.j2 # read from roles/nginx/templates/
    dest: /etc/nginx/sites-enabled/site.conf
    owner: root
    group: root
    mode: 074
```

Step 02: Create this `site.conf.j2`, underneath `roles/nginx/templates/` folder

roles/nginx/templates/site.conf.j2:

```yaml
server {
        listen   80;
        server_name  {{ SERVER_NAME }};
        root   {{ FILE_PATH }};
        location / {
                index  index.php index.html index.htm;
                autoindex off;    #enable listing of directory index
        }
}
```

So you can see there a few variables. So we need to create a variables file

Step 03: Create a variables file, under `roles/nginx/vars/` folder

```yaml
SERVER_NAME: localhost # in cloud env, use your public IP address of the EC2 instance
FILE_PATH: /var/www/html
```

Step 04: execute the playbook again

```sh
osboxes@ansiblecontroller:~/nginx_ansible$ sudo ansible-playbook -i inventory.txt playbook-nginx.yaml
[sudo] password for osboxes:

PLAY [localhost] ***************************************************************

TASK [Gathering Facts] *********************************************************
[DEPRECATION WARNING]: Distribution Ubuntu 18.04 on host localhost should use
/usr/bin/python3, but is using /usr/bin/python for backward compatibility with
prior Ansible releases. A future Ansible release will default to using the
discovered platform python for this host. See https://docs.ansible.com/ansible/
2.9/reference_appendices/interpreter_discovery.html for more information. This
feature will be removed in version 2.12. Deprecation warnings can be disabled
by setting deprecation_warnings=False in ansible.cfg.
ok: [localhost]

TASK [nginx : Install Nginx] ***************************************************
ok: [localhost]

TASK [nginx : generate Nginx site config] **************************************
changed: [localhost]

PLAY RECAP *********************************************************************
localhost                  : ok=3    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

```

Check the config file has been updated

```sh
osboxes@ansiblecontroller:~/nginx_ansible$ cat /etc/nginx/sites-enabled/site.conf
server {
        listen   80;
        server_name  localhost;
        root   /var/www/html;
        location / {
                index  index.php index.html index.htm;
                autoindex off;    #enable listing of directory index
        }
}

```

#### Practice Exercise 3

Add a html file to nginx, then reload nginx

Step 1: Add 2 more plays to `roles/nginx/tasks`

```yaml
- name: Install Nginx
  apt:
    name: nginx
    state: present
  when: ansible_facts['os_family'] == 'Debian'

- name: generate Nginx site config
  template: # Template a file out to a remote server
    src: site.conf.j2 # copy from roles/nginx/templates/
    dest: /etc/nginx/sites-enabled/site.conf
    owner: root
    group: root
    mode: 074

- name: Generate index.html
  template: # Template a file out to a remote server
    src: index.html.j2
    dest: /var/www/html/index.html # copy from roles/nginx/templates/
    owner: root
    group: root
    mode: 0744

- name: Enable Nginx service
  systemd:
    name: nginx
    daemon_reload: yes
    enabled: yes
    state: started
```

Step 2: Create a html Jinja2 template under `roles/nginx/templates/index.html.j2`

index.html.j2

```html
<!DOCTYPE html>
<html>
  <head>
    <title>Welcome {{ STUDENT_NAME }} to Ansible</title>
  </head>
  <body>
    <p><strong>Configure your world your way &#153;</strong></p>
  </body>
</html>
```

Step 3: Update your variable file to include a variable `STUDENT_NAME`. Variables was created under `roles/nginx/vars/main.yaml`

roles/nginx/vars/main.yaml

```yaml
SERVER_NAME: localhost #  public IP address of the EC2 instance
FILE_PATH: /var/www/html
STUDENT_NAME: Yang Gu
```

Step 04: Execute playbook

```sh
osboxes@ansiblecontroller:~/nginx_ansible$ sudo ansible-playbook -i inventory.txt playbook-nginx.yaml

PLAY [localhost] ***************************************************************

TASK [Gathering Facts] *********************************************************
[DEPRECATION WARNING]: Distribution Ubuntu 18.04 on host localhost should use
/usr/bin/python3, but is using /usr/bin/python for backward compatibility with
prior Ansible releases. A future Ansible release will default to using the
discovered platform python for this host. See https://docs.ansible.com/ansible/
2.9/reference_appendices/interpreter_discovery.html for more information. This
feature will be removed in version 2.12. Deprecation warnings can be disabled
by setting deprecation_warnings=False in ansible.cfg.
ok: [localhost]

TASK [nginx : Install Nginx] ***************************************************
ok: [localhost]

TASK [nginx : generate Nginx site config] **************************************
ok: [localhost]

TASK [nginx : Generate index.html] *********************************************
changed: [localhost]

TASK [nginx : Enable Nginx service] ********************************************
ok: [localhost]

PLAY RECAP *********************************************************************
localhost                  : ok=5    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

```

And verify the html is updated

```sh
osboxes@ansiblecontroller:~/nginx_ansible$ curl http://localhost
<!doctype html>
   <html>
     <head>
         <title>Welcome Yang Gu to Ansible</title>
     </head>
     <body>
       <p><strong>Configure your world your way &#153;</strong></p>
     </body>
   </html>

```
