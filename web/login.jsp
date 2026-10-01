<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sign In · CareerPath AI</title>
<script>(function(){var t=localStorage.getItem('theme')||'light';document.documentElement.setAttribute('data-theme',t);})();</script>
<style>
:root{
  --bg:#eef1f6;
  --card:#ffffff;
  --text:#111827;
  --muted:#6b7280;
  --primary:#4f46e5;
  --primary-h:#4338ca;
  --border:#e5e7eb;
  --input-bg:#f8fafc;
  --panel-1:#4f46e5;
  --panel-2:#7c3aed;
  --panel-3:#a855f7;
  --error:#dc2626;
  --success:#16a34a;
  --shadow-card:0 30px 60px rgba(79,70,229,.20), 0 10px 30px rgba(15,23,42,.08);
}
[data-theme="dark"]{
  --bg:#070d1c;
  --card:#0f1a2e;
  --text:#f1f5f9;
  --muted:#94a3b8;
  --primary:#818cf8;
  --primary-h:#a5b4fc;
  --border:#1e293b;
  --input-bg:#0a1424;
  --panel-1:#4338ca;
  --panel-2:#6d28d9;
  --panel-3:#7e22ce;
  --error:#f87171;
  --success:#4ade80;
  --shadow-card:0 30px 60px rgba(0,0,0,.5), 0 10px 30px rgba(0,0,0,.35);
}
*{box-sizing:border-box;margin:0;padding:0}
html,body{width:100%;min-height:100%;overflow-x:hidden}
body{
  font-family:'Inter',system-ui,-apple-system,sans-serif;
  background:var(--bg);color:var(--text);
  transition:.3s;
  min-height:100vh;
  display:flex;align-items:center;justify-content:center;
  padding:60px 24px;
}

/* ============ BACKGROUND ============ */
.bg-anim{position:fixed;inset:0;z-index:-1;pointer-events:none;overflow:hidden}
.bg-anim::before{content:'';position:absolute;width:600px;height:600px;
  background:radial-gradient(circle,rgba(79,70,229,.20),transparent 65%);
  top:-180px;left:-160px;filter:blur(60px)}
.bg-anim::after{content:'';position:absolute;width:500px;height:500px;
  background:radial-gradient(circle,rgba(168,85,247,.18),transparent 65%);
  bottom:-180px;right:-140px;filter:blur(60px)}
[data-theme="dark"] .bg-anim::before{background:radial-gradient(circle,rgba(99,102,241,.28),transparent 65%)}
[data-theme="dark"] .bg-anim::after{background:radial-gradient(circle,rgba(168,85,247,.22),transparent 65%)}

/* ============ TOP BAR ============ */
.top-bar{position:fixed;top:24px;left:0;right:0;z-index:100;
  display:flex;justify-content:center;padding:0 24px}
.top-bar-inner{
  width:100%;max-width:1040px;
  display:flex;justify-content:space-between;align-items:center;
}
.top-bar .brand{
  font-weight:700;font-size:16px;color:var(--text);
  text-decoration:none;display:flex;align-items:center;gap:8px;
}
.top-bar .brand .dot{
  width:28px;height:28px;border-radius:9px;
  background:linear-gradient(135deg,var(--panel-1),var(--panel-3));
  display:flex;align-items:center;justify-content:center;
  font-size:13px;color:#fff;
}
.theme-toggle{
  background:var(--card);border:1px solid var(--border);
  color:var(--text);padding:8px 14px;border-radius:999px;
  cursor:pointer;font-size:14px;
  box-shadow:0 4px 12px rgba(0,0,0,.06);
}
.theme-toggle:hover{border-color:var(--primary);color:var(--primary)}

/* ============ CARD SHELL ============ */
.shell{
  width:100%;max-width:1040px;
  background:var(--card);
  border-radius:28px;
  box-shadow:var(--shadow-card);
  overflow:hidden;
  display:grid;
  grid-template-columns:1fr 1fr;
  min-height:620px;
  position:relative;
  animation:cardIn .8s cubic-bezier(.22,1,.36,1) both;
}
@keyframes cardIn{
  0%{opacity:0;transform:translateY(24px) scale(.97)}
  100%{opacity:1;transform:translateY(0) scale(1)}
}

/* ============ LEFT — ILLUSTRATION PANEL ============ */
.visual{
  background:linear-gradient(135deg,var(--panel-1) 0%,var(--panel-2) 50%,var(--panel-3) 100%);
  position:relative;overflow:hidden;padding:56px 48px;
  display:flex;flex-direction:column;justify-content:space-between;
  color:#fff;
}
/* Decorative shapes */
.visual .circle-1{
  position:absolute;width:340px;height:340px;border-radius:50%;
  background:rgba(255,255,255,.10);top:-100px;left:-100px;
}
.visual .circle-2{
  position:absolute;width:420px;height:420px;border-radius:50%;
  background:rgba(255,255,255,.06);bottom:-160px;right:-140px;
}
.visual .circle-3{
  position:absolute;width:160px;height:160px;border-radius:50%;
  background:rgba(255,255,255,.08);top:45%;left:25%;
}
.visual .grid-dots{
  position:absolute;inset:0;
  background-image:radial-gradient(rgba(255,255,255,.14) 1px,transparent 1px);
  background-size:22px 22px;
  opacity:.6;
}
.visual > *{position:relative;z-index:1}

