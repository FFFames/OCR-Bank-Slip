# Contributing to OCR Bank

Thank you for your interest in contributing to OCR Bank! This document provides guidelines and instructions for contributing to the project.

## 🌟 How to Contribute

We welcome contributions of all kinds, including:
- Bug fixes
- New features
- Documentation improvements
- Performance optimizations
- Test coverage

## 🚀 Getting Started

### Prerequisites

Before contributing, make sure you have:
- Forked the repository
- Read the [README.md](README.md) for project overview
- Set up your local development environment

### Setting Up Development Environment

1. **Fork and clone the repository:**
   ```bash
   git clone https://github.com/yourusername/ocr-bank.git
   cd ocr-bank
   ```

2. **Install dependencies:**
   ```bash
   # Backend
   cd backend
   python -m venv venv
   source venv/bin/activate  # Windows: venv\\Scripts\\activate
   pip install -r requirements.txt

   # Frontend
   cd ../frontend
   npm install
   ```

3. **Set up environment files:**
   ```bash
   # Backend
   cp backend/.env.example backend/.env

   # Frontend
   cp frontend/.env.example frontend/.env
   ```

4. **Start development servers:**
   ```bash
   # Terminal 1 - Backend
   cd backend
   uvicorn app.main:app --reload

   # Terminal 2 - Frontend
   cd frontend
   npm run dev
   ```

## 📋 Development Workflow

### 1. Create a Branch

Create a new branch for your feature or bugfix:

```bash
git checkout -b feature/your-feature-name
# or
git checkout -b fix/your-bugfix-name
```

**Branch Naming Conventions:**
- `feature/` - New features
- `fix/` - Bug fixes
- `docs/` - Documentation changes
- `refactor/` - Code refactoring
- `test/` - Adding or updating tests
- `perf/` - Performance improvements

### 2. Make Changes

- Follow the existing code style and structure
- Add tests for new functionality
- Update documentation as needed
- Commit changes with clear messages

**Commit Message Format:**
```
type(scope): brief description

Detailed description (optional)
```

Examples:
- `feat(upload): add drag and drop functionality`
- `fix(ocr): correct Thai language detection`
- `docs(readme): update installation instructions`

### 3. Run Tests

Before submitting, make sure all tests pass:

```bash
# Backend tests
cd backend
pytest

# Frontend linting
cd frontend
npm run lint
```

### 4. Submit Pull Request

1. Push your branch to GitHub:
   ```bash
   git push origin feature/your-feature-name
   ```

2. Open a Pull Request on GitHub with:
   - Clear title describing the change
   - Detailed description of what you did
   - Reference to related issues
   - Screenshots for UI changes (if applicable)

## 🎨 Code Style Guidelines

### Python (Backend)

- Follow [PEP 8](https://pep8.org/) style guide
- Use meaningful variable and function names
- Add docstrings to functions and classes
- Keep functions focused and modular
- Use type hints where appropriate

### TypeScript/React (Frontend)

- Follow [Airbnb React/JSX Style Guide](https://github.com/airbnb/javascript/tree/master/react)
- Use functional components with hooks
- Keep components small and focused
- Use TypeScript for type safety
- Follow naming conventions:
  - Components: PascalCase (`ReceiptCard.tsx`)
  - Utilities: camelCase (`formatDate.ts`)

## 🧪 Testing

### Backend Testing

Add tests for new functionality in `backend/tests/`:

```python
def test_new_feature():
    # Arrange
    input_data = {...}

    # Act
    result = process_data(input_data)

    # Assert
    assert result.expected_value == expected_result
```

### Frontend Testing

Test UI components thoroughly:
- Test user interactions
- Verify form validations
- Check API integration

## 📝 Documentation

- Keep documentation in sync with code changes
- Update README.md for new features
- Add docstrings to Python functions
- Comment complex logic
- Update API documentation for new endpoints

## 🐛 Bug Reports

When reporting bugs, include:
1. Clear description of the issue
2. Steps to reproduce
3. Expected vs actual behavior
4. Environment details (OS, Python/Node versions)
5. Screenshots if applicable
6. Relevant code snippets

## ✅ Pull Request Checklist

Before submitting your PR, ensure:

- [ ] Tests pass locally
- [ ] Code follows style guidelines
- [ ] Documentation is updated
- [ ] Commit messages are clear
- [ ] PR description is detailed
- [ ] No merge conflicts

## 🤝 Code of Conduct

- Be respectful and constructive
- Welcome new contributors
- Focus on what is best for the community
- Show empathy towards other community members

## 💡 Feature Requests

For new features:
1. Check existing issues first
2. Create a detailed proposal
3. Explain the use case
4. Suggest implementation approach
5. Be open to feedback

## 📧 Getting Help

- Open an issue for bugs or questions
- Check existing documentation
- Join discussions in issues
- Contact maintainers directly for complex issues

Thank you for contributing to OCR Bank! 🎉
