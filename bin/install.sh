#!/bin/bash

echo "Service is initializing..." 

echo "export PS1='[\u@\h:\W]$ '" > ~/.bashrc
echo "export CLICOLOR=1" >> ~/.bashrc

echo "Service was initialized!"