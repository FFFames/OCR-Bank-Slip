# OCR Bank

<!-- PROJECT SHIELDS -->
[![Python Version][python-image]][python-url]
[![Node Version][node-image]][node-url]
[![License: MIT][license-image]][license-url]

A full-stack web application for automated mobile bank receipt processing using OCR technology. Built with Thai language support, it features intelligent text extraction, a review interface, database storage, Google Sheets integration, and a RAG-powered AI chatbot for querying receipt data.

## 🚀 Features

- **📷 Smart OCR Processing** - Extract text from Thai bank receipts using Tesseract OCR with multi-language support
- **✍️ Review Interface** - User-friendly interface to view, edit, and validate OCR results before saving
- **📦 Batch Upload** - Process multiple receipts simultaneously for efficient workflow
- **💾 Persistent Storage** - Store receipts in PostgreSQL with full CRUD operations
- **📊 Google Sheets Export** - Seamlessly export receipt data to Google Sheets for further analysis
- **🤖 RAG Chatbot** - AI-powered chatbot using semantic search to query your receipt data naturally
- **📈 Analytics Dashboard** - Visualize spending patterns and financial insights with interactive charts

## 🏗️ Tech Stack

### Backend
- **Framework**: FastAPI - Modern, fast Python web framework
- **Database**: PostgreSQL with SQLAlchemy ORM
- **Migrations**: Alembic for database version control
- **OCR**: Tesseract OCR (Thai language optimized)
- **Vector Store**: ChromaDB for semantic search
- **LLM**: Google Generative AI (Gemini) / Groq / Local LM Studio support
- **Integration**: Google Sheets API

### Frontend
- **Framework**: React 18 with TypeScript
- **Build Tool**: Vite for lightning-fast development
- **Routing**: React Router v6
- **HTTP Client**: Axios for API communication
- **State Management**: React Query for server state
- **Styling**: Tailwind CSS for modern UI
- **Forms**: React Hook Form with Zod validation
- **Charts**: Recharts for data visualization
- **Icons**: Lucide React

## 📸 Screenshots

<!-- Add screenshots here when available -->
<img width="1496" height="825" alt="image" src="https://github.com/user-attachments/assets/34488525-230a-481b-ac17-12d39ce1bc7a" />
<img width="1478" height="826" alt="image" src="https://github.com/user-attachments/assets/d93a5dbc-3d14-4afe-9d98-4a83c8fd2e3a" />
<img width="2560" height="1486" alt="85EF8493-7126-43B3-A5CF-9B5E654D08B1_1_201_a" src="https://github.com/user-attachments/assets/ccf2c4ea-cbd4-48e2-be45-624a7278b11f" />
<img width="1494" height="601" alt="image" src="https://github.com/user-attachments/assets/ff3544f4-895c-412c-a8a5-edf62c690bbd" />
<img width="1270" height="619" alt="image" src="https://github.com/user-attachments/assets/d774bd4b-054c-4bbf-babf-4f181bd31440" />
<img width="1491" height="756" alt="image" src="https://github.com/user-attachments/assets/6382447d-a54a-48e3-95e2-24d0f78c3586" />
<img width="1303" height="806" alt="image" src="https://github.com/user-attachments/assets/39e34354-93ea-43bb-a085-593f5e5ef0bf" />


## 🛠️ Installation

### Prerequisites