.visual .top-mark{
  display:flex;align-items:center;gap:10px;
  font-weight:700;font-size:15px;letter-spacing:.3px;
}
.visual .top-mark .mark{
  width:34px;height:34px;border-radius:10px;
  background:rgba(255,255,255,.20);
  display:flex;align-items:center;justify-content:center;
  font-size:15px;
}

.visual .center-block h1{
  font-size:38px;font-weight:800;line-height:1.1;
  letter-spacing:-1.2px;margin-bottom:16px;
}
.visual .center-block p{
  font-size:15px;line-height:1.7;color:rgba(255,255,255,.9);
  max-width:340px;margin-bottom:26px;
}
.visual .center-block .mini-stats{
  display:flex;gap:22px;flex-wrap:wrap;
}
.visual .center-block .mini-stat{
  display:flex;flex-direction:column;gap:2px;
}
.visual .center-block .mini-stat .n{
  font-size:20px;font-weight:800;letter-spacing:-.5px;
}
.visual .center-block .mini-stat .l{
  font-size:11.5px;color:rgba(255,255,255,.75);
  font-weight:600;letter-spacing:.4px;text-transform:uppercase;
}

.visual .bottom-note{
  font-size:12.5px;color:rgba(255,255,255,.7);
  display:flex;align-items:center;gap:8px;
}
.visual .bottom-note::before{
  content:'';width:6px;height:6px;border-radius:50%;
  background:#4ade80;
  box-shadow:0 0 0 4px rgba(74,222,128,.2);
}

/* ============ RIGHT — FORM PANEL ============ */
.form-panel{
  padding:56px 56px;
  display:flex;flex-direction:column;justify-content:center;
  background:var(--card);
}
.form-panel .form-head{margin-bottom:32px}
.form-panel .form-head h2{
  font-size:30px;font-weight:800;letter-spacing:-1px;
  margin-bottom:8px;color:var(--text);
}
.form-panel .form-head p{
  color:var(--muted);font-size:14.5px;line-height:1.6;
}

/* Messages */
.msg{padding:12px 16px;border-radius:12px;font-size:13.5px;
  margin-bottom:18px;display:flex;align-items:center;gap:10px;
  font-weight:500}
.msg-err{background:rgba(220,38,38,.08);color:var(--error);
  border:1px solid rgba(220,38,38,.22)}
.msg-ok{background:rgba(22,163,74,.08);color:var(--success);
  border:1px solid rgba(22,163,74,.22)}

/* Inputs — pill style */
.field{margin-bottom:18px}
.field label{
  display:block;font-size:12.5px;font-weight:600;
  color:var(--muted);margin-bottom:8px;
  letter-spacing:.3px;text-transform:uppercase;
}
.field .input-wrap{position:relative}
.field .input-wrap .icon{
  position:absolute;left:18px;top:50%;transform:translateY(-50%);
  font-size:15px;color:var(--muted);opacity:.75;pointer-events:none;
}
.field input{
  width:100%;
  padding:15px 18px 15px 46px;
  background:var(--input-bg);
  border:1.5px solid var(--border);
  border-radius:14px;
  color:var(--text);
  font-size:15px;font-family:inherit;
  outline:none;
  transition:all .2s;
}
.field input:focus{
  border-color:var(--primary);
  background:var(--card);
  box-shadow:0 0 0 4px rgba(79,70,229,.12);
}
.field input::placeholder{color:var(--muted);opacity:.7}

.field .pwd-toggle{
  position:absolute;right:16px;top:50%;transform:translateY(-50%);
  font-size:12px;font-weight:700;letter-spacing:1px;
  color:var(--muted);cursor:pointer;user-select:none;
  text-transform:uppercase;
}
.field .pwd-toggle:hover{color:var(--primary)}

/* Remember + forgot row */
.row-between{
  display:flex;justify-content:space-between;align-items:center;
  font-size:13px;margin:4px 0 22px;flex-wrap:wrap;gap:8px;
}
.row-between label{
  display:flex;align-items:center;gap:8px;
  color:var(--muted);cursor:pointer;font-weight:500;
}
.row-between input[type="checkbox"]{
  width:15px;height:15px;accent-color:var(--primary);
  cursor:pointer;border-radius:4px;
}
.row-between a{
  color:var(--primary);font-weight:600;text-decoration:none;
}
.row-between a:hover{text-decoration:underline}

/* Primary button — pill style */
.btn{
  width:100%;
  padding:16px;
  background:linear-gradient(135deg,var(--primary),var(--primary-h));
  color:#fff;
  border:none;border-radius:14px;
  font-size:16px;font-weight:700;
  cursor:pointer;letter-spacing:.3px;
  transition:all .25s;
  font-family:inherit;
  box-shadow:0 12px 26px rgba(79,70,229,.35);
}
.btn:hover{
  transform:translateY(-2px);
  box-shadow:0 16px 34px rgba(79,70,229,.45);
}
.btn:active{transform:translateY(0)}

