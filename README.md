#INGInious on vagrant
[INGInious](http://www.inginious.org/) is an intelligent grader that allows secured and automated testing of code made by students.

INGInious can be installed in several linux distributions, including CentOS. Read more [here](http://inginious.readthedocs.org/en/latest/install_doc/installation.html).

If you are interested in testing INGInious, this repo provides basic configuration for installing and running the INGInious webapp on Centos 7.2.

### Getting started
It is assumed that you have a working installation of [Virtual Box](https://www.virtualbox.org/) and [Vagrant](https://www.vagrantup.com/).

Clone the repo and run `vagrant up`. Your CentOS machine will be provisioned with the minimal software requirements to run INGInious using the webapp.
This step will install INGInious, and its dependencies into the guest machine.

After the process completes, ssh into the by running `vagrant ssh`.

Now you need to install and configure the INGInious webapp. Run `inginious-install webapp` and follow the instructions. You can read more [here](http://inginious.readthedocs.org/en/latest/install_doc/installation.html#configuring-and-starting-inginious).

Optionally if you want to test the LTI frontend, run `inginious-install lti` and follow the instructions. You can read more [here](http://inginious.readthedocs.org/en/latest/install_doc/installation.html#configuring-and-starting-inginious).

After completing the installation, a `configuration.lti.yaml` file is create in your home directory. We will edit this file and under `lti` we will add the Tool Consumer key and a shared secret.
```
lti:
    canvas:
        secret: af572433-f88f-4994-84ef-033ea2cf4897
```

### Running the webapp
On your guest run: `inginious-webapp --host 192.168.34.34 --port 8080`

Go to your browser and visit `http://192.168.34.34:8080/`.

### Running the LTI
On your guest run: `inginious-lti --host 192.168.34.34 --port 8081`

Note that we are running the LTI under a different port `8081`.
#### Integrating the LTI frontend with Canvas LMS
Go to course settings, and add a new external app.

Choose a name, add the consumer key `canvas` and the shared secret `af572433-f88f-4994-84ef-033ea2cf4897`.

Input the *Launch URL* of the helloworld task: `http://192.168.34.34:8081/launch/test/helloworld`. This will correspond to the helloworld task specified in the tasks folder under your home directory. 

Edit the task.yaml file and change the `accessible` field to a date in the future.

As a canvas teacher, create an assignment and link it with the external tool you created in the previous step.

Finally log in to Canvas as a student and test the assignment.

### TODO:
this nead more work
Enjoy!