Ensure you have the following installed:
- **Python 3.10+** - [Download here](https://www.python.org/downloads/)
- **Node.js 18+** - [Download here](https://nodejs.org/)
- **Docker & Docker Compose** - [Download here](https://www.docker.com/get-started/)
- **Git** - [Download here](https://git-scm.com/downloads)

### Quick Start with Setup Script

We've provided a convenient setup script to get you started quickly:

```bash
# Clone the repository
git clone https://github.com/yourusername/ocr-bank.git
cd ocr-bank

# Run the setup script
./setup.sh
```

The setup script will:
1. Check for prerequisites
2. Set up Python virtual environment
3. Install backend dependencies
4. Install frontend dependencies
5. Create environment files from templates
6. Start PostgreSQL with Docker
7. Run database migrations
8. Launch both backend and frontend servers

### Manual Installation

If you prefer manual setup or the script doesn't work:

#### 1. Backend Setup

```bash
cd backend

# Create virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\\Scripts\\activate

# Install dependencies
pip install -r requirements.txt

# Configure environment
cp .env.example .env
# Edit .env with your configuration

# Start PostgreSQL
docker compose up -d

# Run database migrations
alembic upgrade head

# Start the backend server
uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
```

The API will be available at:
- **API**: `http://localhost:8000`
- **Swagger UI**: `http://localhost:8000/docs`
- **ReDoc**: `http://localhost:8000/redoc`

#### 2. Frontend Setup

```bash
cd frontend

# Install dependencies
npm install

# Configure environment
cp .env.example .env
# The default configuration works for local development

# Start development server
npm run dev
```

The application will be available at `http://localhost:5173`

## ⚙️ Configuration

### 📝 Getting API Keys

Before configuring, you'll need to get API keys:

#### Gemini API Key (Required for AI features)
1. Go to [Google AI Studio](https://makersuite.google.com/app/apikey)
2. Sign in with your Google account
3. Click "Create API Key"
4. Copy your API key

#### Groq API Key (Alternative LLM provider)
1. Go to [Groq Console](https://console.groq.com/keys)
2. Sign up or log in
3. Create a new API key
4. Copy your API key

#### Google Sheets (Optional)
1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Create a new project
3. Enable Google Sheets API
4. Create credentials (OAuth 2.0 client ID)
5. Download the credentials JSON file

### Backend Environment Variables

Create a `.env` file in the `backend` directory by copying the example:

```bash
cd backend
cp .env.example .env
```

Then edit `.env` with your values:

```bash
# ============================================
# REQUIRED SETTINGS
# ============================================

# Database - PostgreSQL connection (Docker handles this)
DATABASE_URL=postgresql://ocr_bank_user:ocr_bank_password@localhost:5432/ocr_bank

# LLM API Key - Get from https://makersuite.google.com/app/apikey
GEMINI_API_KEY=your_actual_gemini_api_key_here

# LLM Provider - Options: gemini, groq, local
LLM_PROVIDER=gemini

# ============================================
# OPTIONAL SETTINGS
# ============================================

# OCR Configuration
OCR_LANGUAGE=th              # Language: th (Thai), en (English)
OCR_DEVICE=cpu              # Device: cpu or gpu (requires CUDA)

# Alternative LLM - Groq
# GROQ_API_KEY=your_groq_api_key_here

# Local LLM - LM Studio or compatible
# LOCAL_LLM_URL=http://localhost:1234/v1

# Vector Store - For RAG/Chatbot
CHROMADB_PERSIST_DIRECTORY=./data/chromadb

# Google Sheets Integration (Optional)
# GOOGLE_SHEETS_CREDENTIALS_PATH=./config/credentials.json
# GOOGLE_SHEETS_SPREADSHEET_ID=your_spreadsheet_id_here

# File Storage
IMAGE_STORAGE_PATH=./images
MAX_UPLOAD_SIZE=10485760     # 10MB in bytes
```

**Quick Start Minimum:**
- For basic OCR functionality, you just need: `GEMINI_API_KEY`
- Everything else can use defaults

### Frontend Environment Variables

Create a `.env` file in the `frontend` directory:

```bash
cd frontend
cp .env.example .env
```

The default values work for local development:
```bash
VITE_API_BASE_URL=http://localhost:8000/api
```

**Production:** Change to your deployed backend URL:
```bash
VITE_API_BASE_URL=https://your-backend-url.com/api
```

### .env File Security

⚠️ **IMPORTANT:** Never commit `.env` files to git!

The `.gitignore` is configured to exclude:
- `.env` files
- `backend/config/credentials.json`
- Any API keys or secrets

**Best practices:**
- Use different API keys for development and production
- Rotate keys regularly
- Never share `.env` files
- Use environment-specific files like `.env.production`

## 📖 API Documentation

### Upload & OCR

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/upload/` | POST | Upload receipt images (batch) |
| `/api/upload/process-ocr/{id}` | POST | Re-process OCR for a receipt |

### Receipts

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/receipts/` | GET | List receipts (with filters) |
| `/api/receipts/{id}` | GET | Get receipt details |
| `/api/receipts/{id}` | PUT | Update receipt |
| `/api/receipts/{id}/confirm` | POST | Mark as confirmed |
| `/api/receipts/{id}` | DELETE | Delete receipt |
| `/api/receipts/stats/overview` | GET | Get statistics |

### Chatbot (RAG)

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/chat/query` | POST | Query receipts using AI |

For detailed API documentation with request/response schemas, visit the Swagger UI at `http://localhost:8000/docs` when the backend is running.

## 🏁 Project Structure

```
ocr-bank/
├── backend/
│   ├── app/
│   │   ├── main.py                 # FastAPI application entry point
│   │   ├── config.py               # Application configuration
│   │   ├── api/                    # API route handlers
│   │   │   ├── upload.py           # File upload endpoints
│   │   │   ├── receipts.py         # Receipt CRUD operations
│   │   │   ├── chat.py             # RAG chatbot endpoints
│   │   │   ├── export.py           # Google Sheets export
│   │   │   └── ...
│   │   ├── models/                 # SQLAlchemy database models
│   │   ├── schemas/                # Pydantic validation schemas
│   │   ├── services/               # Business logic layer
│   │   │   ├── ocr_service.py      # Tesseract OCR wrapper
│   │   │   ├── rag_service.py      # RAG implementation
│   │   │   └── export_service.py   # Google Sheets integration
│   │   └── database/               # Database configuration
│   ├── requirements.txt            # Python dependencies
│   ├── alembic.ini                 # Database migration config
│   └── docker-compose.yml          # PostgreSQL container
├── frontend/
│   ├── src/
│   │   ├── pages/                  # Page components
│   │   ├── components/             # Reusable UI components
│   │   ├── services/               # API service layer
│   │   ├── types/                  # TypeScript type definitions
│   │   └── utils/                  # Utility functions
│   ├── package.json                # Node dependencies
│   └── vite.config.ts             # Vite configuration
├── docs/                           # Additional documentation
├── .gitignore                      # Git ignore rules
├── docker-compose.yml              # Development services
├── setup.sh                        # Quick setup script
└── README.md                       # This file
```

## 🧪 Development

### Running Tests

**Backend:**
```bash
cd backend
pytest
```

**Frontend:**
```bash
cd frontend
npm run lint
```

### Database Migrations

**Create a new migration:**
```bash
cd backend
alembic revision --autogenerate -m "description"
```

**Apply migrations:**
```bash
alembic upgrade head
```

**Rollback migration:**
```bash
alembic downgrade -1
```

### Adding New OCR Templates

OCR templates are defined in YAML format in `backend/app/templates/`. To add support for a new bank:

1. Create a new YAML file following the template structure
2. Define detection zones for key fields (amount, date, sender, receiver)
3. Add the template configuration
4. Test with sample receipts

## 🔧 Troubleshooting

### PostgreSQL Connection Issues

```bash
# Check if PostgreSQL container is running
docker compose ps

# Restart PostgreSQL
docker compose restart postgres

# View logs
docker compose logs postgres
```

### PaddleOCR Issues

```bash
# Tesseract OCR downloads models on first run
# Make sure you have internet connection
# Models are cached in ~/.PaddleOCR/

# For GPU support, install CUDA and set OCR_DEVICE=gpu in .env
```

### Frontend Build Issues

```bash
# Clear node_modules and reinstall
rm -rf node_modules package-lock.json
npm install
```

### Port Already in Use

```bash
# Find process using port 8000
lsof -i :8000
# Kill the process
kill -9 <PID>
```


## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

See [CONTRIBUTING.md](CONTRIBUTING.md) for more details.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Shalom Inchoi**


<!-- BADGE LINKS -->

[python-image]: https://img.shields.io/badge/python-3.10+-blue.svg
[python-url]: https://www.python.org/downloads/
[node-image]: https://img.shields.io/badge/node-18+-green.svg
[node-url]: https://nodejs.org/
[license-image]: https://img.shields.io/badge/license-MIT-purple.svg
[license-url]: LICENSE
