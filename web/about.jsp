<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>About · CareerPath AI</title>
<script>(function(){var t=localStorage.getItem('theme')||'light';document.documentElement.setAttribute('data-theme',t);})();</script>
<style>
:root{
  --bg:#fff;
  --surface:#f5f7fb;
  --text:#0f172a;
  --muted:#64748b;
  --primary:#4f46e5;
  --primary-hover:#4338ca;
  --border:#e5e7eb;
  --card:#fff;
  --shadow:0 4px 20px rgba(0,0,0,.06);
  --shadow-lg:0 12px 40px rgba(0,0,0,.08);
  --streak:rgba(79,70,229,.10);
  --glow:rgba(79,70,229,.14);
}
[data-theme="dark"]{
  --bg:#0f172a;
  --surface:#1e293b;
  --text:#f1f5f9;
  --muted:#94a3b8;
  --primary:#818cf8;
  --primary-hover:#a5b4fc;
  --border:#334155;
  --card:#1e293b;
  --shadow:0 4px 20px rgba(0,0,0,.4);
  --shadow-lg:0 12px 40px rgba(0,0,0,.55);
  --streak:rgba(129,140,248,.10);
  --glow:rgba(129,140,248,.16);
}
*{box-sizing:border-box;margin:0;padding:0}
html,body{width:100%;min-height:100%;overflow-x:hidden}
body{
  font-family:'Inter',system-ui,-apple-system,sans-serif;
  background:var(--bg);color:var(--text);
  line-height:1.6;transition:.3s;
}

/* ============ BACKGROUND ============ */
.bg-anim{position:fixed;inset:0;z-index:-1;pointer-events:none;overflow:hidden}
.bg-anim .ambient{position:absolute;top:-20%;left:-10%;width:120%;height:80%;
  background:radial-gradient(ellipse at 30% 30%, var(--glow), transparent 60%),
             radial-gradient(ellipse at 80% 70%, var(--streak), transparent 60%);
  filter:blur(60px);animation:ambientPulse 18s ease-in-out infinite alternate}
@keyframes ambientPulse{0%{transform:translate(0,0) scale(1)}100%{transform:translate(2%,3%) scale(1.08)}}
.bg-anim .streak{position:absolute;top:-50%;height:200%;width:22%;
  background:linear-gradient(180deg,transparent,var(--streak) 45%,transparent);
  filter:blur(50px);transform:rotate(18deg)}
.bg-anim .streak.s1{left:-10%;animation:sweep1 20s ease-in-out infinite}
.bg-anim .streak.s2{left:40%;animation:sweep2 26s ease-in-out infinite;width:16%;opacity:.8}
.bg-anim .streak.s3{left:85%;animation:sweep3 32s ease-in-out infinite;width:14%;opacity:.7}
@keyframes sweep1{0%,100%{transform:rotate(18deg) translateX(0)}50%{transform:rotate(18deg) translateX(60px)}}
@keyframes sweep2{0%,100%{transform:rotate(18deg) translateX(0)}50%{transform:rotate(18deg) translateX(-80px)}}
@keyframes sweep3{0%,100%{transform:rotate(18deg) translateX(0)}50%{transform:rotate(18deg) translateX(-40px)}}

/* ============ NAVBAR ============ */
.navbar{display:flex;justify-content:space-between;align-items:center;
  padding:16px 48px;background:var(--card);
  border-bottom:1px solid var(--border);
  position:sticky;top:0;z-index:100;
  backdrop-filter:blur(10px);-webkit-backdrop-filter:blur(10px)}
.logo{font-weight:700;font-size:18px;color:var(--primary);text-decoration:none;
  display:flex;gap:8px;align-items:center}
.nav-links{display:flex;gap:4px;align-items:center;flex-wrap:wrap}
.nav-links a{color:var(--text);text-decoration:none;font-weight:500;font-size:14px;
  padding:8px 14px;border-radius:8px;transition:.2s}
.nav-links a:hover,.nav-links a.active{color:var(--primary);background:var(--surface)}
.theme-toggle{background:var(--surface);border:1px solid var(--border);color:var(--text);
  padding:8px 14px;border-radius:999px;cursor:pointer;margin-left:6px;font-size:14px}
.theme-toggle:hover{border-color:var(--primary);color:var(--primary)}
.menu-btn{display:none;background:var(--surface);border:1px solid var(--border);
  color:var(--text);padding:8px 12px;border-radius:8px;cursor:pointer;
  font-size:16px;margin-left:6px}

