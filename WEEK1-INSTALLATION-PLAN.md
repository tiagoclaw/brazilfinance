# 🚀 WEEK 1 EXECUTION PLAN - MAKE BRAZILFINANCE INSTALLABLE

**Current Reality:** API is online but ZERO users can install the Google Sheets add-on  
**Goal:** Complete installation flow from landing page to working formulas  
**Timeline:** 7 days  
**Success Metric:** 20+ economists successfully using formulas  

---

## 🎯 DAY 1-2: GOOGLE APPS SCRIPT DEPLOYMENT (P0)

### Current Status Check:
```
✅ sheets-addon/Code.js exists (11KB)
✅ sheets-addon/Menu.js exists (16KB)  
✅ sheets-addon/Sidebar.html exists (10KB)
✅ sheets-addon/appsscript.json exists
❌ NOT DEPLOYED to Google Apps Script
❌ NOT publicly accessible
```

### Deployment Tasks:

#### Task 1A: Google Apps Script Project Setup
**Time:** 2 hours  
**Owner:** Tiago  

**Steps:**
1. Access: https://script.google.com
2. Create new project: "BrazilFinance Sheets Add-on"
3. Upload all files from sheets-addon/ directory
4. Configure appsscript.json manifest
5. Test project runs without errors

**Verification:**
```javascript
// Test these functions work in Apps Script editor:
=BCB("selic")
=FOCUS("IPCA", 2026) 
=B3("PETR4")
=TESOURO("IPCA+ 2035")
```

#### Task 1B: API Connection Configuration
**Time:** 2 hours  
**Owner:** Tiago  

**Steps:**
1. Update API_BASE_URL in Code.js to Railway URL
2. Test API connectivity from Apps Script
3. Configure CORS if needed
4. Add error handling for API timeouts
5. Test rate limiting behavior

**Code Update Required:**
```javascript
// In sheets-addon/Code.js, line ~15:
var API_BASE_URL = "https://YOUR-RAILWAY-URL.railway.app/v1";
```

#### Task 1C: Public Deployment
**Time:** 1 hour  
**Owner:** Tiago  

**Steps:**
1. Apps Script → Deploy → New deployment
2. Type: Web app + Add-on (if available)
3. Access: Anyone with link
4. Test sharing URL works
5. Document installation URL

**Expected Result:** Public Google Apps Script URL that users can install

---

## 🌐 DAY 3-4: LANDING PAGE INSTALLATION FLOW (P0)

### Current Landing Page Gaps:
```
❌ No "Install" button
❌ No installation instructions  
❌ No step-by-step guide
❌ No video tutorial
```

### Landing Page Updates:

#### Task 3A: Add Installation Section
**Time:** 3 hours  
**Owner:** Tiago  

**HTML Addition (after pricing section):**
```html
<section id="install" class="install-section">
    <div class="container">
        <h2>🚀 Começar em 3 Passos</h2>
        
        <div class="install-steps">
            <div class="step">
                <div class="step-number">1</div>
                <h3>Instalar Add-on</h3>
                <p>Clique no botão abaixo para adicionar ao Google Sheets</p>
                <a href="APPS-SCRIPT-URL" class="btn-install" target="_blank">
                    📊 Instalar no Google Sheets
                </a>
            </div>
            
            <div class="step">
                <div class="step-number">2</div>
                <h3>Autorizar Acesso</h3>
                <p>Permitir que o add-on acesse dados externos</p>
            </div>
            
            <div class="step">
                <div class="step-number">3</div>  
                <h3>Usar Fórmulas</h3>
                <p>Digite =BCB("selic") em qualquer célula</p>
            </div>
        </div>
    </div>
</section>
```

#### Task 3B: Update CTA Buttons
**Time:** 1 hour  
**Owner:** Tiago  

**Changes:**
- Hero section: "Começar Grátis" → Link to #install
- Pricing section: All buttons → Link to #install  
- Add floating install button (sticky)

#### Task 3C: Installation Tutorial
**Time:** 4 hours  
**Owner:** Tiago  

**Content Creation:**
1. Write detailed installation guide
2. Create screenshots for each step
3. Add troubleshooting section
4. Test with non-technical user

**Tutorial Content:**
```markdown
# Como Instalar BrazilFinance

## Passo 1: Acessar Google Sheets
1. Abra Google Sheets (sheets.google.com)
2. Crie uma nova planilha ou abra existente

## Passo 2: Instalar Add-on  
1. Clique no link: [Instalar BrazilFinance](APPS-SCRIPT-URL)
2. Clique "Fazer uma cópia" ou "Instalar"  
3. Autorize as permissões necessárias

## Passo 3: Testar Fórmulas
1. Em qualquer célula, digite: =BCB("selic")
2. Pressione Enter
3. Deve aparecer a taxa Selic atual (ex: 10.75)

## Passo 4: Explorar Dados
- =FOCUS("IPCA", 2026) → Expectativa IPCA  
- =B3("PETR4") → Cotação Petrobras
- =TESOURO("IPCA+ 2035") → Taxa do título

## Problemas?
- Erro #NAME?: Add-on não instalado corretamente
- Erro #ERROR!: API temporariamente indisponível  
- Dados antigos: Aguarde cache refresh (5-60 min)
```

---

## 📹 DAY 5: VIDEO TUTORIAL CREATION (P1)

