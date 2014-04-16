Yum71
=====

REST interface to query for available version of packages

* useful to check if yum has packages in versions which you want to pin your installation to. 

* Verify that build has reached yum and is available for installation. 

Run it
------

It's a Rack up, so after cloning the repo
```
      bundle
      rackup
```
will get you a server


Use it
------


It requires 2 params 
* *repo* - the URL for the repository, currently will support only http repos - its a opinionated restriction, you can use local file system ones, look through commit history for the file to see how
* *name* - is the name of the package you are looking to


Example usege :
```
       curl "http://yum71.herokuapp.com/jenkins/package_versions.json?name=ruby&repo=http://public-yum.oracle.com/repo/EnterpriseLinux/EL4/6/base/x86_64/"
```


