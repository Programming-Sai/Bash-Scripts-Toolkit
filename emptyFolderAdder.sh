#!/bin/bash

find . -type d -empty -exec touch {}/.gitkeep \;
