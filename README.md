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

### Running the webapp
On your guest run: `inginious-webapp --host 192.168.34.34`

Go to your browser and visit `http://192.168.34.34:8080/`.

Enjoy!
