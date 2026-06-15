# Deployment Guide: ERP-Based Integrated Student System

This project is configured for a **Unified Deployment** on Render. A single FastAPI service serves both the Backend API and the Frontend static files.

## Prerequisites

- A [Render](https://render.com) account.
- Access to your Supabase/InsForge project for database credentials.
- (Optional) Razorpay account for payments.

## Deployment Steps

1.  **Connect GitHub Repository**:
    - Log in to Render and click **"New +"** -> **"Blueprint"**.
    - Connect your GitHub repository: `mahakdiwakar/ERP-Based-Integrated-Student-System`.
    - Render will automatically detect the `render.yaml` file.

2.  **Configure Environment Variables**:
    During the Blueprint setup (or under the "Environment" tab of the created Web Service), add the following:

    | Variable | Description |
    | :--- | :--- |
    | `INSFORGE_URL` | Your Supabase/InsForge Project URL. |
    | `INSFORGE_API_KEY` | Your Supabase/InsForge Service Role or Anon Key. |
    | `RAZORPAY_KEY_ID` | (Optional) Razorpay Key ID for payments. |
    | `RAZORPAY_KEY_SECRET` | (Optional) Razorpay Secret Key for payments. |
    | `PYTHON_VERSION` | Set to `3.11.0` (included in `render.yaml`). |

3.  **Deploy**:
    - Click **"Apply"**. Render will build and deploy the service.
    - Your application will be live at `https://your-service-name.onrender.com`.

## Unified Architecture Note

- **Root Directory**: The root of the repository.
- **Backend**: FastAPI app located in `backend/`.
- **Frontend**: Static files located in the root (served by FastAPI).
- **API Base**: The frontend uses relative paths (`/api`), so no CORS configuration is needed between frontend and backend.

## Local Development (Post-Changes)

To run the unified app locally:

```bash
cd backend
pip install -r requirements.txt
uvicorn main:app --reload --port 8000
```

Open `http://localhost:8000` in your browser.
