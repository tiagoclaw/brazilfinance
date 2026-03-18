# 🚀 RAILWAY DEPLOY - BRAZILFINANCE BACKEND

**Status:** ✅ Deploy-Ready  
**Backend:** Python/FastAPI API  
**Configuration:** Dockerfile + nixpacks.toml  
**Database:** PostgreSQL (optional)  

---

## 🔗 DEPLOY EM 1 CLIQUE

### Option 1: Deploy Button (Recomendado)
[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/new/template/code-repo?repository=tiagoclaw/brazilfinance)

### Option 2: Manual GitHub Connection
1. **Visit:** https://railway.app/new
2. **Select:** Deploy from GitHub repo
3. **Repository:** `tiagoclaw/brazilfinance`
4. **Root Directory:** Keep as root (nixpacks.toml will handle)
5. **Environment Variables:** None required for MVP
6. **Deploy:** Click deploy!

---

## ⚙️ CONFIGURAÇÃO RAILWAY

### Arquivos de Deploy Incluídos:
```
brazilfinance/
├── railway.toml          # Railway configuration
├── nixpacks.toml         # Nixpacks build config (preferred)
└── backend/
    ├── Dockerfile        # Container config (fallback)
    ├── railway.json      # Service config
    └── requirements.txt  # Python dependencies
```

### Build Process:
1. **Nixpacks Detection:** Auto-detects Python project
2. **Dependencies Install:** `pip install -r backend/requirements.txt`
3. **Port Binding:** Dynamic PORT environment variable
4. **Health Checks:** `/v1/health` endpoint
5. **Auto-scaling:** Railway handles traffic spikes

---

## 📊 ENDPOINTS DISPONÍVEIS

### Health Check
```
GET https://your-app.railway.app/v1/health
```

### BCB Indicators
```
GET https://your-app.railway.app/v1/bcb/selic
GET https://your-app.railway.app/v1/bcb/ipca
GET https://your-app.railway.app/v1/bcb/dolar
```

### Focus Expectations  
```
GET https://your-app.railway.app/v1/focus/IPCA?year=2026
GET https://your-app.railway.app/v1/focus/Selic?year=2026
```

### B3 Market Data
```
GET https://your-app.railway.app/v1/b3/PETR4
GET https://your-app.railway.app/v1/b3/VALE3?field=variacao
```

### Tesouro Direto
```
GET https://your-app.railway.app/v1/tesouro/IPCA+ 2035
GET https://your-app.railway.app/v1/tesouro/Prefixado 2029
```

---

## 🔧 CONFIGURAÇÕES OPCIONAIS

### Environment Variables (Optional)
```
PORT=8000                    # Auto-set by Railway
ENVIRONMENT=production       # App environment
LOG_LEVEL=INFO              # Logging level
CACHE_ENABLED=true          # Enable caching
API_RATE_LIMIT=1000         # Rate limit per hour
```

### Database (Optional - Para versão futura)
```
# Railway PostgreSQL Add-on
DATABASE_URL=postgresql://...  # Auto-provided by Railway
```

### Redis Cache (Optional - Para escala)
```
# Railway Redis Add-on  
REDIS_URL=redis://...         # Auto-provided by Railway
```

---

## 📈 MONITORING & SCALING

### Railway Dashboard Features:
- **Real-time Logs:** Application stdout/stderr
- **Metrics:** CPU, Memory, Network usage
- **Deployments:** Git-based auto-deploy on push
- **Custom Domains:** Connect brazilfinance.com.br
- **SSL Certificates:** Auto-provisioned HTTPS
- **Environment Management:** Dev/Staging/Prod

### Auto-Scaling:
- **Horizontal:** Multiple replicas based on traffic
- **Vertical:** CPU/Memory scaling automatic
- **Geographic:** Edge deployments for low latency

---

## 🚀 POST-DEPLOY STEPS

### 1. Verify Deployment
```bash
# Health check
curl https://your-app.railway.app/v1/health

# Test BCB endpoint
curl https://your-app.railway.app/v1/bcb/selic

# Expected: {"valor": 10.75, "data": "2026-03-17", ...}
```