### Video Specs:
- **Length:** 3-5 minutes
- **Quality:** 1080p screen recording  
- **Audio:** Clear voice-over in Portuguese
- **Platform:** YouTube + embedded in landing page

### Video Script:
```
[0:00-0:30] Introdução
"Economistas gastam 5 horas por semana copiando dados do BCB. 
E se você pudesse fazer isso em 5 segundos?"

[0:30-1:30] Problema  
"Mostrar processo manual: BCB SGS → Copy → Paste
Mostrar como dados ficam desatualizados"

[1:30-3:00] Solução
"Screen recording: Instalar add-on → =BCB("selic") → Resultado"
"Mostrar fórmulas: BCB, Focus, B3, Tesouro"

[3:00-3:30] Call to Action
"Instale grátis em 30 segundos. Link na descrição."
```

### Production Tasks:
1. **Script writing:** 1 hour
2. **Screen recording:** 2 hours  
3. **Video editing:** 3 hours
4. **Upload & optimization:** 1 hour

---

## 🧪 DAY 6-7: BETA TESTING & ITERATION (P1)

### Beta User Recruitment:
**Target:** 10 economists from different institutions

**Sources:**
- LinkedIn: Direct outreach to economists
- WhatsApp: Finance groups  
- Email: University economics professors
- Network: Personal/professional connections

### Beta Testing Protocol:

#### Task 7A: Recruit Beta Users
**Time:** 4 hours  
**Method:** Direct LinkedIn messages  

**Message Template:**
```
Olá [Nome],

Sou Tiago, fundador da BrazilFinance. Criamos uma ferramenta que permite acessar dados BCB/Focus/B3 diretamente no Google Sheets com fórmulas simples.

Você poderia testar 15 minutos e dar feedback? Em troca, acesso gratuito permanente ao PRO (R$ 39/mês).

Demo: =BCB("selic") retorna taxa atual
Landing: https://tiagoclaw.github.io/brazilfinance/

Interesse?

Obrigado,
Tiago
```

#### Task 7B: Testing Session
**Time:** 6 hours (15 min per user)  
**Method:** Screen share calls  

**Testing Checklist:**
- [ ] User can find installation instructions
- [ ] User can install add-on successfully  
- [ ] User can execute first formula =BCB("selic")
- [ ] User understands available data sources
- [ ] User would pay R$ 39/mês for PRO features

**Success Metrics:**
- **Installation Success Rate:** >80%
- **First Formula Success:** >90%  
- **Purchase Intent:** >30% "definitely would pay"

#### Task 7C: Feedback Integration
**Time:** 4 hours  
**Method:** Document issues and fix immediately  

**Common Issues Expected:**
- Installation too complex
- Formula syntax confusing  
- Data refresh not obvious
- Value proposition unclear

---

## ✅ WEEK 1 SUCCESS CRITERIA

### Quantitative Metrics:
- **20+ successful installations** of Google Sheets add-on
- **100+ formula executions** across all users
- **80%+ installation success rate** in beta testing
- **5+ active beta users** using formulas daily

### Qualitative Metrics:
- **Clear installation flow** from landing page to working formulas
- **Self-service onboarding** - users don't need help after tutorial
- **Value demonstration** - users immediately see time savings
- **Purchase intent** - at least 30% would pay for PRO

### Deliverables:
✅ **Google Apps Script deployed** and publicly accessible  
✅ **Landing page updated** with installation flow  
✅ **Video tutorial created** and embedded  
✅ **Beta user feedback** collected and integrated  
✅ **Installation process refined** based on real user testing  

---

## 🚨 RISK MITIGATION

### Technical Risks:
- **Google Apps Script approval delays:** Start deployment immediately
- **CORS issues:** Test API connectivity from Apps Script early
- **Rate limiting problems:** Implement graceful error handling

### User Experience Risks:
- **Installation too complex:** Test with non-technical users first
- **Formula syntax confusing:** Provide clear examples and autocomplete
- **Value not immediately obvious:** Lead with strongest use case (Selic rate)

### Business Risks:
- **Low user adoption:** Focus on economist-specific LinkedIn outreach
- **No purchase intent:** Emphasize time savings and premium features
- **Competition awareness:** Keep development progress private until launch

---

## 📞 IMMEDIATE NEXT STEPS (TODAY)

### Priority 1 (Next 2 hours):
1. **Access Google Apps Script:** script.google.com
2. **Create new project:** "BrazilFinance Sheets Add-on"  
3. **Upload sheets-addon files:** Code.js, Menu.js, Sidebar.html, appsscript.json
4. **Update API_BASE_URL:** Point to Railway API
5. **Test basic functionality:** =BCB("selic") working

### Priority 2 (This afternoon):
1. **Deploy publicly:** Get shareable Apps Script URL
2. **Update landing page:** Add installation section
3. **Test installation flow:** Complete user journey once
4. **Document issues:** Note what's confusing or broken

### Priority 3 (Tomorrow):  
1. **Create video tutorial:** 3-5 minute installation demo
2. **Recruit first beta user:** LinkedIn message to economist
3. **Schedule testing session:** Live call to watch user install
4. **Iterate based on feedback:** Fix immediate issues

---

**🎯 SUCCESS MEASUREMENT:**

By end of Week 1, we should have transitioned from:
- **"API exists but no one can use it"**
- **TO: "20+ economists actively using BrazilFinance formulas in daily work"**

This is the foundational week that determines if BrazilFinance becomes a real product or stays a technical demo.

**🔥 EXECUTION STARTS NOW!**