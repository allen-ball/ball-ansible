ball-ansible
============

A collection of miscellaneous [Ansible](https://www.ansible.com/) roles.

For [AWS]:

* [roles/aws-user-data](roles/aws-user-data): [AWS EC2 User Data Shell Script]
* [roles/auto.ebs](roles/auto.ebs): [automount/autofs Executable Map for Amazon EBS Volumes]

For CentOS:

* [roles/centos](roles/centos): [CentOS In-Place Upgrade]

Add to `requirements.yml`:

```yml
collections:
  - name: https://github.com/allen-ball/ball-ansible.git
    type: git
    version: trunk
```

Note: This repository is available for reference.  Please see
https://github.com/allen-ball/ball-aws-collection and related for updates.


[Ansible]: https://www.ansible.com/
[AWS]: https://aws.amazon.com/

[AWS EC2 User Data Shell Script]: https://blog.hcf.dev/article/2018-08-22-aws-user-data-script
[automount/autofs Executable Map for Amazon EBS Volumes]: https://blog.hcf.dev/article/2018-08-20-auto-ebs-map
[CentOS In-Place Upgrade]: https://blog.hcf.dev/article/2020-03-15-centos-in-place-upgrade