### 2. Update Google Sheets Add-on
```javascript
// In sheets-addon/Code.js, update:
var API_BASE_URL = "https://your-app.railway.app/v1";

// Test formula
=BCB("selic")  // Should return current Selic rate
```

### 3. Custom Domain (Optional)
```
1. Railway Dashboard → Settings → Domains
2. Add custom domain: api.brazilfinance.com.br
3. Update DNS CNAME: api → your-app.railway.app
4. SSL auto-provisions in ~5 minutes
```

---

## 💰 RAILWAY PRICING

### Hobby Plan (Recomendado para MVP)
- **Cost:** $5/month per service
- **Resources:** 512MB RAM, 1GB storage
- **Traffic:** Unlimited bandwidth
- **Features:** Custom domains, SSL, metrics

### Pro Plan (Para escala)
- **Cost:** $20/month per service  
- **Resources:** 8GB RAM, 100GB storage
- **Traffic:** Unlimited bandwidth
- **Features:** Team collaboration, priority support

### Usage-Based Scaling:
- **CPU:** $0.000463/vCPU-hour
- **Memory:** $0.000231/GB-hour
- **Ideal para:** Startups com crescimento variável

---

## 🔍 TROUBLESHOOTING

### Common Issues:

**Build Failed:**
```bash
# Check logs in Railway Dashboard
# Verify requirements.txt has all dependencies
# Check Python version compatibility (3.11+)
```

**Port Binding Error:**
```bash
# Railway sets PORT environment variable
# Our Dockerfile handles this: --port ${PORT:-8000}
# Check if app is listening on 0.0.0.0, not 127.0.0.1
```

**External API Timeouts:**
```bash
# BCB/Yahoo Finance APIs may be slow
# Increase timeout in collectors
# Implement retry logic with exponential backoff
```

### Debug Commands:
```bash
# Railway CLI (if installed)
railway logs --follow
railway shell
railway status

# Or use Railway Dashboard web interface
```

---

## 📊 EXPECTED PERFORMANCE

### Response Times:
- **Cached Data:** <50ms
- **Fresh BCB Data:** 200-500ms  
- **Fresh B3 Data:** 100-300ms
- **Health Check:** <10ms

### Throughput:
- **Hobby Plan:** ~100 requests/second
- **Pro Plan:** ~1000 requests/second
- **Rate Limiting:** 1000 requests/hour/IP (configurable)

### Availability:
- **Railway SLA:** 99.9% uptime
- **Health Checks:** Auto-restart on failure
- **Geographic:** Global edge network

---

## ✅ DEPLOY CHECKLIST

### Pre-Deploy:
- [x] Dockerfile configured for Railway
- [x] nixpacks.toml for build optimization  
- [x] railway.toml for service config
- [x] Environment variables documented
- [x] Health check endpoint implemented

### Post-Deploy:
- [ ] Verify all endpoints working
- [ ] Test Google Sheets integration
- [ ] Update landing page API URL
- [ ] Configure custom domain (optional)
- [ ] Set up monitoring alerts
- [ ] Update documentation with live URLs

---

## 🎯 NEXT STEPS

### Immediate (After Deploy):
1. **Test API:** All 4 collectors (BCB, Focus, B3, Tesouro)
2. **Update Sheets:** API_BASE_URL in Code.js
3. **Landing Page:** Update deploy button success message
4. **Documentation:** Add live API URL to README

### Week 1:
1. **Custom Domain:** api.brazilfinance.com.br
2. **Monitoring:** Set up alerts for downtime
3. **Performance:** Optimize caching and response times
4. **Beta Testing:** 50 users with live API

### Month 1:
1. **Database:** PostgreSQL for user management
2. **Redis:** Distributed caching for scale
3. **Analytics:** API usage metrics and insights
4. **Rate Limiting:** Tiered limits per user plan

---

**🚀 Ready to deploy? Click the Railway button above or follow the manual steps!**

**Expected deploy time:** 3-5 minutes  
**Expected URL:** `https://your-app.railway.app`  
**Ready for:** Production traffic + Google Sheets integration  

---

*Deploy configuration optimized for Railway's infrastructure*  
*Questions? Check Railway docs: https://docs.railway.app*