/* ============ SHARED ============ */
.section{max-width:1180px;margin:0 auto;padding:0 48px}
.eyebrow{display:inline-block;color:var(--primary);font-size:12px;font-weight:700;
  letter-spacing:2px;text-transform:uppercase;margin-bottom:14px}
h2{font-size:38px;font-weight:800;letter-spacing:-1.2px;line-height:1.15;
  margin-bottom:14px;max-width:720px}
h2 span{color:var(--primary)}

/* ============ HERO ============ */
.hero{padding:80px 48px 40px;max-width:1180px;margin:0 auto;text-align:center}
.hero h1{
  font-size:clamp(38px,5vw,62px);font-weight:800;line-height:1.05;
  letter-spacing:-2px;margin-bottom:22px;max-width:900px;margin-left:auto;margin-right:auto;
}
.hero h1 span{color:var(--primary)}
.hero p{
  color:var(--muted);font-size:17px;line-height:1.7;
  max-width:680px;margin:0 auto 32px;
}
.hero-actions{display:flex;justify-content:center;gap:12px;flex-wrap:wrap}

/* ============ BUTTONS ============ */
.btn{display:inline-block;padding:13px 26px;border-radius:10px;font-weight:600;
  font-size:15px;text-decoration:none;cursor:pointer;border:none;transition:.2s}
