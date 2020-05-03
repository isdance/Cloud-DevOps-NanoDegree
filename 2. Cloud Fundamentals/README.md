#### Lesson 1: Cloud Computing

##### 4. What is Cloud Computing

**Cloud Computing**
Cloud Computing is the delivery of IT resources over the Internet. The cloud is like a virtual data center accessible via the Internet that allows you to manage:
Storage services likes databases
Servers, compute power, networking
Analytics, artificial intelligence, augmented reality
Security services for data and applications

**Characteristics of Cloud Computing**
Pay as you go - You pay only for what you use and only when your code runs.
Autoscaling - The number of active servers can grow or shrink based on demand.
Serverless - Allows you to write and deploy code without having to worry about the underlying infrastructure.

##### 5. Types of Cloud Computing

**Infrastructure-as-a-Service (IaaS)**
The provider supplies virtual server instances, storage, and mechanisms for you to manage servers. For example `Rackspace`.

**Platform-as-a-Service (PaaS)**
A platform of development tools hosted on a provider's infrastructure. For example `Godday`.

**Software-as-a-Service (SaaS)**
A software application that runs over the Internet and is managed by the service provider. For example: `Gmail`.

#### 6. Cloud Deployment Models

**Public Cloud**
A public cloud makes resources available over the Internet to the general public.

**Private Cloud**
A private cloud is a proprietary network that supplies services to a limited number of people. "On-premises" BEST describes a private cloud.

**Hybrid Cloud**
A hybrid model contains a combination of both a public and a private cloud.
The hybrid model is a growing trend in the industry for those organizations that have been slow to adopt the cloud due to being in a heavily regulated industry. The hybrid model gives organizations the flexibility to slowly migrate to the cloud.

#### 7. Common Benefits

There are several benefits to the cloud.

- Stop guessing about capacity.
- Avoid huge capital investments up front.
- Pay for only what you use.
- Scale globally in minutes.
- Deliver faster.

#### 9. Services

Cloud Based Products
Amazon Web Services offers a broad set of global cloud-based products.

Analytics

- Quick Sight
- Athena
- Redshift

Application integration

- Simple Queue Service (SQS)
- Simple Notification Service (SNS)
  Cost management
- AWS Budgets

Compute services

- Elastic Cloud Compute (EC2)
- Lambda
- Elastic Beanstalk

Database management services

- MySQL
- Oracle
- SQLServer
- DynamoDB
- MongoDB

Developer tools

- Cloud 9
- Code Pipeline
  Security services
- Key Management Service (KMS)
- Shield
- Identity and Access Management (IAM)

Additional Services

- Blockchain
- Machine Learning
- Computer Vision
- Internet of Things (IoT)
- AR/VR

#### 10. Global Infrastructure

**Region**
A region is considered a geographic location or an area on a map.

**Availability Zone**
An availability zone is an isolated location within a geographic region and is a physical data center within a specific region.

**Edge Location**
An edge location is as a mini-data center used solely to cache large data files closer to a user's location.

**Additional Information**

- There are more Availability Zones (AZs) than there are Regions.
- There should be at least two AZs per Region.
- Each region is located in a separate geographic area.
- AZs are distinct locations that are engineered to be isolated from failures.

#### 11. Shared Responsibility Model

AWS is responsible for security **OF** the cloud, and provide tools that we need to secure our system. we are responsible for security **IN** the cloud.

![shared-responsibility-model](./docs/images/shared-responsibility-model.png)

Examples

**AWS is responsible for:**

- Securing edge locations
- Monitoring physical device security
- Providing physical access control to hardware/software
- Database patching
- Discarding physical storage devices

**You are responsible for:**

- Managing AWS Identity and Access Management (IAM)
- Encrypting data
- Preventing or detecting when an AWS account has been compromised
- Restricting access to AWS services to only those users who need it

#### Lesson 2: Foundational & Compute Service

Servers in the cloud have revolutionized the IT industry.

- Scale capacity up and down based on demands.
- Storage, more memory, and computing power can be added as needed.
- Obtain servers in minutes.
- No need for onsite hardware or capital expenses.

#### 3. Elastic Cloud Compute

Elastic Cloud Compute or **EC2** is a foundational piece of AWS' cloud computing platform, and is a service that provides servers for rent in the cloud.

**Pricing Options**
There are several pricing options for EC2.

- On Demand - Pay as you go, no contract.
- Dedicated Hosts - You have your **own dedicated hardware** and don't share it with others.
- Spot - You place a **bid on an instance price**. If there is extra capacity that falls below your bid, an EC2 instance is provisioned. If the price goes above your bid while the instance is running, the instance is terminated.
- Reserved Instances - You earn huge discounts if you pay up front and sign a **1-year or 3-year contract**.

Tips

- EC2 is found under the Compute section of the AWS Management Console.
- Spot instances can save you up to 90% off the on-demand pricing.
- There are several instance types that provide varying combinations of CPU, memory, storage, and networking capacity.

#### 5. Elastic Block Store (EBS)

