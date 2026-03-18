#!/usr/bin/env python3
"""
Railway startup script - handles dynamic PORT
"""
import os
import sys
import subprocess

# Get PORT from environment variable (Railway sets this)
port = os.environ.get('PORT', '8000')

# Start uvicorn with dynamic port
cmd = [
    sys.executable, '-m', 'uvicorn', 
    'app.main:app',
    '--host', '0.0.0.0', 
    '--port', str(port)
]

print(f"Starting BrazilFinance API on port {port}...")
subprocess.run(cmd)