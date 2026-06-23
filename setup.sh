#!/bin/bash

# ============================================
# OCR Bank - Quick Setup Script
# ============================================
# This script automates the setup process for OCR Bank

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Helper functions
print_header() {
    echo -e "\n${BLUE}============================================${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}============================================${NC}\n"
}

print_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

print_error() {
    echo -e "${RED}✗ $1${NC}"
}

print_info() {
    echo -e "${YELLOW}ℹ $1${NC}"
}

# Check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Main setup process
main() {
    print_header "OCR Bank - Setup Script"

    # Check prerequisites
    print_header "Checking Prerequisites"

    if command_exists python3; then
        PYTHON_VERSION=$(python3 --version | cut -d' ' -f2 | cut -d'.' -f1,2)
        print_success "Python $PYTHON_VERSION found"
        if (( $(echo "$PYTHON_VERSION < 3.10" | bc -l) )); then
            print_error "Python 3.10 or higher is required"
            exit 1
        fi
    else
        print_error "Python 3 not found. Please install Python 3.10 or higher"
        exit 1
    fi

    if command_exists node; then
        NODE_VERSION=$(node --version | cut -d'v' -f2 | cut -d'.' -f1)
        print_success "Node.js $(node --version) found"
        if (( NODE_VERSION < 18 )); then
            print_error "Node.js 18 or higher is required"
            exit 1
        fi
    else
        print_error "Node.js not found. Please install Node.js 18 or higher"
        exit 1
    fi

    if command_exists docker; then
        print_success "Docker found"
    else
        print_error "Docker not found. Please install Docker"
        exit 1
    fi

    if command_exists docker-compose; then
        print_success "Docker Compose found"
    else
        print_error "Docker Compose not found. Please install Docker Compose"
        exit 1
    fi

    # Backend setup
    print_header "Setting Up Backend"

    cd backend

    # Create virtual environment
    if [ ! -d "venv" ]; then
        print_info "Creating Python virtual environment..."
        python3 -m venv venv
        print_success "Virtual environment created"
    else
        print_success "Virtual environment already exists"
    fi

    # Activate virtual environment
    print_info "Activating virtual environment..."
    source venv/bin/activate

    # Install dependencies
    print_info "Installing Python dependencies..."
    pip install --upgrade pip
    pip install -r requirements.txt
    print_success "Python dependencies installed"

    # Create .env file if it doesn't exist
    if [ ! -f ".env" ]; then
        print_info "Creating .env file from .env.example..."
        cp .env.example .env
        print_success "Created .env file"
        print_info "Please edit backend/.env with your configuration"
    else
        print_success ".env file already exists"
    fi

    # Start PostgreSQL
    print_info "Starting PostgreSQL with Docker..."
    docker compose up -d
    print_success "PostgreSQL started"

    # Wait for PostgreSQL to be ready
    print_info "Waiting for PostgreSQL to be ready..."
    sleep 5

    # Run migrations
    print_info "Running database migrations..."
    alembic upgrade head
    print_success "Database migrations completed"

    cd ..

    # Frontend setup
    print_header "Setting Up Frontend"

    cd frontend

    # Install dependencies
    print_info "Installing Node.js dependencies..."
    npm install
    print_success "Node.js dependencies installed"

    # Create .env file if it doesn't exist
    if [ ! -f ".env" ]; then
        print_info "Creating .env file from .env.example..."
        cp .env.example .env
        print_success "Created .env file"
    else
        print_success ".env file already exists"
    fi

    cd ..

    # Final instructions
    print_header "Setup Complete!"

    print_success "OCR Bank has been set up successfully!"
    echo ""
    print_info "To start the application:"
    echo ""
    echo "  Backend:"
    echo "    cd backend"
    echo "    source venv/bin/activate"
    echo "    uvicorn app.main:app --reload"
    echo ""
    echo "  Frontend (in a new terminal):"
    echo "    cd frontend"
    echo "    npm run dev"
    echo ""
    print_info "Backend will be available at: http://localhost:8000"
    print_info "Frontend will be available at: http://localhost:5173"
    print_info "API Documentation: http://localhost:8000/docs"
    echo ""
    print_info "Before running, make sure to configure your .env files with:"
    echo "  - GEMINI_API_KEY (for LLM features)"
    echo "  - GOOGLE_SHEETS_CREDENTIALS_PATH (for Google Sheets export, optional)"
    echo ""
}

# Run main function
main