Elastic Block Store (EBS) is a storage solution for EC2 instances and is a physical hard drive that is attached to the EC2 instance to increase storage.

Tips

- EBS is found on the EC2 Dashboard.
- There are several EBS volume types that fall under the categories of Solid State Drives (SSD) and Hard Disk Drives (HDD).

Benefits:

- Persist data after instance terminated.
- Automatically replicated within its Availability Zone.

#### 7. Why do we need security in the cloud for our servers?

Security in the cloud allows you to have complete control over your virtual networking environment.

- Configure your virtual network with public or private facing subnets
- Launch your servers in the selected network to secure access

#### 8. Virtual Private Cloud (VPC)

Topically when you create resources, they are on a flat network that shared among various AWS users. This will help you to reduce admin cost.
![VPC](./docs/images/vpc-01.png)

Virtual Private Cloud or **VPC** allows you to create your own private network in the cloud. You can launch services, like EC2, inside of that private network. This is done as a security measure. We expose what we do or do not expose to the internet to the public or private subnets.

A VPC spans all the Availability Zones in the region.

VPC allows you to control your virtual networking environment, which includes:

- IP address ranges
- subnets
- route tables
- network gateways

Tips

- VPC is found under Networking & Content Delivery section of the AWS Management Console.
- The default limit is **5 VPCs per Region**. You can request an increase for these limits.
- Your AWS resources are automatically provisioned in a default VPC.
- There are **no additional charges** for creating and using the VPC.
- You can store data in Amazon S3 and restrict access so that it’s only accessible from instances in your VPC.

#### 11. Why do we need compute power in the cloud?

Compute power in the cloud is a faster way to build applications, providing:

- no servers to manage (i.e. serverless)
- automatically scale
- ability to run code on demand in response to events
- high availability and fault tolerance
- pay only when your code runs
- developer focus on writing code

#### 12. Lambda

AWS Lambda provides you with computing power in the cloud by allowing you to **execute code without standing up or managing servers**. Lambda should focus on 1 task (15 minutes timeout).

Tips

- Lambda is found under the Compute section on the AWS Management Console.
- Lambdas have a time limit of 15 minutes.
- The code you run on AWS Lambda is called a “Lambda function.”
- Lambda code can be triggered by other AWS services.
- AWS Lambda supports Java, Go, PowerShell, Node.js, C#/.NET, Python, and Ruby. There is a Runtime API that allows you to use other programming languages to author your functions.
- Lambda code can be authored via the console.

Serverless:

- no concern for servers
- pay only when your code runs
- author locally or directly via console
- event-driven code

#### 15. Elastic Beanstalk

**Elastic Beanstalks** is an orchestration service that allows you to deploy a web application at the touch of a button by spinning up (or provisioning) all of the services that you need to run your application.

Process

- EC2
- Auto-scaling
- Elastic load balancer
- Services like database, VPCs and Security Groups

Tips

- Elastic Beanstalk is found under the Compute section of the AWS Management Console.
- Elastic Beanstalk can be used to deployed web applications developed with Java, .NET, PHP, Node.js, Python, Ruby, Go, and Docker.
- You can run your applications in a VPC.

#### Lesson 3: Storage & Content Delivery

#### 2. Why do we need storage in the cloud?

Storage and database services in the cloud provide a place for companies to `collect, store, and analyze` the data they've collected over the years at a massive scale.

Benefits:

- Durability (Guarantees no data loss): Your data will be there in the future
- Availability (How quickly you can access your data): Fast and reliable
- Scalability (Meet demand seamlessly including Automatically Adding/removing resources and maintain steady state)

Type of Scaling:

- vertical: Scaling up by modifying the server (adding more memory or capacity)
- horizontal: Scaling out by adding or removing servers
- diagonal: combination of vertical and diagonal

Storage & Database Services

- Amazon Simple Storage Service (Amazon S3)
- Amazon Simple Storage Service (Amazon S3) Glacier
- DynamoDB
- Relational Database Service (RDS)
- Redshift
- ElastiCache
- Neptune
- Amazon DocumentDB

#### 3. S3 & Glacier

Amazon Simple Storage Service (or S3) is an object storage system in the cloud.

Storage Classes
S3 offers several storage classes, which are different data access levels for your data at certain price points.

**Bucket**
All objects are stored in a bucket.
Buckets lives in a region, but bucket name must be globally unique.

**Durability & Scalability**

- Durability of 99.99999999%
- Multiple availability zones
- Availability of 99.99%

- S3 Standard
- S3 Glacier
- S3 Glacier Deep Archive
- S3 Intelligent-Tiering
- S3 Standard Infrequent Access
- S3 One Zone-Infrequent Access

Tips

- A single object can be up to 5 terabytes in size.
- You can enable Multi-Factor Authentication (MFA) Delete on an S3 bucket to prevent accidental deletions.
- **S3 Acceleration** can be used to enable fast, easy, and secure transfers of files over long distances between your data source and your S3 bucket.
