#### Lesson 1: Deploy an Event-Driven Microservice

#### 1. Lesson Outline

In this lesson, you'll learn to deploy serverless applications, using AWS Lambda. This lesson breaks up the topic of serverless applications into smaller concepts:

- What are Functions as a Service (FaaS)?
- Characteristics of cloud-native applications
- Creating an AWS Lambda function using Cloud9
- Responding to events, such as HTTP requests
- Creating a JSON response

Request-Response
Much of this lesson will rely on creating and understanding the request-response method of computer communication. From the Wikipedia page:

"Request–response ... is one of the basic methods computers use to communicate with each other, in which the first computer sends a request for some data and the second responds to the request. Usually, there is a series of such interchanges until the complete message is sent; browsing a web page is an example of request–response communication.

Request–response can be seen as a telephone call, in which someone is called and they answer the call."

In this lesson, requests are typically HTTP requests with some input data, and a response will be a JSON-formatted set of output values.

By the end of this lesson, you'll have all the skills you need to develop and deploy serverless functions of your own design!

##### Functions as a Service (FaaS)

What is AWS Lambda?
From the AWS documentation:

"AWS Lambda is a compute service that lets you run code without provisioning or managing servers."

"AWS Lambda executes your code only when needed and scales automatically, from a few requests per day to thousands per second.
You pay only for the compute time you consume - there is no charge when your code is not running."
"You can use AWS Lambda to run your code in response to events," such as HTTP requests.

SQS Queue
Amazon Simple Queue Service (Amazon SQS) offers a secure, durable, and available hosted queue that lets you integrate and decouple distributed software systems and components.

- A queue is just a type of list that orders data in a particular way; typically in a first-item-in = first-item-out order (FIFO), as shown below.

![SQS](./docs/images/02-sqs.jpg)

##### A Model for Serverless

Models for Serverless
Though we'll be using AWS cloud tools, there are a number of other providers that you can use to build serverless applications with auto-scaling capabilities. The skills you learn in this lesson will be widely applicable to these other platforms. Some of the larger, cloud providers include:

- Amazon Web Services [ Chalice & Cloud Formation]
- Terraform
- Google Cloud Platform
- Microsoft Azure

##### Why FaaS?

- Simplicity.
- Services that are event-driven and instantaneously scalable.
- Event based, so you can have your logic sitting in the cloud, but doesn't run until you need it to run.
- Complete abstraction of servers away from the developer. Higher developer ROI because server infrastructure management no longer required.
- Cost-effective. There is billing on-demand; based on consumption and executions.

##### Characteristics of Cloud-Native Systems

What are Some Characteristics of Cloud-Native Systems?
Microservice oriented
Microservices more closely map business logic to code. These systems can be updated and developed independently. A good example of a Microservice architecture would be a Python AWS Lambda application that uses API Gateway.

Elastic
Elastic systems can automatically scale to meet increased load without the involvement of humans. These same systems can then scale down again when load diminishes. By eliminating human touchpoints, which are error-prone, the quality increases. Likewise, because the system can scale up and down for demand, it is more efficient to run and costs less.

Continuous Delivery
Cloud-native systems leverage IAC (infrastructure as code) to fully define the infrastructure. This means that deployment can target a dynamically created environment and that software can be automatically deployed to a new environment as it is created. Humans again are eliminated from the process of deployment increasing quality.

DevOps
Cloud-native systems utilize DevOps. DevOps is a combination of automation, processes, and tools that increase automation, collaboration, and operational efficiency. Using Python for DevOps is a common way this automation is achieved.

Agility
The agility of developing solutions improves. The cloud speeds up development time and increases quality through the use of IaC (Infrastructure as Code) and Continuous Delivery.

Composable
Cloud-Native solutions are highly composable. The service design is one of integration. At the minimum, each service has an Application Programming Interface (API) that is consistent and discoverable. Other traits include well-defined behaviors for registration, discovery, and request management.

Pros:

