# Quick Start Guide

Get OCR Bank up and running in minutes!

## 🚀 Quick Setup (Recommended)

Use our automated setup script:

```bash
# Clone the repository
git clone https://github.com/yourusername/ocr-bank.git
cd ocr-bank

# Run the setup script
./setup.sh
```

The script will handle everything for you:
- ✅ Check prerequisites
- ✅ Set up Python environment
- ✅ Install all dependencies
- ✅ Configure database
- ✅ Create environment files

## 📋 Manual Setup

### 1. Prerequisites

Ensure you have:
- Python 3.10+
- Node.js 18+
- Docker & Docker Compose

### 2. Backend Setup

```bash
cd backend

# Create virtual environment
python -m venv venv
source venv/bin/activate  # Windows: venv\\Scripts\\activate

# Install dependencies
pip install -r requirements.txt

# Configure environment
cp .env.example .env
# Edit .env with your API keys

# Start database
docker compose up -d

# Run migrations
alembic upgrade head

# Start server
uvicorn app.main:app --reload
```

### 3. Frontend Setup

```bash
cd frontend

# Install dependencies
npm install

# Configure environment
cp .env.example .env

# Start server
npm run dev
```

## 🎯 First Steps After Installation

1. **Get API Keys**
   - Gemini API: https://ai.google.dev/
   - (Optional) Google Sheets: https://console.cloud.google.com/

2. **Configure Environment**
   Edit `backend/.env`:
   ```bash
   GEMINI_API_KEY=your_actual_api_key_here
   ```

3. **Start Using**
   - Frontend: http://localhost:5173
   - API Docs: http://localhost:8000/docs

## 🧪 Testing Your Setup

### Test Backend
```bash
cd backend
pytest
```

### Test Frontend
```bash
cd frontend
npm run lint
```

## 🐛 Common Issues

### Port Already in Use
```bash
# Find process using port 8000
lsof -i :8000
# Kill it
kill -9 <PID>
```

### Database Connection Error
```bash
# Restart PostgreSQL
docker compose restart postgres
```

### Import Errors
```bash
# Reinstall dependencies
pip install -r requirements.txt --force-reinstall
```

## 📚 Next Steps

- Read the full [README.md](../README.md)
- Check [API Documentation](http://localhost:8000/docs)
- Explore the codebase

## 💡 Tips

1. Keep your `.env` files private - never commit them
2. Use different API keys for development and production
3. Regularly update dependencies: `pip install -r requirements.txt --upgrade`
4. Check logs in `backend/logs/` if something goes wrong

## 🆘 Need Help?

- Check [README.md](../README.md) for detailed documentation
- Open an issue on GitHub
- Contact: your.email@example.com
