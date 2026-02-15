# Assignment-02: Command-Line & Rails CLI Proficiency

## Overview

This project is part of the **ILA Rails and React Engineering Certification – Level 1**.  
It focuses on building confidence with the command line, Rails CLI, and safe automation through scripts that validate the development environment and clean temporary artifacts.

---

## Goals

- Use the command line confidently for Rails development  
- Automate common development checks  
- Safely clean temporary artifacts without risking data loss  
- Document real commands used during development  

---

## Prerequisites

Ensure the following tools are installed:

- Ruby (3.x recommended)
- Rails (8.x recommended)
- Bundler
- SQLite (default Rails database)

Verify installations using:

```bash
ruby -v
rails -v
bundle -v
```


## Project Setup

Step 1: Create Assignment Directory
```bash
mkdir assignment-2
cd assignment-2
```

Step 2: Create a Minimal Rails Application

A minimal Rails app is created to avoid unnecessary files.
```bash
rails new app --skip-javascript --skip-hotwire --skip-test
cd app
```
Step 3: Setup Database
```bash
rails db:create
rails db:migrate
```
Step 4: Run Rails Server
```bash
rails s
```

The application will be available at:
```bash
http://localhost:3000
```

Project Structure
assignment-2/
├── app/
│   ├── log/
│   ├── tmp/
│   └── ...
├── scripts/
│   ├── dev-status.sh
│   └── clean-safe.sh
└── docs/
    └── assignment-02.md



## Scripts Overview:

Two scripts automate common development tasks:

- dev-status.sh — Development environment health checks

- clean-safe.sh — Safe cleanup of temporary artifacts

 1) scripts/dev-status.sh — Development Status Script

Performs read-only checks to verify that the local development environment is healthy.

What It Verifies?

- Ruby installation

- Rails installation

- Database connectivity

- Rails environment bootability

How to Run?
```bash
scripts/dev-status.sh
```
2) scripts/clean-safe.sh — Safe Cleanup Script
   
Safely removes temporary artifacts without touching:

- Databases

- Credentials

- Migrations

- Source code

What It Cleans
```bash
app/tmp/*
app/log/*.log
```
How to Run?
```bash
scripts/clean-safe.sh
```


When Is Cleanup Needed?

After running the Rails application, Rails generates temporary files such as:
```bash
app/tmp/cache
app/tmp/pids
app/log/development.log
```

These files are safe to remove using clean-safe.sh.


### Documentation

All command-line commands used in this project are documented in:

docs/assignment-02.md