- Ability to leverage near infinite resources of the cloud: Compute, Disk I/O, Storage, and Memory.
- No up-front costs and resources can be metered to meet demand like an electric or water utility.
- Applications are able to “go global” immediately with no extra investment.
- Increased reliability is increased as many cloud services are themselves highly available. A good example is Amazon S3 which has nine nine’s availability or is 99.999999999% reliable.
- Security is improved by consolidating to a centralized security model where there is a shared security partnership with the cloud vendor. They take care of portions of security such as access to the physical data center.
- The speed applications can be developed and tested are dramatically improved. With concepts like IAC (Infrastructure as Code), complete replicas of a production environment can be provisioned, tested, and then destroyed. This leads to increased quality of software and speed in which software can be developed.

Cons:

- Risk of creating systems that rely on a specific cloud vendor.
- The cost involved in migrating an application to a different architecture.
- A current organization may need to hire a new workforce trained to use the cloud or retrain their workforce.

What is Fault-Tolerance?
Fault Tolerance - the property that enables a system to continue operating properly in the event of the failure of one or more of its components.

- An example is a typical car, which is designed so it will continue to be drivable if one of the tires is punctured or damaged.
- In computer systems, a fault-tolerant design enables a system to continue its intended operation, possibly at a reduced level, rather than failing completely, when some part of the system fails.

##### Lambda Functions

AWS Lambda is a new category of computing where business logic can be directly deployed to a production environment without thinking about servers. Another word for this is serverless or FaaS (Function As A Service). Some of the benefits of AWS Lambda include no servers to manage, continuous scaling, and billing at the sub-second level.

Another benefit of AWS Lambda includes being part of an ecosystem designed to exploit the capability. Here are two examples of AWS Lambda. The first example is AWS Step Functions. They build upon AWS Lambda to create more sophisticated workflows like polling for a job to finish and performing an action. The second example is AWS DeepLens (a computer vision device). It uses AWS Lambda to serve out predictions. Finally, if you look closely, almost every service on AWS can utilize AWS Lambda.

The AWS ecosystem allows Lambda functions to respond to events instead of constantly running. This is similar to a motion detector that turns on a light in the garage. The duration the light may run for could be only a few hours per year. If the light switch was manually triggered it is possible the light would be run constantly for 365 days in the year.

The AWS Lambda ecosystem allows integration with other core services in AWS through triggers. An example of a trigger would be a movie file that is uploaded to Amazon S3 storage. An AWS Lambda function could be triggered that uses an AWS API to transcode the movie file to a different code or to add captioning.

##### Deploying and Testing

One of the most common ways to trigger the Lambda function would be through API Gateway. A web service is created by adding API Gateway to the lambda, and then, if the URL is requested by a browser or an API call, it would, in turn, trigger the Lambda function.

Another common way to trigger the AWS Lambda function would be to attach it to Amazon S3. Instead of the Lambda function being triggered from the web service, it could be triggered every time a new file is placed in an S3 bucket. Yet another trigger could be a CloudWatch Event Timer. A timer could be set up to run every hour. At the top of each hour, the Lambda function would be called.

Let’s get into a real-world example now. A company that needs to collect a competitor’s pricing, say for a similar washing machine they are selling, could create a Lambda function that scrapes the competitor’s website. Next, a CloudWatch Event timer could run nightly to scrape the website and put the results into an S3 bucket. When the S3 bucket receives the HTML results, a second AWS Lambda function could be triggered that extracts the pricing information from the HTML file and writes it to DynamoDB, if it is lower than the current value in the database. Finally, the website itself could host a third AWS Lambda function that uses API Gateway to serve out the companies current prices, which will always be at least the same price or lower than their competitors.

#### Tutorial: Making Change

![Making Change](./docs/images/lambda-change-01.png)

Key Terms:
Microservice
A lightweight loosely coupled service. It can be as small as a function.

FaaS (Function as a Service)
A type of cloud computing that facilitates functions that respond to events.

AWS Lambda
A serverless compute platform by AWS that has FaaS capability.