/* Divider */
.divider{
  display:flex;align-items:center;gap:14px;
  color:var(--muted);font-size:12px;
  margin:26px 0 20px;letter-spacing:.5px;
}
.divider::before,.divider::after{
  content:'';flex:1;height:1px;background:var(--border);
}

/* Bottom link */
.bottom{
  text-align:center;font-size:13.5px;color:var(--muted);
}
.bottom a{color:var(--primary);font-weight:700;text-decoration:none}
.bottom a:hover{text-decoration:underline}

/* ============ RESPONSIVE ============ */
@media(max-width:900px){
  .shell{grid-template-columns:1fr;max-width:520px;min-height:auto;border-radius:24px}
  .visual{padding:44px 32px 40px;min-height:auto}
  .visual .center-block h1{font-size:28px}
  .visual .center-block p{font-size:13.5px;margin-bottom:20px;max-width:100%}
  .visual .center-block .mini-stats{gap:18px}
  .visual .center-block .mini-stat .n{font-size:17px}
  .visual .bottom-note{display:none}
  .form-panel{padding:40px 28px 44px}
  .form-panel .form-head h2{font-size:24px}
}
@media(max-width:480px){
  body{padding:50px 14px}
  .visual{padding:36px 24px 32px}
  .visual .center-block h1{font-size:24px}
  .visual .top-mark{font-size:14px}
  .form-panel{padding:32px 22px 36px}
  .form-panel .form-head h2{font-size:21px}
  .field input{padding:14px 16px 14px 44px;font-size:14.5px}
  .field .input-wrap .icon{left:16px}
}
</style>
</head>
<body>

<div class="bg-anim" aria-hidden="true"></div>

<div class="top-bar">
  <div class="top-bar-inner">
    <a href="index.jsp" class="brand"><span class="dot">🎯</span> CareerPath AI</a>
    <button class="theme-toggle" id="themeToggle">🌙</button>
  </div>
</div>

<div class="shell">

  <!-- LEFT ILLUSTRATION PANEL -->
  <div class="visual">
    <div class="circle-1"></div>
    <div class="circle-2"></div>
    <div class="circle-3"></div>
    <div class="grid-dots"></div>

    <div class="top-mark">
      <span class="mark">🎯</span> CareerPath AI
    </div>

    <div class="center-block">
      <h1>Welcome back.</h1>
      <p>Sign in to continue your career discovery journey. Your assessments, top matches, and personalized roadmaps are waiting for you.</p>

      <div class="mini-stats">
        <div class="mini-stat"><span class="n">50+</span><span class="l">Fields</span></div>
        <div class="mini-stat"><span class="n">1000+</span><span class="l">Careers</span></div>
        <div class="mini-stat"><span class="n">15</span><span class="l">Questions</span></div>
      </div>
    </div>

    <div class="bottom-note">All systems operational · Free forever</div>
  </div>

  <!-- RIGHT FORM PANEL -->
  <div class="form-panel">
    <div class="form-head">
      <h2>Sign in</h2>
      <p>Enter your details below to access your dashboard.</p>
    </div>

    <c:if test="${param.registered == '1'}">
      <div class="msg msg-ok">✅ Registration successful! Please login.</div>
    </c:if>
    <c:if test="${param.loggedout == '1'}">
      <div class="msg msg-ok">👋 You've been logged out.</div>
    </c:if>
    <c:if test="${not empty error}">
      <div class="msg msg-err">⚠️ ${error}</div>
    </c:if>

    <form action="${pageContext.request.contextPath}/login" method="post" autocomplete="off">
      <div class="field">
        <label for="email">Email Address</label>
        <div class="input-wrap">
          <span class="icon">📧</span>
          <input type="email" id="email" name="email" required
                 value="${not empty email ? email : ''}"
                 placeholder="you@example.com">
        </div>
      </div>

      <div class="field">
        <label for="password">Password</label>
        <div class="input-wrap">
          <span class="icon">🔒</span>
          <input type="password" id="password" name="password" required
                 placeholder="••••••••">
          <span class="pwd-toggle" id="pwdToggle" onclick="togglePwd()">Show</span>
        </div>
      </div>

      <div class="row-between">
        <label><input type="checkbox"> Remember me</label>
        <a href="#">Forgot password?</a>
      </div>

      <button type="submit" class="btn">Sign In →</button>
    </form>

    <div class="divider">OR</div>

    <div class="bottom">
      New here? <a href="register.jsp">Create an account</a>
    </div>
  </div>

</div>

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
function togglePwd(){
  const p=document.getElementById('password');
  const t=document.getElementById('pwdToggle');
  if(p.type==='password'){p.type='text';t.textContent='Hide';}
  else{p.type='password';t.textContent='Show';}
}
</script>
</body>
</html>