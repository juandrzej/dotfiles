#!/bin/bash

sudo systemctl enable ufw
sudo systemctl start ufw

sudo ufw default deny incoming
sudo ufw default allow outgoing

sudo ufw enable
