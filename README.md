# Bash-Scripts-Toolkit

A collection of Bash scripts designed to automate and simplify common tasks for system management, development workflows, and other automation needs. These scripts are reusable and ideal for saving time and improving productivity when working on projects.

---

## Features

- Automate repetitive tasks with ease.
- Simplify Git workflows and project management.
- Manage Python dependencies and deployments.
- Customizable and reusable for various use cases.

---

## Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/Programming-Sai/Bash-Scripts-Toolkit.git
   cd Bash-Scripts-Toolkit
   ```

2. **Make scripts executable:**

   ```bash
   chmod +x *.sh
   ```

---

## How to Use the Scripts

Each script is designed for a specific task. Below is a detailed description of each script:

### **1. Remove Folder from Git and Add to `.gitignore`**

- **File Name:** `removeFileFromGitRemotelyOnly.sh`
- **Description:**
  This script removes a folder from Git tracking, optionally adds it to `.gitignore`, and pushes the changes to the remote repository.
- **Usage:**
  ```bash
  ./removeFileFromGitRemotelyOnly.sh <folder_name> [-g]
  ```
  - `<folder_name>`: Name of the folder to remove.
  - `-g`: Optional flag to add the folder to `.gitignore`.

---

### **2. Git Add, Commit, Push, Build, and Deploy**

- **File Name:** `ghPagesDeploy.sh`
- **Description:**
  Automates Git commit and push operations along with building and deploying a project (e.g., an npm-based project).
- **Usage:**

  ```bash
  ./ghPagesDeploy.sh "<commit_message>" "<deploy_message>"
  ```

  - If no arguments are provided, defaults to "Made some modifications" for the Git commit message.

> [!NOTE] 
> In your `package.json` file, in the `scripts` section, it must look something like this.

  ```json
        "scripts": {
            "dev": "<dev-command>",
            "build": "<build-command>",
            "preview": "<preview-command>",
            "predeploy": "npm run build",
            "deploy": "gh-pages -d <output-folder> -b <branch-name> -m \"${npm_config_message:-Updates}\""
        },
  ```

  > also, you must have `gh-pages` installed as a devDependency, like this:

  ```bash
    npm install gh-pages --save-dev
  ```

---

### **3. Install Python Dependencies and Update `requirements.txt`**

- **File Name:** `pipInstall.sh`
- **Description:**
  Installs the specified Python packages, updates `requirements.txt`, and ensures the project dependencies are tracked.
- **Usage:**
  ```bash
  ./pipInstall.sh <package_name> [other_packages]
  ```
  - If no package names are provided, prompts the user to supply them.

---

### **4. Simple Git Commit and Push**

- **File Name:** `gitAll.sh`
- **Description:**
  Adds all changes, commits with a specified message, and pushes to the remote repository.
- **Usage:**
  ```bash
  ./gitAll.sh "<commit_message>"
  ```
  - Prompts for a commit message if not provided.

---

Here's how you can format the new section for your tool using the provided format:

---

### **5. Git Project Setup Tool**

- **File Name:** `gitProjectSetup.sh`
- **Description:**
  Clones a GitHub repository into a specified directory (or default to `~/Desktop`), opens it in Visual Studio Code, and handles directory creation if it doesn't exist. Includes error handling for invalid URLs and cloning failures.
- **Usage:**

  ```bash
  ./gitProjectSetup.sh <repository_url> [<directory>]
  ```

  - `<repository_url>`: The GitHub repository URL to clone.
  - `<directory>` (Optional): The target directory for the clone. If not provided, defaults to `~/Desktop`.

- **Example:**
  1. Clone to the default directory (Desktop):
     ```bash
     ./gitProjectSetup.sh https://github.com/<your-user-name>/<repo-name>.git
     ```
  2. Clone to a custom directory:
     ```bash
     ./gitProjectSetup.sh https://github.com/<your-user-name>/<repo-name>.git ~/Projects
     ```
  3. Clone to a non-existing directory (the directory will be created automatically):
     ```bash
     ./gitProjectSetup.sh https://github.com/<your-user-name>/<repo-name>.git ~/NonExistentFolder
     ```

---

### **6. Create and Activate Python Virtual Environments**

- **File Name:** `pythonVenv.sh`
- **Description:**
  Creates a Python virtual environment in the specified directory or defaults to `.venv` if no directory is provided. The script also outputs instructions for activating the virtual environment manually since activation cannot persist across script executions.
- **Usage:**

  ```bash
  source ./pythonVenv.sh <directory_name>
  ```

  - If `<directory_name>` is not provided, the virtual environment will be created in `.venv`.

---

## Why These Scripts Exist

1. **Efficiency:**
   Save time by automating repetitive tasks, especially in development workflows.
2. **Reusability:**
   Easily adapt and reuse the scripts in new projects without recreating them.
3. **Consistency:**
   Enforce consistent practices across projects and avoid human errors in critical operations.

---

## Adding New Scripts

If you write additional scripts, place them in the repository and update the README with:

- **File Name**
- **Description**
- **Usage Instructions**

---

## Contributions

Feel free to fork, modify, and contribute improvements! Open a pull request with detailed descriptions of your changes.

---
