# User Management API

A RESTful API built with Django and Django REST Framework featuring JWT authentication and full CRUD operations for user management, connected to a PostgreSQL database.

## 🚀 Features

- **User Management**: Complete CRUD operations (Create, Read, Update, Delete) for users
- **JWT Authentication**: Secure token-based authentication using JSON Web Tokens
- **Token Refresh**: Automatic token refresh mechanism
- **PostgreSQL Database**: Robust and scalable database solution
- **Docker Support**: Easy deployment with Docker and Docker Compose
- **RESTful Design**: Follows REST API best practices

## 🛠️ Technologies

- **Backend Framework**: Django 5.2.8
- **API Framework**: Django REST Framework 3.16.1
- **Authentication**: djangorestframework-simplejwt 5.5.1
- **Database**: PostgreSQL 17.6
- **Environment Management**: python-decouple 3.8
- **CORS**: django-cors-headers 4.9.0
- **Containerization**: Docker & Docker Compose
- **Package Manager**: uv (Python package manager)

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

- Python 3.13+ (or 3.11+)
- [uv](https://github.com/astral-sh/uv) - Fast Python package installer
- PostgreSQL 17+ (or use Docker)
- Docker and Docker Compose (optional, for containerized setup)
- Git

## 🔧 Installation

### Option 1: Using Docker (Recommended)

This project includes `Dockerfile` and `docker-compose.yml` for easy containerized setup.

1. **Clone the repository**
   ```bash
   git clone https://github.com/mramirmohseni/user-management-api.git
   cd user-management-api
   ```

2. **Set up environment variables**
   ```bash
   cp .env.example .env
   ```

3. **Edit `.env` file**
   - Generate a Django SECRET_KEY:
     ```bash
     python -c "from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())"
     ```
   - Set a strong password for `POSTGRES_PASSWORD` and `DB_PASSWORD`
   - Adjust other settings as needed

4. **Build and run with Docker Compose**
   ```bash
   docker-compose up --build
   ```

   The API will be available at `http://localhost:8000`

   The `Dockerfile` builds the Django application, and `docker-compose.yml` orchestrates both the Django app and PostgreSQL database services.

### Option 2: Local Development (Without Docker)

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/user-management-api.git
   cd user-management-api
   ```

2. **Create a virtual environment using uv**
   ```bash
   uv venv --python 3.13.5
   source .venv/bin/activate
   
   # On Windows
   .venv\Scripts\activate
   ```

3. **Install dependencies**
   ```bash
   uv pip install -r requirements/development.txt
   ```

4. **Set up PostgreSQL database**
   - Create a new PostgreSQL database
   - Update database credentials in `.env` file

5. **Set up environment variables**
   ```bash
   cp .env.example .env
   ```
   Edit `.env` and configure:
   - `SECRET_KEY`: Generate using the command above
   - `DB_HOST`: Set to `localhost` (not `db`)
   - Database credentials matching your local PostgreSQL setup

6. **Run migrations**
   ```bash
   cd src
   python manage.py makemigrations
   python manage.py migrate
   ```

7. **Create a superuser** (optional)
   ```bash
   python manage.py createsuperuser
   ```

8. **Run the development server**
   ```bash
   python manage.py runserver
   ```

   The API will be available at `http://localhost:8000`

## 📁 Project Structure
