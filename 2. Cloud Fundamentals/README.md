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
Servers In The Cloud
Servers in the cloud have revolutionized the IT industry.

- Scale capacity up and down based on demands.
- Storage, more memory, and computing power can be added as needed.
- Obtain servers in minutes.
- No need for onsite hardware or capital expenses.