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
