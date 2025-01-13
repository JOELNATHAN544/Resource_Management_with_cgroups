First, pull the stress-ng image:
```sh
docker pull litmuschaos/stress-ng
  ```
We create  a container that simulates heavy heavy CPU and memory usage 
```sh
docker run -it --name stress-ng-container litmuschaos/stress-ng stress-ng --cpu 4 --vm 2 --vm-bytes 1G --vm-method alloc --timeout 60s
```
This command runs the stress-ng tool inside the container, specifying heavy CPU and memory usage. Here’s a breakdown of the parameters used:

--cpu 4: Simulates stress on 4 CPU cores.
--vm 2: Runs 2 virtual memory workers.
--vm-bytes 1G: Allocates 1GB of memory per virtual memory worker.
--vm-method alloc: Uses the allocation method to stress memory.
--timeout 60s: Sets the duration of the stress test to 60 seconds.
To configure cgroups to limit CPU usage to 25% for the container, create a new cgroup and specify CPU limit
```sh
sudo cgcreate -g cpu:/litmuschaos/stress-n
```
Set CPU limits to 25% of total CPU shares
```sh
docker run -it --cpu-quota=25000 litmuschaos/stress-ng
```
Set Memory Limits to limit a container to 512MB of memory:
```sh
sudo docker run -it --memory="512m" ubuntu:latest
```
