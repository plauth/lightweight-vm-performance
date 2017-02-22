Contents
========
This repository contains the installation instructions, configuration details and implementations for assessing the performance of different lightweight virtualization approaches. The range of evaluated approaches includes containerized approaches, unikernels and regular whole-system virtualization. Representing the class of containerized approaches, we consider Docker and LXD. On the side of unikernels, we investigated Rumprun, OSv and MirageOS.

To asses the influence of the virtualization approaches on application performance, we employ the Nginx HTTP server and the Redis key-value store as exemplary applications. To furthermore asses non-functional parameters such as instantiation time, we include a small custom benchmark setup called udpping.

Repository Structure
====================
The `apps` folder contains all benchmark scripts, setup instructions and configuration details for each application and virtualization approach. In `results`, we provide the results of our own measurements. The directory `unikernel` points to the repositories that host the evaluated unikernel implementations.

General Remarks
===============
Most scripts and instructions contain [placeholders] for network configuration details such as IP addresses. Please make sure to replace these placeholders with the actual values of your environment.