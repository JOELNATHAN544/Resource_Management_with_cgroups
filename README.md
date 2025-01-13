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
docker run -it --memory="512m" litmuschaos/stress-ng
```
Now go to your terminal and create another tab on the left top side of the terminal.
Thia tabs will bw to run the script and the test to evaaluate the resource consumption.

On the first tab, source the script.sh file to run the resource intensive script.
```sh
source script.sh
```
Withhout wastage of time, on the second tab, source the test.sh file to monitor resource consumption.
```sh
source test.sh
```
The performance is logged into a file.log file and we can use the cat command to cat the contents of the log file.
```sh
cat file.logg
```
