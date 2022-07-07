# sandbox-environment
My sandbox env to build  my ansible roles using molecules based on almalinux9 . We need to use vagrant and any virtual platform the choices are in my vagrant file
- libvirt
- virtualbox
- parallels

My base image I use is almalinux/9. The container platform I use is podman
```
vagrant up
```
If issue with podman pull or molecule create .I did not see it in libvirt but seeing it in virtualbox
```
https://www.redhat.com/sysadmin/rootless-podman
```

```
podman pull  --storage-opt overlay.ignore_chown_errors=true <imagename>
```

These are the two images I use for my ansible roles
```
 podman pull  --storage-opt overlay.ignore_chown_errors=true docker.io/sunilsankar/docker-almalinux
 podman pull  --storage-opt overlay.ignore_chown_errors=true docker.io/sunilsankar/docker-rocky8
```