.btn-primary{background:var(--primary);color:#fff}
.btn-primary:hover{background:var(--primary-hover);transform:translateY(-1px);
  box-shadow:0 8px 20px rgba(79,70,229,.25)}
.btn-outline{background:transparent;border:1.5px solid var(--border);color:var(--text)}
.btn-outline:hover{border-color:var(--primary);color:var(--primary)}

/* ============ MISSION (SPLIT) ============ */
.mission{padding:80px 0;display:grid;grid-template-columns:1fr 1fr;gap:60px;
  align-items:center}
.mission p{color:var(--muted);font-size:16px;line-height:1.75;margin-bottom:16px}
.mission p strong{color:var(--text);font-weight:600}
.mission-visual{
  background:var(--card);border:1px solid var(--border);border-radius:22px;
  padding:40px;box-shadow:var(--shadow-lg);position:relative;overflow:hidden
}
.mission-visual::before{
  content:'';position:absolute;top:0;left:0;bottom:0;width:4px;
  background:linear-gradient(180deg,var(--primary),transparent)
}
.mission-visual .quote{
  font-size:20px;font-weight:600;line-height:1.5;letter-spacing:-.3px;
  margin-bottom:24px
}
.mission-visual .who{display:flex;align-items:center;gap:12px;
  font-size:14px;color:var(--muted)}
.mission-visual .who .av{width:44px;height:44px;border-radius:12px;
  background:linear-gradient(135deg,var(--primary),var(--primary-hover));
  color:#fff;display:flex;align-items:center;justify-content:center;
  font-weight:700;font-size:15px}
.mission-visual .who strong{color:var(--text);font-weight:700;display:block;
  font-size:14.5px}

/* ============ HOW IT WORKS ============ */
.how{padding:80px 0 40px}
.how-head{text-align:center;margin-bottom:52px}
.how-head h2{margin-left:auto;margin-right:auto}
.how-head p{color:var(--muted);font-size:16px;max-width:620px;margin:0 auto}
.steps{display:grid;grid-template-columns:repeat(3,1fr);gap:24px}
.step{
  background:var(--card);border:1px solid var(--border);
  border-radius:18px;padding:32px 28px;
  box-shadow:var(--shadow);transition:.25s;position:relative
}
.step:hover{transform:translateY(-4px);border-color:var(--primary);
  box-shadow:var(--shadow-lg)}
.step .num{width:44px;height:44px;border-radius:12px;
  background:linear-gradient(135deg,var(--primary),var(--primary-hover));
  color:#fff;display:flex;align-items:center;justify-content:center;
  font-weight:800;font-size:16px;margin-bottom:20px}
.step h3{font-size:19px;font-weight:700;letter-spacing:-.3px;margin-bottom:10px}
.step p{color:var(--muted);font-size:14.5px;line-height:1.65}

/* ============ ALGORITHM ============ */
.algo{padding:60px 0 80px}
.algo-inner{
  background:var(--card);border:1px solid var(--border);
  border-radius:22px;padding:56px;box-shadow:var(--shadow);
  display:grid;grid-template-columns:1.1fr 1fr;gap:56px;align-items:center
}
.algo p{color:var(--muted);font-size:15.5px;line-height:1.75;margin-bottom:16px}
.algo p strong{color:var(--text);font-weight:600}
.formula{
  background:var(--surface);border:1px solid var(--border);
  border-radius:16px;padding:28px;
  font-family:ui-monospace,Menlo,Consolas,monospace;
  font-size:14px;color:var(--text);line-height:1.8
}
.formula .label{color:var(--muted);font-size:12px;
  text-transform:uppercase;letter-spacing:1.2px;
  font-family:'Inter',sans-serif;font-weight:700;margin-bottom:14px;display:block}
.formula .op{color:var(--primary);font-weight:700}
.formula .cmt{color:var(--muted);font-style:italic}

/* ============ VALUES ============ */
.values{padding:40px 0 80px}
.values-head{text-align:center;margin-bottom:48px}
.values-head h2{margin-left:auto;margin-right:auto}
.values-head p{color:var(--muted);font-size:16px;max-width:600px;margin:0 auto}
.values-grid{display:grid;grid-template-columns:repeat(4,1fr);gap:20px}
.value{
  background:var(--card);border:1px solid var(--border);
  border-radius:16px;padding:26px 22px;text-align:center;
  box-shadow:var(--shadow);transition:.25s
}
.value:hover{transform:translateY(-3px);border-color:var(--primary)}
.value .icon{font-size:30px;margin-bottom:14px;display:block}
.value h3{font-size:15.5px;font-weight:700;margin-bottom:6px}
.value p{color:var(--muted);font-size:13.5px;line-height:1.55}

/* ============ TECH ============ */
.tech{padding:40px 0 80px;text-align:center}
.tech h2{margin-left:auto;margin-right:auto}
.tech p{color:var(--muted);font-size:16px;max-width:560px;margin:0 auto 34px}
.tech-grid{display:flex;flex-wrap:wrap;gap:12px;justify-content:center}
.tech-badge{
  background:var(--card);border:1px solid var(--border);
  border-radius:12px;padding:14px 22px;
  box-shadow:var(--shadow);transition:.2s;
  font-weight:600;font-size:14px;
  display:inline-flex;align-items:center;gap:10px
}
.tech-badge:hover{border-color:var(--primary);transform:translateY(-2px)}
.tech-badge .ic{font-size:18px}

/* ============ CTA ============ */
.cta-wrap{padding:40px 48px 90px;max-width:1180px;margin:0 auto}
.cta{
  background:linear-gradient(135deg,var(--primary),var(--primary-hover));
  color:#fff;border-radius:26px;padding:64px 48px;
  text-align:center;box-shadow:var(--shadow-lg);
  position:relative;overflow:hidden
}
.cta::before{
  content:'';position:absolute;top:-50%;left:-50%;width:200%;height:200%;
  background:radial-gradient(circle at 30% 30%,rgba(255,255,255,.10),transparent 50%);
  animation:ctaShift 12s ease-in-out infinite alternate
}
@keyframes ctaShift{0%{transform:translate(0,0)}100%{transform:translate(5%,5%)}}
.cta h2{color:#fff;font-size:34px;margin-bottom:14px;position:relative;
  margin-left:auto;margin-right:auto}
.cta p{opacity:.92;font-size:16px;margin-bottom:28px;position:relative}
.cta .btn{background:#fff;color:var(--primary);font-weight:700;padding:14px 32px;
  position:relative}
.cta .btn:hover{background:#f1f5f9;transform:translateY(-2px)}

/* ============ FOOTER ============ */
footer{
  border-top:1px solid var(--border);
  padding:32px 48px;
  display:flex;justify-content:space-between;align-items:center;
  flex-wrap:wrap;gap:16px;color:var(--muted);font-size:13.5px;
  max-width:1180px;margin:0 auto;
}
footer .flinks{display:flex;gap:22px;flex-wrap:wrap}
footer .flinks a{color:var(--muted);text-decoration:none;transition:.2s}
footer .flinks a:hover{color:var(--primary)}

/* ============ RESPONSIVE ============ */
@media(max-width:1000px){
  .navbar{padding:14px 20px}
  .nav-links{display:none}
  .nav-links.open{display:flex;flex-direction:column;align-items:flex-start;
    position:absolute;top:100%;left:0;right:0;background:var(--card);
    border-bottom:1px solid var(--border);padding:16px 20px;gap:4px}
  .nav-links.open a{padding:10px 12px;width:100%}
  .menu-btn{display:block}
  .section,.hero,.cta-wrap,footer{padding-left:24px;padding-right:24px}
  h2{font-size:28px}
  .mission{grid-template-columns:1fr;gap:40px}
  .steps{grid-template-columns:1fr;gap:16px}
  .algo-inner{grid-template-columns:1fr;padding:32px;gap:32px}
  .values-grid{grid-template-columns:repeat(2,1fr)}
  .cta{padding:48px 24px}
  .cta h2{font-size:26px}
}
@media(max-width:560px){
  .hero h1{font-size:32px;letter-spacing:-1px}
  .hero p{font-size:15.5px}
  .values-grid{grid-template-columns:1fr}
  footer{flex-direction:column;text-align:center;padding:24px 20px}
}
</style>
</head>
<body>

<div class="bg-anim" aria-hidden="true">
  <div class="ambient"></div>
  <div class="streak s1"></div>
  <div class="streak s2"></div>
  <div class="streak s3"></div>
</div>

<nav class="navbar">
  <a href="index.jsp" class="logo">🎯 CareerPath AI</a>
  <div class="nav-links" id="navLinks">
    <a href="index.jsp">Home</a>
    <a href="${pageContext.request.contextPath}/fields">Fields</a>
    <a href="about.jsp" class="active">About</a>
    <a href="contact.jsp">Contact</a>
    <c:choose>
      <c:when test="${not empty sessionScope.loggedUser}">
        <a href="${pageContext.request.contextPath}/dashboard">Dashboard</a>
        <a href="${pageContext.request.contextPath}/logout">Logout</a>
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

<!-- ============ HERO ============ -->
<section class="hero">
  <h1>We help students find the <span>career</span> that actually fits them.</h1>
  <p>CareerPath AI replaces guesswork with data. Answer 15 field-specific questions, and our algorithm matches you against every career in that field using a transparent cosine-similarity engine — then shows you the skills to improve and the roadmap to get there.</p>
  <div class="hero-actions">
    <a href="${pageContext.request.contextPath}/fields" class="btn btn-primary">Start Your Assessment →</a>
    <a href="index.jsp" class="btn btn-outline">Back to Home</a>
  </div>
</section>

<!-- ============ MISSION ============ -->
<section class="section mission">
  <div>
    <span class="eyebrow">Our Mission</span>
    <h2>Career clarity for <span>every student</span>.</h2>
    <p>Choosing a career is one of the biggest decisions of your life — and yet most students make it based on what their friends do, what their parents expect, or what sounds impressive.</p>
    <p><strong>CareerPath AI exists to change that.</strong> We believe every student deserves a data-driven, personalized answer to the question: <em>"What should I actually do with my life?"</em></p>
    <p>Our platform is free, private, and built with students in mind — from the moment you pick a field to the moment you see your top 5 matches, skills to close, and a step-by-step roadmap.</p>
  </div>

  <div class="mission-visual">
    <div class="quote">"I took the Health assessment and matched with Cardiology at 94%. I'd never considered it before — now it's my dream specialty."</div>
    <div class="who">
      <span class="av">V</span>
      <div>
        <strong>Vidurshini R.</strong>
        HNDIT Student, SLIATE Badulla
      </div>
    </div>
  </div>
</section>

<!-- ============ HOW IT WORKS ============ -->
<section class="section how">
  <div class="how-head">
    <span class="eyebrow">How It Works</span>
    <h2>Three steps. Four minutes. Real answers.</h2>
    <p>No endless forms. No vague personality quizzes. Just a focused assessment built around the field you actually care about.</p>
  </div>

  <div class="steps">
    <div class="step">
      <div class="num">1</div>
      <h3>Pick a field</h3>
      <p>Choose from 50+ career fields — Health, IT, Law, Engineering, Business, Arts, and more. You only answer questions relevant to that field.</p>
    </div>
    <div class="step">
      <div class="num">2</div>
      <h3>Answer 15 questions</h3>
      <p>Field-specific statements rated on a simple 1–5 scale. Be honest — the algorithm rewards it with a more accurate match.</p>
    </div>
    <div class="step">
      <div class="num">3</div>
      <h3>See your top 5</h3>
      <p>We rank every career in that field against your answers using cosine similarity, and show the top 5 with match percentages.</p>
    </div>
  </div>
</section>

<!-- ============ ALGORITHM ============ -->
<section class="section algo">
  <div class="algo-inner">
    <div>
      <span class="eyebrow">The Algorithm</span>
      <h2>We show you <span>exactly how</span> the match is calculated.</h2>
      <p>No black boxes. Every career has a weighted profile across the 15 field questions. Your answers form a vector too.</p>
      <p><strong>We compute the cosine similarity between the two vectors</strong> — a standard, well-understood way to measure how closely two sets of preferences align. The closer the angle between them, the higher your match percentage.</p>
      <p>This means your result is <strong>explainable and repeatable</strong>. Different answers → different matches. No randomness.</p>
    </div>
    <div class="formula">
      <span class="label">Cosine similarity</span>
      <div>similarity <span class="op">=</span></div>
      <div>&nbsp;&nbsp;(A · B) <span class="op">/</span> (‖A‖ × ‖B‖)</div>
      <br>
      <div class="cmt">// A = your answer vector (1..5)</div>
      <div class="cmt">// B = career's weight vector</div>
      <br>
      <div>match&nbsp;% <span class="op">=</span> similarity × 100</div>
    </div>
  </div>
</section>

<!-- ============ VALUES ============ -->
<section class="section values">
  <div class="values-head">
    <span class="eyebrow">Our Values</span>
    <h2>What we stand for.</h2>
    <p>Four principles that guide every decision we make about the platform.</p>
  </div>

  <div class="values-grid">
    <div class="value">
      <span class="icon">🔍</span>
      <h3>Transparency</h3>
      <p>We show you how every score is calculated. No hidden rules, no unexplained results.</p>
    </div>
    <div class="value">
      <span class="icon">🔐</span>
      <h3>Privacy</h3>
      <p>Your data is yours. Passwords are BCrypt-hashed, sessions are server-side, results are only visible to you.</p>
    </div>
    <div class="value">
      <span class="icon">🎯</span>
      <h3>Focus</h3>
      <p>15 questions, not 200. We designed CareerPath AI to respect your time while giving accurate results.</p>
    </div>
    <div class="value">
      <span class="icon">♾️</span>
      <h3>Free Forever</h3>
      <p>No credit card, no premium tier, no ads. Career discovery should never be paywalled.</p>
    </div>
  </div>
</section>

<!-- ============ TECH ============ -->
<section class="section tech">
  <span class="eyebrow">Built With</span>
  <h2>The stack behind CareerPath AI.</h2>
  <p>A modern Java web stack, built from scratch — no heavy frameworks, no magic.</p>

  <div class="tech-grid">
    <div class="tech-badge"><span class="ic">☕</span> Java 17</div>
    <div class="tech-badge"><span class="ic">🌐</span> JSP &amp; Servlets</div>
    <div class="tech-badge"><span class="ic">🐘</span> PostgreSQL</div>
    <div class="tech-badge"><span class="ic">🚀</span> Apache Tomcat</div>
    <div class="tech-badge"><span class="ic">🎨</span> HTML / CSS / JS</div>
    <div class="tech-badge"><span class="ic">🔐</span> BCrypt</div>
    <div class="tech-badge"><span class="ic">📐</span> Cosine Similarity</div>
    <div class="tech-badge"><span class="ic">💡</span> NetBeans IDE</div>
  </div>
</section>

<!-- ============ CTA ============ -->
<section class="cta-wrap">
  <div class="cta">
    <h2>Ready to find your path?</h2>
    <p>It takes less than 5 minutes to discover your top 5 career matches.</p>
    <a href="${pageContext.request.contextPath}/fields" class="btn">Start Your Free Assessment →</a>
  </div>
</section>

<footer>
  <div>© 2026 CareerPath AI · Built with Java, JSP, Servlets &amp; PostgreSQL</div>
  <div class="flinks">
    <a href="index.jsp">Home</a>
    <a href="${pageContext.request.contextPath}/fields">Fields</a>
    <a href="about.jsp">About</a>
    <a href="contact.jsp">Contact</a>
  </div>
</footer>

<script>
const btn=document.getElementById('themeToggle');
function rf(){btn.textContent=document.documentElement.getAttribute('data-theme')==='dark'?'☀️':'🌙';}
rf();
btn.addEventListener('click',()=>{
  const c=document.documentElement.getAttribute('data-theme');
  const n=c==='dark'?'light':'dark';
  document.documentElement.setAttribute('data-theme',n);
  localStorage.setItem('theme',n);
  rf();
});
const menuBtn=document.getElementById('menuBtn'),navLinks=document.getElementById('navLinks');
menuBtn.addEventListener('click',()=>navLinks.classList.toggle('open'));
</script>
</body>
</html>