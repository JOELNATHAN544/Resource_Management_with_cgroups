#!/bin/bash

sudo apt install stress

stress --cpu 1 --io 1 --vm 1 --vm-bytes 128M --timeout 30s --verbose



