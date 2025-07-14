# Librería L

This project is a university project and is **not intended for production use** without further development and security hardening. It consists of a Node.js application and a MySQL database, orchestrated using Docker Compose.

## Table of Contents

- [Project Readme](#project-readme)
  - [Table of Contents](#table-of-contents)
  - [Project Overview](#project-overview)
  - [Prerequisites](#prerequisites)
  - [Setup](#setup)
    - [1. Clone the Repository](#1-clone-the-repository)
    - [2. Configure Environment Variables](#2-configure-environment-variables)
    - [3. Database Initialization](#3-database-initialization)
  - [Building and Running with Docker Compose](#building-and-running-with-docker-compose)
  - [Accessing the Application](#accessing-the-application)
  - [Troubleshooting](#troubleshooting)

## Project Overview

This project is a web application built with Node.js (Express.js) for the backend and a MySQL database for data storage. It includes user authentication (local, GitHub, and previously Facebook, though Facebook login is currently non-functional) and features related to a "libreria" (bookstore) system. At present, only GitHub login is fully operational. Note that the Stripe payment integration is currently incomplete and will be addressed in future development.

## Prerequisites

Before you begin, ensure you have the following installed on your system:

*   **Docker:** [Install Docker](https://docs.docker.com/get-docker/)
*   **Docker Compose:** [Install Docker Compose](https://docs.docker.com/compose/install/) (usually comes with Docker Desktop)

## Setup

### 1. Clone the Repository

First, clone the project repository to your local machine:

```bash
git clone <your-repository-url>
cd Project # Or the name of your cloned directory
```

### 2. Configure Environment Variables

The `nodejs-service` requires environment variables for database connection, session secrets, and API keys.

1.  Navigate into the `nodejs-service` directory:
    ```bash
    cd nodejs-service
    ```
2.  Create a new file named `.env` in this directory:
    ```bash
    touch .env
    ```
3.  Open the `.env` file and add the following content. **Replace `your_actual_database_password` with the password for your MySQL database.** You can also customize other values if needed.

    ```env
    MYSQL_HOST=mysql-service
    MYSQL_USER=root
    MYSQL_PASSWORD=your_actual_database_password
    MYSQL_DATABASE=libreria
    MYSQL_PORT=3306
    SESSION_SECRET=a_very_secret_string_for_sessions
    STRIPE_SECRET_KEY=stripe_key
    ```
    **Important:** The `MYSQL_HOST` is set to `mysql-service` because that's the service name defined in `docker-compose.yml`, allowing the Node.js container to communicate with the MySQL container.

4.  Return to the project root directory:
    ```bash
    cd ..
    ```

### 3. Database Initialization

The MySQL service needs to be initialized with your database schema and data.

The `mysql-service/libreria.sql` file contains the necessary SQL commands to set up your database. This file will be automatically imported when the `mysql-service` container starts for the first time, as configured in `docker-compose.yml`.

## Building and Running with Docker Compose

From the root directory of your project (where `docker-compose.yml` is located), run the following command to build the Docker images and start the services:

```bash
docker compose up --build -d
```

*   `--build`: This flag forces Docker Compose to rebuild the images. Use this when you make changes to your `Dockerfile`s or project dependencies.
*   `-d`: This flag runs the services in detached mode (in the background).

To view the logs of your running services:

```bash
docker compose logs -f
```

To stop the services:

```bash
docker compose down
```

## Accessing the Application

Once the services are up and running, you can access the Node.js application in your web browser at:

```
http://localhost:4000
```

## Troubleshooting

*   **"Error: Failed to obtain access token" (GitHub/Facebook Login):**
    *   Ensure your `clientID`, `clientSecret`, and `callbackURL` in `nodejs-service/src/config.js` exactly match the settings in your GitHub/Facebook OAuth application.
    *   The `callbackURL` should typically be `http://localhost:4000/login/github/callback` for GitHub and `http://localhost:4000/login/facebook/callback` for Facebook during local development.

*   **"Ya existe una cuenta con este correo electrónico o nombre de usuario":**
    *   This message indicates that you are trying to register with an email address that already exists in the database. Please try logging in instead, or use a different email address.

*   **Database Connection Issues:**
    *   Ensure your `.env` file in `nodejs-service` is correctly configured with the `MYSQL_HOST`, `MYSQL_USER`, `MYSQL_PASSWORD`, `MYSQL_DATABASE`, and `MYSQL_PORT`.
    *   Check Docker logs for the `mysql-service` to see if the database started correctly.
    *   Verify that the `mysql-service` container is running (`docker ps`).

*   **"FATAL ERROR: SESSION_SECRET is not defined.":**
    *   Make sure you have `SESSION_SECRET=a_very_secret_string_for_sessions` (or your chosen secret) defined in your `nodejs-service/.env` file.