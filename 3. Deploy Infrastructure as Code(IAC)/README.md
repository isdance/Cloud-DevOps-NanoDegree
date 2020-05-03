#### Lesson 1: Getting Started with Cloud Formation

#### 3. What is DevOps

DevOps is the combination of industry best practices, and set of tools that improve an organization’s ability to:

- Increase the speed of software delivery
- Increases the speed of software evolution
- Have better reliability of the software
- Have scalability using automation,
- Improved collaboration among teams.

In other words, these tools enable a company to showcase industry best practices in software development.

#### 4. Why you need DevOps

Issues that DevOps tries to solve:

- Unpredictable deployments
- Mismatched environments (development doesn’t match production)
- Configuration Drift

#### 5. What are the benefits of Cloud DevOps?

DevOps best practices and tools
One of the benefits of using DevOps is that it allows predictable deployments using automated scripts. In the DevOps model, development and operations teams are merged into a single team. These DevOps teams use a few tools and best practices that deploy and manage configuration changes to servers.

The most important practices are:

- Continuous Integration / Continuous Delivery (CI/CD) - new features are automatically deployed with all the required dependencies.
- Infrastructure as Code (IaaC) - configuration and management of cloud infrastructure using re-usable scripts.

Other prevalent practices are:

- Microservices
- Monitoring and Logging
- Communication and Collaboration

Glossary

1. **Continuous Integration Continuous Deployment (CI/CD)**: Tracks the development workflow from testing through production. Continuous integration is the process flow of testing any change made to your development flow, while continuous deployment tracks those changes through to staging and production systems. You may like to read this article by Atlassian.com that describes CI/CD in detail.

2. **Infrastructure as code (IaaC)**: Provision and manages the cloud-infrastructure by using scripts. These scripts can be written in YAML or JSON format. These scripts ensure that the same architecture can be re-built multiple numbers of times. These scripts are particularly useful in enterprise applications and different environments - dev, prod, or test. Read more here.

3. **CloudFormation**: CloudFormation is a tool in AWS for managing, configuring and deploying infrastructure (push code along with the necessary server configurations).

#### 7. Creating Access Key ID for IAM User

When creating IAM user, you don't need to specify region, as IAM Users are global.

Deciding Access Privileges within AWS

##### Programmatic Access

In the AWS console, choose "programmatic access." This allows us to use code to interact with AWS, instead of relying on mouse clicking in the console web pages.

##### dministrator Access

For IAM access, choose “administrator access.” This is just for initial setup of your account. Afterwards, you’ll want to limit access to only what you need.

##### Dev and Prod user accounts

In practice, Dev and DevOps members may have separate user accounts for the dev environment as opposed to the production environment. This makes it easier for developers by giving them wider privileges in the dev environment that would normally only be reserved for DevOps members in the production environment.

##### Access Key ID and Secret Access Keys

Remember not to save these in your code or to check into any repositories. Keep these private to you.

#### Configuring AWS CLI

- Be sure to rotate your keys every 90 days
- Disable or delete unused ones and save them in a good location, such as AWS’s own Parameter Store.

#### 9. Adding Additional Keys

Additional Access Keys
Note that each user can have up to 2 access keys at the same time.

Why Making Keys Inactive is a Better Choice
You may make your access key temporarily inactive rather than destroying it and creating a new one. This may be helpful if you want to stop an automated process that uses that key (for example, a CI/CD process).

#### 10. Understanding CloudFormation

CloudFormation

- CloudFormation is a declarative language, not an imperative language.
- CloudFormation handles resource dependencies so that you don’t have to specify which resource to start up before another. There are cases where you can specify that a resource depends on another resource, but ideally, you’ll let CloudFormation take care of dependencies.
- VPC is the smallest unit of resource.

Glossary
**Declarative languages**: These languages specify what you want, without requiring you to specify how to get it. An example of a popular declarative language is SQL.
**Imperative languages**: These languages use statements to change the state of the program.
Additional resources:

#### 11. Getting Started With CloudFormation Script

YAML and JSON

- YAML and JSON file formats are both supported in CloudFormation, but YAML is the industry preferred version that’s used for AWS and other cloud providers (Azure, Google Cloud Platform).

- An important note about YAML files: the whitespace indentation matters! We recommend that you use four white spaces for each indentation.

Glossary in CloudFormation scripts
**Name**: A name you want to give to the resource (does this have to be unique across all resource types?)

**Type**: Specifies the actual hardware resource that you’re deploying.

**Properties**: Specifies configuration options for your resource. Think of these as all the drop-down menus and checkbox options that you would see in the AWS console if you were to request the resource manually.

**Stack**: A stack is a group of resources. These are the resources that you want to deploy, and that are specified in the YAML file.

Best practices
**Coding best practice**: Create separate files to organize your code. You can either create separate files for similar resources or create files for each developer who uses those resources.