Cloud-Native Applications
Cloud-Native applications are services that utilize the unique capabilities of the cloud, like serverless.

SQS Queue
A distributed messaging queue built by Amazon with near-infinite reads and writes.

Serverless
Serverless is a technique of building applications based on functions and events.

Moore's Law
The perception that for some time the number of transistors on a microchip doubles every two years.

AWS Cloud9
AWS Cloud9 cloud-based development environment running in AWS. It has special hooks for developing serverless applications.

Python Virtual Environment
A python virtual environment is created by isolating a python interpreter to a directory and installing packages in that directory. The python interpreter can perform this action via python -m venv yournewenv.

#### Lesson 2: Using Docker Format Containers

#### 1. Docker Containers

Real-World Examples of Containers
What problem do Docker format containers solve? In a nutshell, the operating system runtime can be packaged along with the code, and this solves a particularly complicated problem with a long history. There is a famous meme that goes "It works on my machine!". While this is often told as a joke to illustrate the complexity of deploying software, it is also true. Containers solve this exact problem. If the code works in a container, then the container configuration can be checked in as code. Another way to describe this concept is that the actual Infrastructure is treated as code. This is called IaC (Infrastructure as Code).

Why Docker Containers vs Virtual Machines?
What is the difference between a container and a virtual machine? Here is a breakdown:

- Size: Containers are much smaller than Virtual Machines (VM) and run as isolated processes versus virtualized hardware. VMs can be GBs while containers can be MBs.
- Speed: Virtual Machines can be slow to boot and take minutes to launch. A container can spawn much more quickly typically in seconds.
- Composability: Containers are designed to be programmatically built and are defined as source code in an Infrastructure as Code project (IaC). Virtual Machines are often replicas of a manually built system. Containers make IaC workflows possible because they are defined as a file and checked into source control alongside the project’s source code.

#### 3. Makefiles

`Makefiles` is a convention that the unix shell is aware of that allows you to put a bunch of commands in it, and run those commands. It sis a convenient way to setup an order of operations in your project.

```python
setup:
	@echo "running $@"
	python3 -m venv ~/.devops
	  # source ~/.devops/bin/activate

install:
	@echo "running $@"
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	@echo "running $@"
	python -m pytest -vv --cov=myrepolib tests/*.py
	python -m pytest --nbval notebook.ipynb


lint:
	@echo "running $@"
	pylint --disable=R,C myrepolib cli web

all: install lint test
```

"\$@" is the variable for a string containing the target name, in this case it will be `setup`, `install`, `test` or `lint`.

Then you can use `make setup` to create venv, use `make install` to install dependencies, use `make test` to run test, use `make lint` to run lint. `make all` to run every commands listed in `all` section

#### Makefile Creation Recap

Let’s recap the key concepts of creating a Makefile.

- setup: You have seen most of this line before, which is dealing with our Python 3 virtual environment.
- install: This installs the requirements for our environment. In our case, it also install the pytest and pylint libraries used later on in the Makefile.
- test: This is broken into two parts for testing.
  First, it will use .py files in the tests directory. The -vv flag ensures short test durations are still shown (see documentation), while the -cov flag helps to calculate what the test coverage of the code is (see documentation) in a given directory.
  The second line is used to test Jupyter Notebook cells. The --nbval flag makes pytest pay attention to jupyter notebooks (see documentation).
- lint: This will lint what is in the myrepolib directory, as well as the cli.py and web.py files in our current directory (see video). The --disable=R,C is used to disable the "convention" (C) and "refactor" (R) message classes (see related Stack Overflow post).
- all: You may notice this line looks a little different than the above lines, with the commands on the same line. This will execute our install, lint and test commands.

#### Makefile Usage Recap

Let’s recap the key concepts of a using a Makefile.

Once the Makefile is created, you can use:

`make install`
`make lint`
to install dependencies and test your code.

#### 6. Linting and CircleCI

Extending a Makefile for use with Docker Containers
Beyond the simple `Makefile`, it is also useful to extend it to do other things. An example of this is as follows:

Example Makefile for Docker and CircleCI

```python
setup:
    python3 -m venv ~/.container-revolution-devops

install:
    pip install --upgrade pip &&\
        pip install -r requirements.txt

test:
    #python -m pytest -vv --cov=myrepolib tests/*.py
    #python -m pytest --nbval notebook.ipynb

validate-circleci:
    # See https://circleci.com/docs/2.0/local-cli/#processing-a-config
    circleci config process .circleci/config.yml

run-circleci-local:
    # See https://circleci.com/docs/2.0/local-cli/#running-a-job
    circleci local execute

lint:
    hadolint demos/flask-sklearn/Dockerfile
    pylint --disable=R,C,W1203,W1202 demos/**/**.py

all: install lint test
```

- A Dockerfile linter is called hadolint checks for bugs in a Dockerfile.

- A [local version of the CircleCI build system](https://circleci.com/docs/2.0/local-cli/) allows for testing in the same environment as the SaaS offering.

- The minimalist approach is still present. A user only needs to remember to use the same commands: `make install`, `make lint` and `make test`, but the `lint` step is more complete and powerful with the inclusion of `Dockerfile` as well as `Python` linting.

Notes about installing `hadolint` and `circleci`: If you are on OS X you can `brew install hadolint`. If you are on another platform follow the instructions from the [hadolint GitHub repo](https://github.com/hadolint/hadolint/). To install the local version of circleci on OS X or Linux you can run `curl -fLSs https://circle.ci/cli | bash` or follow the official instructions for [local version of the CircleCI build system](https://circleci.com/docs/2.0/local-cli/).

Install CircleCI CLI

```
sudo curl -fLSs https://raw.githubusercontent.com/CircleCI-Public/circleci-cli/master/install.sh | sudo bash
```

check version `circleci version`

Now we will run linting for Docker containers
**Step 01**: Create a new Cloud9 environment `dockerproj`

**Step 02**: Create a new repo `dockerproj` on Github. [link](https://github.com/isdance/dockerproj)

**Step 03**: Create a new ssh from Cloud9 project, clone the `dockerproj` repo, and cd into `dockerproj`

**Step 04**: Create a few files

```sh

touch Dockerfile
touch requirements.txt
touch Makefile
touch app.py
```

And started with Dockerfile

```Dockerfile
FROM python:3.7.3-stretch

## Step 1:
# Create a working directory
WORKDIR /app

## Step 2:
# Copy source code to working directory
COPY . /app

## Step 3:
# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN pip install --upgrade pip && \
    pip install --trusted-host pypi.python.org -r requirements.txt
```

a simple app.py

```py
import click

@click.command()
def hello():
    click.echo("Hello world!")

if __name__ == '__main__':
    hello()
```

Makefile

```sh
## The Makefile includes instructions on environment setup and lint tests
# Create and activate a virtual environment
# Install dependencies in requirements.txt
# Dockerfile should pass hadolint
# app.py should pass pylint
# (Optional) Build a simple integration test

setup:
	# Create python virtualenv & source it
	# source ~/.devops/bin/activate
	python3 -m venv ~/.devops

install:
	# This should be run from inside a virtualenv
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	# Additional, optional, tests could go here
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

lint:
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	# This is linter for Dockerfiles
  hadolint Dockerfile
	# This is a linter for Python source code linter: https://www.pylint.org/
	# This should be run from inside a virtualenv
	pylint --disable=R,C,W1203,W1202 app.py

all: install lint test
```

The step `make lint` will need `hadolint`. Here we use docker hadolint/hadolint to lint Dockerfile

Try to run `make lint` and see if there is any error

requirements.txt

```
click
pylint
```

**Step 05**: Create a few virtual env using venv

```sh
python3 -m venv ~/.dockerproj
source ~/.dockerproj/bin/activate
```

And run `make install` to install dependencies in venv

**Step 06**: Create docker image

```
docker build --tag=app .
```

If I bash into the container

```
docker run -it app bash
```

you will see something like:

```
root@69fa637554b5:/app# ls
Dockerfile  Makefile  README.md  app.py  requirements.txt

# try to run app.py
root@69fa637554b5:/app# python app.py
Hello world!
```

**Step 7**: Install CircleCI CLI locally, and create config.yml

Now you are still in venv

```
sudo curl -fLSs https://circle.ci/cli | sudo bash
```

You will see some error

```
Starting installation.
Installing CircleCI CLI v0.1.7251
Installing to /usr/local/bin
An error occurred installing the tool.
The contents of the directory /tmp/tmp.wNpWsw11Im have been left in place to help to debug the issue.
```

But CircleCI CLI has been installed

```sh
(.dockerproj) ec2-user:~/environment/dockerproj (master) $ circleci version
0.1.7251+4372c84
```

and create folder `.circleci`, and add a file `.circleci/config.yml`

```yml
# Python CircleCI 2.0 configuration file
#
# Check https://circleci.com/docs/2.0/language-python/ for more details
#
version: 2
jobs:
  build:
    docker:
      # Use the same Docker base as the project
      - image: python:3.7.3-stretch

    working_directory: ~/repo

    steps:
      - checkout

      # Download and cache dependencies
      - restore_cache:
          keys:
            - v1-dependencies-{{ checksum "requirements.txt" }}
            # fallback to using the latest cache if no exact match is found
            - v1-dependencies-

      - run:
          name: install dependencies
          command: |
            python3 -m venv venv
            . venv/bin/activate
            make install
            # Install hadolint
            wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 &&\
              chmod +x /bin/hadolint

      - save_cache:
          paths:
            - ./venv
          key: v1-dependencies-{{ checksum "requirements.txt" }}

      # run lint!
      - run:
          name: run lint
          command: |
            . venv/bin/activate
            make lint
```

and commit everything to Github repo

**Step 8**: Connect your Github Repo to circleCI. It will create a new branch for you `circleci-project-setup` with some basic circleCI config. BUT meantime it will watch all branches including `master`

![circleci-remote](./docs/images/circle-ci-01.png)

![circleci-remote](./docs/images/circle-ci-02.png)

**Step 9**: Now you can verify it is working locally as well.

run `make run-circleci-local`, this will simulate what was happening on circleci-remote, just skip the caching related parts(Restoring and Saving cache).

```sh
# See https://circleci.com/docs/2.0/local-cli/#running-a-job
circleci local execute
Docker image digest: sha256:02289762fd0a295b971e4bc6bdb2ea4326a66748cae89352b5404c4ca286aaf9
====>> Spin Up Environment
Build-agent version  ()
Docker Engine Version: 19.03.6-ce
Kernel Version: Linux b2d0228420ed 4.14.173-106.229.amzn1.x86_64 #1 SMP Wed Apr 1 19:40:12 UTC 2020 x86_64 Linux
Starting container python:3.7.3-stretch
  using image python@sha256:205cafadbb7f0c48f2a6d655eb100a9675aa85e6e73958860f488406cce09779
====>> Preparing Environment Variables
Using build environment variables:
  BASH_ENV=/tmp/.bash_env-localbuild-1589158833
  CI=true
  CIRCLECI=true
  CIRCLE_BRANCH=circleci-project-setup
  CIRCLE_BUILD_NUM=
  CIRCLE_JOB=build
  CIRCLE_NODE_INDEX=0
  CIRCLE_NODE_TOTAL=1
  CIRCLE_REPOSITORY_URL=https://github.com/isdance/dockerproj.git
  CIRCLE_SHA1=9114066a75e55d2e312db122d80a0381e545bb2e
  CIRCLE_SHELL_ENV=/tmp/.bash_env-localbuild-1589158833
  CIRCLE_WORKING_DIRECTORY=~/repo


The redacted variables listed above will be masked in run step output.====>> Checkout code
  #!/bin/bash -eo pipefail
mkdir -p /root/repo && cd /tmp/_circleci_local_build_repo && git ls-files | tar -T - -c | tar -x -C /root/repo && cp -a /tmp/_circleci_local_build_repo/.git /root/repo
====>> Restoring Cache
Error:
Skipping cache - error checking storage: not supported

Step failed
====>> install dependencies
  #!/bin/bash -eo pipefail
python3 -m venv venv
. venv/bin/activate
make install
# Install hadolint
wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 &&\
    chmod +x /bin/hadolint

# This should be run from inside a virtualenv
pip install --upgrade pip &&\
        pip install -r requirements.txt
Collecting pip
  Downloading https://files.pythonhosted.org/packages/54/2e/df11ea7e23e7e761d484ed3740285a34e38548cf2bad2bed3dd5768ec8b9/pip-20.1-py2.py3-none-any.whl (1.5MB)
    100% |████████████████████████████████| 1.5MB 12.0MB/s
Installing collected packages: pip
  Found existing installation: pip 19.0.3
    Uninstalling pip-19.0.3:
      Successfully uninstalled pip-19.0.3
Successfully installed pip-20.1
Collecting click
  Downloading click-7.1.2-py2.py3-none-any.whl (82 kB)
     |████████████████████████████████| 82 kB 1.5 MB/s
Collecting pylint
  Downloading pylint-2.5.2-py3-none-any.whl (324 kB)
     |████████████████████████████████| 324 kB 17.5 MB/s
Collecting mccabe<0.7,>=0.6
  Downloading mccabe-0.6.1-py2.py3-none-any.whl (8.6 kB)
Collecting isort<5,>=4.2.5
  Downloading isort-4.3.21-py2.py3-none-any.whl (42 kB)
     |████████████████████████████████| 42 kB 1.8 MB/s
Collecting astroid<=2.5,>=2.4.0
  Downloading astroid-2.4.1-py3-none-any.whl (214 kB)
     |████████████████████████████████| 214 kB 32.3 MB/s
Collecting toml>=0.7.1
  Downloading toml-0.10.0-py2.py3-none-any.whl (25 kB)
Collecting typed-ast<1.5,>=1.4.0; implementation_name == "cpython" and python_version < "3.8"
  Downloading typed_ast-1.4.1-cp37-cp37m-manylinux1_x86_64.whl (737 kB)
     |████████████████████████████████| 737 kB 42.0 MB/s
Collecting wrapt~=1.11
  Downloading wrapt-1.12.1.tar.gz (27 kB)
Collecting lazy-object-proxy==1.4.*
  Downloading lazy_object_proxy-1.4.3-cp37-cp37m-manylinux1_x86_64.whl (56 kB)
     |████████████████████████████████| 56 kB 5.5 MB/s
Collecting six~=1.12
  Downloading six-1.14.0-py2.py3-none-any.whl (10 kB)
Could not build wheels for wrapt, since package 'wheel' is not installed.
Installing collected packages: click, mccabe, isort, typed-ast, wrapt, lazy-object-proxy, six, astroid, toml, pylint
    Running setup.py install for wrapt ... done
Successfully installed astroid-2.4.1 click-7.1.2 isort-4.3.21 lazy-object-proxy-1.4.3 mccabe-0.6.1 pylint-2.5.2 six-1.14.0 toml-0.10.0 typed-ast-1.4.1 wrapt-1.12.1
--2020-05-11 01:00:45--  https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64
Resolving github.com (github.com)... 192.30.255.112
Connecting to github.com (github.com)|192.30.255.112|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://github-production-release-asset-2e65be.s3.amazonaws.com/46234189/497d2080-54bd-11e9-94e5-926d35bd3e53?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20200511%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20200511T010045Z&X-Amz-Expires=300&X-Amz-Signature=14d4a4a97d694741e18a80f16ce64ba4f41b1fa25cb39a38a70ad586159c7c97&X-Amz-SignedHeaders=host&actor_id=0&repo_id=46234189&response-content-disposition=attachment%3B%20filename%3Dhadolint-Linux-x86_64&response-content-type=application%2Foctet-stream [following]
--2020-05-11 01:00:45--  https://github-production-release-asset-2e65be.s3.amazonaws.com/46234189/497d2080-54bd-11e9-94e5-926d35bd3e53?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20200511%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20200511T010045Z&X-Amz-Expires=300&X-Amz-Signature=14d4a4a97d694741e18a80f16ce64ba4f41b1fa25cb39a38a70ad586159c7c97&X-Amz-SignedHeaders=host&actor_id=0&repo_id=46234189&response-content-disposition=attachment%3B%20filename%3Dhadolint-Linux-x86_64&response-content-type=application%2Foctet-stream
Resolving github-production-release-asset-2e65be.s3.amazonaws.com (github-production-release-asset-2e65be.s3.amazonaws.com)... 52.216.94.27
Connecting to github-production-release-asset-2e65be.s3.amazonaws.com (github-production-release-asset-2e65be.s3.amazonaws.com)|52.216.94.27|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 3683832 (3.5M) [application/octet-stream]
Saving to: ‘/bin/hadolint’

/bin/hadolint       100%[===================>]   3.51M  4.34MB/s    in 0.8s

2020-05-11 01:00:47 (4.34 MB/s) - ‘/bin/hadolint’ saved [3683832/3683832]

====>> Saving Cache
Error:
Skipping cache - error checking storage: not supported

Step failed
====>> run lint
  #!/bin/bash -eo pipefail
. venv/bin/activate
make lint
# See local hadolint install instructions:   https://github.com/hadolint/hadolint
# This is linter for Dockerfiles
hadolint Dockerfile
# This is a linter for Python source code linter: https://www.pylint.org/
# This should be run from inside a virtualenv
pylint --disable=R,C,W1203,W1202 app.py

------------------------------------
Your code has been rated at 10.00/10
```

#### 7. Running Dockerfiles

Using "base" images
One of the advantages of the Docker workflow for developers is the ability to use certified containers from the "official" development teams. In this diagram a developer uses the official Python base image which is developed by the core Python developers. This is accomplished by the `FROM` statement which loads in a previously created container image.

[Dockerfile](./docs/images/dockerfile-01.png)

As the developer makes changes to the `Dockerfile`, they test locally, then push the changes to a private Docker Hub repo. After this, the changes can be used by a deployment process to a Cloud or by another developer.

[docker cheat sheet](https://www.docker.com/sites/default/files/d8/2019-09/docker-cheat-sheet.pdf)

#### 8. Exercise: Deploying to Amazon ECR

**Step 01**: Create a ECR repository:
![ECR](./docs/images/ecr-01.png)

**Step 02**: Retrieve an authentication token and authenticate your Docker client to your registry.
Use the AWS CLI:

```
aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 792545305974.dkr.ecr.us-west-2.amazonaws.com

```

```
WARNING! Your password will be stored unencrypted in /home/isdance/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded

```

**Step 03**: Build your Docker image using the following command. For information on building a Docker file from scratch see the instructions here . You can skip this step if your image is already built:

```sh
docker build -t udacity .
```

**Step 04**: After the build completes, tag your image so you can push the image to this repository:

```
docker tag udacity:latest 792545305974.dkr.ecr.us-west-2.amazonaws.com/udacity:latest
```

**Step 05**: Run the following command to push this image to your newly created AWS repository:

```
docker push 792545305974.dkr.ecr.us-west-2.amazonaws.com/udacity:latest
```

#### 9. Lesson Summary

Key Terms:
Container
A container is a set of processes that are isolated from the rest of the operating system. They are often megabytes in size.

Virtual Machine
A virtual machine is the emulation of a physical operating system. They can be Gigabytes in size.

Docker Format Container
There are several formats for containers. An emerging form is Docker, which involves the definition of a Dockerfile.

pip
The pip tool installs Python packages.

pylint
The pylint tool checks the Python source code for syntax errors.

black
The black tool formats the text of Python source code automatically.

pytest
The pytest tool is a framework for running tests on Python source code.

IPython
The ipython interpreter is an interactive terminal for Python. It is the core of the Jupyter notebook.

Makefile
A Makefile is a file that contains a set of directives used to build software. Most Unix and Linux operating systems have built-in support for this file format.

CircleCI
A popular SaaS (Software as a Service) build systems used in DevOps workflows.

Docker
Docker is a company that creates container technology, including an execution engine, collaboration platform via DockerHub and a container format called Dockerfile.

Amazon ECR
Amazon ECR is a container registry that stores Docker format containers.

#### Lesson 3: Containerization of an Existing Application

#### 1. Exercise: Docker Based Apps

**Step 01**: Download git repo from [here](https://github.com/udacity/DevOps_Microservices/tree/master/Lesson-3-Containerization)

**Step 02**: Verify the Dockerfile

```Dockerfile
FROM python:3.7.3-stretch

# Working Directory
WORKDIR /app

# Copy source code to working directory
COPY . flask_app/web.py /app/

# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN pip install --upgrade pip &&\
    pip install --trusted-host pypi.python.org -r requirements.txt

# Expose port 80
EXPOSE 80

# Run app.py at container launch
CMD ["python", "web.py"]
```

**Step 03**: Create a helper alias for activate venv
Create a Cloud9 environment, we need a virtual envirment for it. here is a trick, we can create a bash shell alias for cd into the working directory, and active the venv

````
vim ~/.bashrc

# at the end of the file (use shift+g go the end), and add a line

```bash
# set alias for active venv
alias cloud="cd /home/ec2-user/environment/cloud-at-scale && source ~/.cloud-at-scale/bin/activate"
````

Now `source ~/.bashrc`. you can use `alias` to list all existing alias

```sh
ec2-user:~/environment/cloud-at-scale (master) $ alias
alias cloud='cd /home/ec2-user/environment/cloud-at-scale && source ~/.cloud-at-scale/activate'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias l.='ls -d .* --color=auto'
alias ll='ls -l --color=auto'
alias ls='ls --color=auto'
alias rvm-restart='rvm_reload_flag=1 source '\''/home/ec2-user/.rvm/scripts/rvm'\'''
alias vi='vim'
alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'

```

now if you try `cloud`, you will go into the project folder, and activate venv

**Step 04**: Create a basic Makefile

```Makefile
setup:
	python3 -m venv ~/.cloud-at-scale

install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	# python -m pytest -vv -cov=myrepolib test/*.py
	# python -m pytest -nbval notebook.ipynb

lint:
	pylint --disable=R,C app.py

all: install lint test
```

**Step 05**: Complete setup
Add a basic app.py

```py
def myfunc():
    return 1

print(myfunc())
```

And try to run `make install`, `make lint` and see if it works. If yes then push to github repo.

**Step 05**: Setup CircleCI

```sh
(.cloud-at-scale) ec2-user:~/environment/cloud-at-scale (master) $ mkdir .circleci
(.cloud-at-scale) ec2-user:~/environment/cloud-at-scale (master) $ touch .circleci/config.yml
```

```yml
# Python CircleCI 2.0 configuration file
#
# Check https://circleci.com/docs/2.0/language-python/ for more details
#
version: 2
jobs:
  build:
    docker:
      # Use the same Docker base as the project
      - image: circleci/python:3.7.3

    working_directory: ~/repo

    steps:
      - checkout

      # Download and cache dependencies
      - restore_cache:
          keys:
            - v1-dependencies-{{ checksum "requirements.txt" }}
            # fallback to using the latest cache if no exact match is found
            - v1-dependencies-

      - run:
          name: install dependencies
          command: |
            python3 -m venv venv
            . venv/bin/activate
            make install

      - save_cache:
          paths:
            - ./venv
          key: v1-dependencies-{{ checksum "requirements.txt" }}

      # run lint!
      - run:
          name: run lint
          command: |
            . venv/bin/activate
            make lint
```

Connect Github repo to CircleCI, and check the CI is working.
![circleci-remote](./docs/images/circle-ci-03.png)
