<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CareerPath AI — Discover Your Career</title>
<script>(function(){var t=localStorage.getItem('theme')||'light';document.documentElement.setAttribute('data-theme',t);})();</script>
<style>
:root{--bg:#fff;--surface:#f5f7fb;--text:#0f172a;--muted:#64748b;--primary:#4f46e5;--primary-hover:#4338ca;--border:#e5e7eb;--card:#fff;--shadow:0 4px 20px rgba(0,0,0,.06);--shadow-lg:0 12px 40px rgba(0,0,0,.08);--streak:rgba(79,70,229,.10);--glow:rgba(79,70,229,.14)}
[data-theme="dark"]{--bg:#0f172a;--surface:#1e293b;--text:#f1f5f9;--muted:#94a3b8;--primary:#818cf8;--primary-hover:#a5b4fc;--border:#334155;--card:#1e293b;--shadow:0 4px 20px rgba(0,0,0,.4);--shadow-lg:0 12px 40px rgba(0,0,0,.55);--streak:rgba(129,140,248,.10);--glow:rgba(129,140,248,.16)}
*{box-sizing:border-box;margin:0;padding:0}html,body{width:100%;min-height:100%;overflow-x:hidden}
body{font-family:'Inter',system-ui,sans-serif;background:var(--bg);color:var(--text);line-height:1.6;transition:.3s}
.bg-anim{position:fixed;inset:0;z-index:-1;pointer-events:none;overflow:hidden}
.bg-anim .ambient{position:absolute;top:-20%;left:-10%;width:120%;height:80%;background:radial-gradient(ellipse at 30% 30%, var(--glow), transparent 60%),radial-gradient(ellipse at 80% 70%, var(--streak), transparent 60%);filter:blur(60px);animation:ambientPulse 18s ease-in-out infinite alternate}
@keyframes ambientPulse{0%{transform:translate(0,0) scale(1)}100%{transform:translate(2%,3%) scale(1.08)}}
.bg-anim .streak{position:absolute;top:-50%;height:200%;width:22%;background:linear-gradient(180deg,transparent,var(--streak) 45%,transparent);filter:blur(50px);transform:rotate(18deg)}
.bg-anim .streak.s1{left:-10%;animation:sweep1 20s ease-in-out infinite}
.bg-anim .streak.s2{left:40%;animation:sweep2 26s ease-in-out infinite;width:16%;opacity:.8}
.bg-anim .streak.s3{left:85%;animation:sweep3 32s ease-in-out infinite;width:14%;opacity:.7}
@keyframes sweep1{0%,100%{transform:rotate(18deg) translateX(0)}50%{transform:rotate(18deg) translateX(60px)}}
@keyframes sweep2{0%,100%{transform:rotate(18deg) translateX(0)}50%{transform:rotate(18deg) translateX(-80px)}}
@keyframes sweep3{0%,100%{transform:rotate(18deg) translateX(0)}50%{transform:rotate(18deg) translateX(-40px)}}
.navbar{display:flex;justify-content:space-between;align-items:center;padding:16px 48px;background:var(--card);border-bottom:1px solid var(--border);position:sticky;top:0;z-index:100;backdrop-filter:blur(10px)}
.logo{font-weight:700;font-size:18px;color:var(--primary);text-decoration:none;display:flex;gap:8px;align-items:center}
.nav-links{display:flex;gap:4px;align-items:center;flex-wrap:wrap}
.nav-links a{color:var(--text);text-decoration:none;font-weight:500;font-size:14px;padding:8px 14px;border-radius:8px;transition:.2s}
.nav-links a:hover,.nav-links a.active{color:var(--primary);background:var(--surface)}
.theme-toggle{background:var(--surface);border:1px solid var(--border);color:var(--text);padding:8px 14px;border-radius:999px;cursor:pointer;margin-left:6px;font-size:14px}
.theme-toggle:hover{border-color:var(--primary);color:var(--primary)}
.menu-btn{display:none;background:var(--surface);border:1px solid var(--border);color:var(--text);padding:8px 12px;border-radius:8px;cursor:pointer;font-size:16px;margin-left:6px}
.btn{display:inline-block;padding:13px 28px;border-radius:10px;font-weight:600;font-size:15px;text-decoration:none;cursor:pointer;border:none;transition:all .2s}
.btn-primary{background:var(--primary);color:#fff}
.btn-primary:hover{background:var(--primary-hover);transform:translateY(-1px);box-shadow:0 8px 20px rgba(79,70,229,.25)}
.btn-outline{background:transparent;border:1.5px solid var(--border);color:var(--text)}
.btn-outline:hover{border-color:var(--primary);color:var(--primary)}
.hero{max-width:1280px;margin:0 auto;padding:72px 48px 40px;display:grid;grid-template-columns:1.05fr 1fr;gap:64px;align-items:center}
.hero-badge{display:inline-flex;align-items:center;gap:8px;padding:7px 14px;border-radius:999px;background:var(--surface);border:1px solid var(--border);font-size:12.5px;font-weight:600;color:var(--text);margin-bottom:22px}
.hero-badge .dot{width:7px;height:7px;border-radius:50%;background:var(--primary);animation:blink 1.6s infinite}
@keyframes blink{0%,100%{opacity:1}50%{opacity:.4}}
.hero h1{font-size:52px;line-height:1.08;margin-bottom:20px;letter-spacing:-1.8px;font-weight:800}
.hero h1 span{color:var(--primary)}
.hero p{font-size:17px;color:var(--muted);margin-bottom:30px;line-height:1.65;max-width:520px}
.hero-buttons{display:flex;gap:14px;flex-wrap:wrap;margin-bottom:26px}
.trust-row{display:flex;align-items:center;gap:12px;font-size:13.5px;color:var(--muted)}
.trust-avatars{display:flex}
.trust-avatars span{width:32px;height:32px;border-radius:50%;border:2px solid var(--card);margin-left:-8px;display:flex;align-items:center;justify-content:center;font-size:14px;color:#fff}
.trust-avatars span:first-child{margin-left:0}
.trust-avatars span:nth-child(1){background:#6366f1}
.trust-avatars span:nth-child(2){background:#8b5cf6}
.trust-avatars span:nth-child(3){background:#ec4899}
.trust-avatars span:nth-child(4){background:#06b6d4}
.hero-visual{background:var(--card);border:1px solid var(--border);border-radius:24px;padding:0;box-shadow:var(--shadow-lg);overflow:hidden}
.hero-visual .bar{display:flex;align-items:center;gap:8px;padding:12px 18px;background:var(--surface);border-bottom:1px solid var(--border)}
.hero-visual .bar .dotrow{display:flex;gap:6px}
.hero-visual .bar .dotrow span{width:10px;height:10px;border-radius:50%;background:#cbd5e1}
[data-theme="dark"] .hero-visual .bar .dotrow span{background:#475569}
.hero-visual .bar .dotrow span:nth-child(1){background:#ef4444}
.hero-visual .bar .dotrow span:nth-child(2){background:#f59e0b}
.hero-visual .bar .dotrow span:nth-child(3){background:#22c55e}
.hero-visual .bar .url{font-family:ui-monospace,Menlo,monospace;font-size:12px;color:var(--muted);margin-left:12px}
.hero-visual .body{padding:28px}
.hero-visual h3{font-size:13px;font-weight:700;color:var(--primary);letter-spacing:1.5px;text-transform:uppercase;margin-bottom:14px}
.hero-visual .q{font-size:16.5px;font-weight:600;line-height:1.45;margin-bottom:20px;min-height:48px}
.hero-visual .scale{display:grid;grid-template-columns:repeat(5,1fr);gap:8px;margin-bottom:22px}
.hero-visual .scale div{padding:12px 0;text-align:center;border-radius:10px;background:var(--surface);border:1.5px solid var(--border);font-size:13px;font-weight:600;color:var(--muted);transition:all .25s}
.hero-visual .scale div.on{background:var(--primary);color:#fff;border-color:var(--primary);transform:translateY(-2px);box-shadow:0 6px 16px rgba(79,70,229,.3)}
.hero-visual .prog{height:6px;background:var(--surface);border-radius:3px;overflow:hidden;margin-bottom:10px}
.hero-visual .prog span{display:block;height:100%;background:linear-gradient(90deg,var(--primary),var(--primary-hover));border-radius:3px;animation:progAnim 5s ease-in-out infinite alternate}
@keyframes progAnim{0%{width:20%}100%{width:80%}}
.hero-visual .meta{display:flex;justify-content:space-between;font-size:12px;color:var(--muted)}
.stats-strip{max-width:1280px;margin:40px auto 0;padding:0 48px;display:grid;grid-template-columns:repeat(4,1fr);gap:20px}
.stat-card{background:var(--card);border:1px solid var(--border);border-radius:16px;padding:26px;box-shadow:var(--shadow);transition:transform .2s,border-color .2s}
.stat-card:hover{transform:translateY(-3px);border-color:var(--primary)}
.stat-card .num{font-size:34px;font-weight:800;color:var(--text);letter-spacing:-1.5px;line-height:1}
.stat-card .num em{color:var(--primary);font-style:normal}
.stat-card .lbl{color:var(--text);font-size:14px;margin-top:10px;font-weight:600}
.stat-card .hint{color:var(--muted);font-size:12.5px;margin-top:4px}
.trusted{max-width:1280px;margin:60px auto 0;padding:32px 48px;border-top:1px solid var(--border);border-bottom:1px solid var(--border);display:flex;flex-wrap:wrap;align-items:center;gap:40px;justify-content:center}
.trusted .label{font-size:13px;color:var(--muted);font-weight:600;letter-spacing:1px;text-transform:uppercase}
.trusted .brand{font-size:17px;font-weight:700;color:var(--muted);letter-spacing:-.3px;opacity:.85}
.features{max-width:1280px;margin:80px auto;padding:0 48px}
.sec-head{margin-bottom:52px}
.sec-head h2{font-size:38px;font-weight:800;letter-spacing:-1.2px;line-height:1.15;margin-bottom:12px;max-width:640px}
.sec-head p{color:var(--muted);font-size:16.5px;max-width:560px}
.eyebrow{display:inline-block;color:var(--primary);font-size:12px;font-weight:700;letter-spacing:2px;text-transform:uppercase;margin-bottom:14px}
.feature-grid{display:grid;grid-template-columns:repeat(3,1fr);gap:22px}
.feature-card{background:var(--card);border:1px solid var(--border);padding:30px;border-radius:18px;box-shadow:var(--shadow);transition:transform .25s,border-color .25s,box-shadow .25s;display:flex;flex-direction:column}
.feature-card:hover{transform:translateY(-4px);border-color:var(--primary);box-shadow:var(--shadow-lg)}
.feature-card .icon{width:54px;height:54px;border-radius:14px;background:var(--surface);border:1px solid var(--border);display:flex;align-items:center;justify-content:center;font-size:24px;margin-bottom:18px;transition:transform .3s}
.feature-card:hover .icon{transform:scale(1.08) rotate(-6deg);border-color:var(--primary)}
.feature-card h4{font-size:18px;margin-bottom:8px;letter-spacing:-.2px}
.feature-card p{color:var(--muted);font-size:14.5px;line-height:1.6;margin-bottom:18px;flex:1}
.feature-card .more{font-size:13.5px;font-weight:600;color:var(--primary);text-decoration:none;display:inline-flex;align-items:center;gap:6px}
.about{max-width:1280px;margin:80px auto;padding:0 48px}
.about-inner{background:var(--card);border:1px solid var(--border);border-radius:22px;padding:52px;box-shadow:var(--shadow);display:grid;grid-template-columns:1.2fr 1fr;gap:56px;align-items:center;position:relative;overflow:hidden}
.about-inner::before{content:'';position:absolute;top:0;left:0;bottom:0;width:4px;background:linear-gradient(180deg,var(--primary),transparent)}
.about h3{font-size:30px;margin-bottom:16px;letter-spacing:-.8px;font-weight:800}
.about h3 span{color:var(--primary)}
.about p{color:var(--muted);line-height:1.7;font-size:15.5px;margin-bottom:14px}
.check-list{list-style:none;margin:20px 0;display:grid;gap:10px}
.check-list li{display:flex;gap:12px;align-items:flex-start;font-size:14.5px;color:var(--text)}
.check-list li::before{content:'✓';color:var(--primary);font-weight:800;flex-shrink:0;width:22px;height:22px;border-radius:50%;background:var(--surface);border:1px solid var(--border);display:flex;align-items:center;justify-content:center;font-size:12px}
.about-tags{display:flex;gap:8px;flex-wrap:wrap;margin-top:20px}
.about-tags span{font-size:12.5px;padding:6px 13px;border-radius:999px;background:var(--surface);border:1px solid var(--border);color:var(--muted);font-weight:500}
.quote{background:var(--surface);border:1px solid var(--border);border-radius:18px;padding:28px;position:relative}
.quote::before{content:'"';position:absolute;top:-6px;left:18px;font-size:64px;color:var(--primary);font-family:Georgia,serif;line-height:1;opacity:.35}
.quote p{font-size:15px;color:var(--text);line-height:1.7;font-style:italic;margin-bottom:16px}
.quote .who{display:flex;align-items:center;gap:12px;font-size:13.5px;color:var(--muted);font-weight:500}
.quote .who .av{width:38px;height:38px;border-radius:50%;background:linear-gradient(135deg,var(--primary),var(--primary-hover));color:#fff;display:flex;align-items:center;justify-content:center;font-weight:700;font-size:14px}
.cta-wrap{max-width:1280px;margin:60px auto 90px;padding:0 48px}
.cta{background:linear-gradient(135deg,var(--primary),var(--primary-hover));color:#fff;border-radius:26px;padding:70px 48px;text-align:center;box-shadow:var(--shadow-lg);position:relative;overflow:hidden}
.cta::before{content:'';position:absolute;top:-50%;left:-50%;width:200%;height:200%;background:radial-gradient(circle at 30% 30%,rgba(255,255,255,.12),transparent 50%);animation:ctaShift 12s ease-in-out infinite alternate}
@keyframes ctaShift{0%{transform:translate(0,0)}100%{transform:translate(5%,5%)}}
.cta h2{font-size:36px;margin-bottom:14px;letter-spacing:-1px;position:relative;font-weight:800}
.cta p{opacity:.9;font-size:16px;margin-bottom:30px;position:relative}
.cta .btn{background:#fff;color:var(--primary);font-weight:700;padding:14px 32px;position:relative}
.cta .btn:hover{background:#f1f5f9;transform:translateY(-2px)}
.cta .reassure{display:flex;gap:26px;justify-content:center;flex-wrap:wrap;margin-top:26px;position:relative;font-size:13.5px;opacity:.9}
.cta .reassure span{display:flex;align-items:center;gap:6px}
.cta .reassure span::before{content:'✓';font-weight:800}
footer{border-top:1px solid var(--border);padding:36px 48px;display:flex;justify-content:space-between;align-items:center;flex-wrap:wrap;gap:16px;color:var(--muted);font-size:13.5px}
footer .flinks{display:flex;gap:22px;flex-wrap:wrap}
footer .flinks a{color:var(--muted);text-decoration:none;transition:color .2s}
footer .flinks a:hover{color:var(--primary)}
@media(max-width:1000px){
  .hero{grid-template-columns:1fr;padding:50px 24px 30px;gap:40px}
  .hero h1{font-size:38px;letter-spacing:-1px}
  .stats-strip{padding:0 24px;grid-template-columns:repeat(2,1fr)}
  .features,.about,.cta-wrap{padding:0 24px;margin:60px auto}
  .about-inner{grid-template-columns:1fr;padding:32px;gap:32px}
  .feature-grid{grid-template-columns:repeat(2,1fr)}
  .navbar{padding:14px 20px}
  .nav-links{display:none}
  .nav-links.open{display:flex;flex-direction:column;align-items:flex-start;position:absolute;top:100%;left:0;right:0;background:var(--card);border-bottom:1px solid var(--border);padding:16px 20px;gap:4px}
  .nav-links.open a{padding:10px 12px;width:100%}
  .menu-btn{display:block}
  .trusted{padding:24px;gap:24px}
}
@media(max-width:560px){
  .stats-strip,.feature-grid{grid-template-columns:1fr}
  .hero h1{font-size:32px}
  .sec-head h2{font-size:26px}
  .cta{padding:48px 24px}
  .cta h2{font-size:26px}
  footer{padding:26px 24px;flex-direction:column;text-align:center}
}
</style>
</head>
<body>

<div class="bg-anim" aria-hidden="true"><div class="ambient"></div><div class="streak s1"></div><div class="streak s2"></div><div class="streak s3"></div></div>

<nav class="navbar">
    <a href="index.jsp" class="logo">🎯 CareerPath AI</a>
    <div class="nav-links" id="navLinks">
        <a href="index.jsp" class="active">Home</a>
        <a href="fields.jsp">Fields</a>
        <a href="features.jsp">Features</a>
        <a href="about.jsp">About</a>
        <c:choose>
            <c:when test="${not empty sessionScope.loggedUser}">
                <a href="dashboard">Dashboard</a>
                <a href="logout">Logout</a>
            </c:when>
            <c:otherwise>
                <a href="login.jsp">Login</a>
                <a href="register.jsp">Register</a>
            </c:otherwise>
        </c:choose>
        <button class="theme-toggle" id="themeToggle">🌙</button>
    </div>
    <button class="menu-btn" id="menuBtn">☰</button>
</nav>

<section class="hero">
    <div>
        <span class="hero-badge"><span class="dot"></span> AI-powered career matching</span>
        <h1>Discover the <span>career</span> that fits you best.</h1>
        <p>Pick a field, answer 15 honest questions, and our AI ranks the top 5 careers for you — with match scores, skill gaps, and a learning roadmap.</p>
        <div class="hero-buttons">
            <c:choose>
                <c:when test="${not empty sessionScope.loggedUser}">
                    <a href="fields" class="btn btn-primary">Start Assessment →</a>
                    <a href="dashboard" class="btn btn-outline">My Dashboard</a>
                </c:when>
                <c:otherwise>
                    <a href="register.jsp" class="btn btn-primary">Get Started Free</a>
                    <a href="login.jsp" class="btn btn-outline">I have an account</a>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="trust-row">
            <div class="trust-avatars"><span>K</span><span>M</span><span>S</span><span>R</span></div>
            <div>Joined by <strong>2,400+</strong> students across 50 fields</div>
        </div>
    </div>
    <div class="hero-visual">
        <div class="bar">
            <div class="dotrow"><span></span><span></span><span></span></div>
            <div class="url">careerpath.ai / assessment</div>
        </div>
        <div class="body">
            <h3>Question 07 / 15</h3>
            <div class="q" id="typedQ">Do you enjoy solving complex problems?</div>
            <div class="scale"><div>1</div><div>2</div><div class="on">3</div><div>4</div><div>5</div></div>
            <div class="prog"><span></span></div>
            <div class="meta"><span>Progress</span><span>47%</span></div>
        </div>
    </div>
</section>

<section class="stats-strip">
    <div class="stat-card"><div class="num">50<em>+</em></div><div class="lbl">Career Fields</div><div class="hint">Health, IT, Law &amp; more</div></div>
    <div class="stat-card"><div class="num">1000<em>+</em></div><div class="lbl">Careers</div><div class="hint">Ranked by AI</div></div>
    <div class="stat-card"><div class="num">15</div><div class="lbl">Questions per Field</div><div class="hint">~4 minutes</div></div>
    <div class="stat-card"><div class="num">100<em>%</em></div><div class="lbl">Free Forever</div><div class="hint">No credit card needed</div></div>
</section>

<section class="trusted">
    <span class="label">Trusted by students at</span>
    <span class="brand">SLIATE</span>
    <span class="brand">University of Colombo</span>
    <span class="brand">NSBM Green University</span>
    <span class="brand">SLIIT</span>
    <span class="brand">NIBM</span>
</section>

<section class="features" id="features">
    <div class="sec-head">
        <span class="eyebrow">Features</span>
        <h2>Everything you need to choose with confidence.</h2>
        <p>A complete career discovery toolkit — built with students, for students.</p>
    </div>
    <div class="feature-grid">
        <div class="feature-card"><div class="icon">🧠</div><h4>AI-Powered Matching</h4><p>Cosine-similarity scoring ranks all careers in your field by how well they fit you.</p><a href="fields" class="more">Learn more →</a></div>
        <div class="feature-card"><div class="icon">🏆</div><h4>Top 5 Careers</h4><p>See your top 5 matches with precise percentage scores, ranked from best fit down.</p><a href="fields" class="more">Learn more →</a></div>
        <div class="feature-card"><div class="icon">🛠️</div><h4>Skill Gap Analysis</h4><p>Discover exactly which skills you need to improve — prioritized by impact.</p><a href="fields" class="more">Learn more →</a></div>
        <div class="feature-card"><div class="icon">🚀</div><h4>Learning Roadmap</h4><p>7-step roadmap from foundation to senior roles — tailored to your top match.</p><a href="fields" class="more">Learn more →</a></div>
        <div class="feature-card"><div class="icon">🔐</div><h4>Secure Accounts</h4><p>BCrypt password hashing and secure server-side sessions keep your data safe.</p><a href="register.jsp" class="more">Learn more →</a></div>
        <div class="feature-card"><div class="icon">💾</div><h4>Assessment History</h4><p>Every assessment saved to your dashboard so you can compare over time.</p><a href="fields" class="more">Learn more →</a></div>
    </div>
</section>

<section class="about" id="about">
    <div class="about-inner">
        <div>
            <span class="eyebrow">About</span>
            <h3>Built to end <span>career confusion</span> for good.</h3>
            <p>CareerPath AI guides students from a broad field choice to a personalized career match using a field-specific quiz, AI-style matching, skill-gap analysis, and learning roadmaps.</p>
            <ul class="check-list">
                <li>Field-first journey — start with what you're curious about</li>
                <li>15 focused questions per field — no endless forms</li>
                <li>Top 5 career matches with precise percentage scores</li>
                <li>Skills to improve + 7-step roadmap for your #1 match</li>
            </ul>
            <div class="about-tags">
                <span>Java</span><span>JSP</span><span>Servlets</span>
                <span>PostgreSQL</span><span>BCrypt</span><span>Cosine Similarity</span>
            </div>
        </div>
        <div class="quote">
            <p>I took the Health assessment and got matched with Cardiology at 94%. I never would have considered it before — now it's my dream specialty.</p>
            <div class="who">
                <span class="av">V</span>
                <div><strong>Vidurshini R.</strong><br><span style="font-size:12.5px">HNDIT Student, SLIATE Badulla</span></div>
            </div>
        </div>
    </div>
</section>

<section class="cta-wrap">
    <div class="cta">
        <h2>Ready to find your career path?</h2>
        <p>Take the free assessment now — it takes less than 5 minutes.</p>
        <c:choose>
            <c:when test="${not empty sessionScope.loggedUser}">
                <a href="fields" class="btn">Start Assessment →</a>
            </c:when>
            <c:otherwise>
                <a href="register.jsp" class="btn">Create Free Account →</a>
            </c:otherwise>
        </c:choose>
        <div class="reassure">
            <span>No credit card</span>
            <span>4-minute assessment</span>
            <span>Save results forever</span>
        </div>
    </div>
</section>

<footer>
    <div>© 2026 CareerPath AI · Built with Java, JSP, Servlets &amp; PostgreSQL</div>
    <div class="flinks">
        <a href="index.jsp">Home</a>
        <a href="fields">Fields</a>
        <a href="#features">Features</a>
        <a href="#about">About</a>
    </div>
</footer>

<script>
const toggleBtn=document.getElementById('themeToggle');
function refreshIcon(){const t=document.documentElement.getAttribute('data-theme');toggleBtn.textContent=t==='dark'?'☀️':'🌙';}
refreshIcon();
toggleBtn.addEventListener('click',()=>{const cur=document.documentElement.getAttribute('data-theme');const next=cur==='dark'?'light':'dark';document.documentElement.setAttribute('data-theme',next);localStorage.setItem('theme',next);refreshIcon();});
const menuBtn=document.getElementById('menuBtn'),navLinks=document.getElementById('navLinks');
menuBtn.addEventListener('click',()=>navLinks.classList.toggle('open'));
(function(){
  const el=document.getElementById('typedQ');
  const lines=['Do you enjoy solving complex problems?','Are you comfortable working under pressure?','Do you like helping people directly?','Are you excited by new technologies?'];
  let li=0,ci=0,del=false;
  function tick(){
    const full=lines[li];
    if(!del){ci++;el.textContent=full.slice(0,ci);if(ci===full.length){del=true;setTimeout(tick,1600);return;}}
    else{ci--;el.textContent=full.slice(0,ci);if(ci===0){del=false;li=(li+1)%lines.length;}}
    setTimeout(tick,del?26:52);
  }
  tick();
})();
(function(){
  const btns=document.querySelectorAll('.hero-visual .scale div');
  let i=2;
  setInterval(()=>{btns.forEach(b=>b.classList.remove('on'));btns[i].classList.add('on');i=(i+1)%btns.length;},1500);
})();
</script>
</body>
</html>