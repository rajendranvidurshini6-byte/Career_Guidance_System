<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sign Up · CareerPath AI</title>
<script>(function(){var t=localStorage.getItem('theme')||'light';document.documentElement.setAttribute('data-theme',t);})();</script>
<style>
:root{
  --bg:#f4f6fb;
  --card:#ffffff;
  --text:#0f172a;
  --muted:#64748b;
  --primary:#4f46e5;
  --primary-h:#4338ca;
  --border:#e5e7eb;
  --input-bg:#f8fafc;
  --panel-1:#4f46e5;
  --panel-2:#6d28d9;
  --error:#dc2626;
  --shadow-card:0 20px 50px rgba(15,23,42,.10), 0 4px 14px rgba(79,70,229,.08);
}
[data-theme="dark"]{
  --bg:#0a1020;
  --card:#0f1a2e;
  --text:#f1f5f9;
  --muted:#94a3b8;
  --primary:#818cf8;
  --primary-h:#a5b4fc;
  --border:#1e293b;
  --input-bg:#0a1424;
  --panel-1:#3730a3;
  --panel-2:#6d28d9;
  --error:#f87171;
  --shadow-card:0 20px 50px rgba(0,0,0,.5), 0 4px 14px rgba(0,0,0,.35);
}
*{box-sizing:border-box;margin:0;padding:0}
html,body{width:100%;min-height:100%}
body{
  font-family:'Inter',system-ui,-apple-system,sans-serif;
  background:var(--bg);color:var(--text);
  transition:.3s;
  min-height:100vh;
  display:flex;align-items:center;justify-content:center;
  padding:40px 20px;
}

/* ============ TOP BAR ============ */
.top-bar{
  position:fixed;top:0;left:0;right:0;z-index:100;
  display:flex;justify-content:space-between;align-items:center;
  padding:14px 28px;
  background:var(--card);
  border-bottom:1px solid var(--border);
}
.top-bar .brand{
  font-weight:700;font-size:15px;color:var(--text);
  text-decoration:none;display:flex;align-items:center;gap:9px;
}
.top-bar .brand .dot{
  width:26px;height:26px;border-radius:8px;
  background:linear-gradient(135deg,var(--primary),#7c3aed);
  display:flex;align-items:center;justify-content:center;
  font-size:12px;color:#fff;
}
.theme-toggle{
  background:var(--input-bg);border:1px solid var(--border);
  color:var(--text);padding:7px 13px;border-radius:999px;
  cursor:pointer;font-size:13px;transition:.2s;
}
.theme-toggle:hover{border-color:var(--primary);color:var(--primary)}

/* ============ CARD ============ */
.shell{
  width:100%;max-width:960px;
  background:var(--card);
  border-radius:20px;
  box-shadow:var(--shadow-card);
  overflow:hidden;
  display:grid;
  grid-template-columns:0.9fr 1.1fr;
  min-height:600px;
  margin-top:40px;
  animation:cardIn .7s cubic-bezier(.22,1,.36,1) both;
}
@keyframes cardIn{
  0%{opacity:0;transform:translateY(16px)}
  100%{opacity:1;transform:translateY(0)}
}

/* ============ LEFT PANEL ============ */
.visual{
  background:linear-gradient(150deg,var(--panel-1),var(--panel-2));
  color:#fff;padding:44px 36px;
  display:flex;flex-direction:column;justify-content:space-between;
  position:relative;overflow:hidden;
}
.visual::before{
  content:'';position:absolute;width:380px;height:380px;border-radius:50%;
  background:rgba(255,255,255,.06);top:-120px;right:-140px;
}
.visual::after{
  content:'';position:absolute;width:300px;height:300px;border-radius:50%;
  background:rgba(255,255,255,.05);bottom:-140px;left:-100px;
}
.visual > *{position:relative;z-index:1}

.visual .tag{
  display:inline-flex;align-items:center;gap:7px;
  padding:5px 11px;border-radius:100px;
  background:rgba(255,255,255,.14);
  font-size:11.5px;font-weight:600;
  width:fit-content;margin-bottom:26px;
}

.visual h2{
  font-size:28px;font-weight:800;line-height:1.2;
  letter-spacing:-.6px;margin-bottom:14px;
}
.visual p{
  font-size:14px;line-height:1.65;
  color:rgba(255,255,255,.85);max-width:320px;
}

.visual .foot{
  font-size:12px;color:rgba(255,255,255,.7);
  display:flex;align-items:center;gap:7px;
}
.visual .foot::before{
  content:'';width:6px;height:6px;border-radius:50%;
  background:#4ade80;
}

/* ============ RIGHT PANEL ============ */
.form-panel{
  padding:48px 44px;
  display:flex;flex-direction:column;justify-content:center;
}

.form-panel .head{margin-bottom:24px}
.form-panel .head h1{
  font-size:24px;font-weight:800;letter-spacing:-.5px;
  margin-bottom:6px;
}
.form-panel .head p{
  color:var(--muted);font-size:14px;line-height:1.55;
}

.msg{
  padding:10px 14px;border-radius:10px;font-size:13px;
  margin-bottom:16px;
  background:rgba(220,38,38,.08);color:var(--error);
  border:1px solid rgba(220,38,38,.22);
}

.field{margin-bottom:14px}
.field label{
  display:block;font-size:12.5px;font-weight:600;
  color:var(--text);margin-bottom:6px;
}
.field .input-wrap{position:relative}
.field .input-wrap .icon{
  position:absolute;left:14px;top:50%;transform:translateY(-50%);
  font-size:14px;color:var(--muted);opacity:.7;pointer-events:none;
}
.field input{
  width:100%;
  padding:12px 14px 12px 40px;
  background:var(--input-bg);
  border:1.5px solid var(--border);
  border-radius:10px;
  color:var(--text);
  font-size:14px;font-family:inherit;
  outline:none;transition:.2s;
}
.field input:focus{
  border-color:var(--primary);
  background:var(--card);
  box-shadow:0 0 0 3px rgba(79,70,229,.10);
}
.field input::placeholder{color:var(--muted);opacity:.6}

.field .pwd-toggle{
  position:absolute;right:12px;top:50%;transform:translateY(-50%);
  font-size:11px;font-weight:700;letter-spacing:.8px;
  color:var(--muted);cursor:pointer;user-select:none;
  text-transform:uppercase;
}
.field .pwd-toggle:hover{color:var(--primary)}

/* Password strength */
.strength{
  display:grid;grid-template-columns:repeat(4,1fr);gap:5px;
  margin-top:7px;
}
.strength-bar{height:3px;border-radius:2px;background:var(--border);transition:background .3s}
.strength-bar.on-weak{background:#ef4444}
.strength-bar.on-fair{background:#f59e0b}
.strength-bar.on-good{background:#22c55e}
.strength-bar.on-strong{background:var(--primary)}

.btn{
  width:100%;padding:13px;margin-top:16px;
  background:var(--primary);color:#fff;
  border:none;border-radius:10px;
  font-size:14.5px;font-weight:600;
  cursor:pointer;letter-spacing:.2px;
  transition:.2s;font-family:inherit;
}
.btn:hover{background:var(--primary-h)}

.bottom{
  text-align:center;font-size:13px;color:var(--muted);
  margin-top:16px;
}
.bottom a{color:var(--primary);font-weight:600;text-decoration:none}
.bottom a:hover{text-decoration:underline}

.legal{
  margin-top:14px;padding-top:12px;
  border-top:1px solid var(--border);
  font-size:11px;color:var(--muted);
  text-align:center;line-height:1.55;
}
.legal a{color:var(--primary);text-decoration:none;font-weight:600}

/* ============ RESPONSIVE ============ */
@media(max-width:900px){
  body{padding:80px 16px 30px}
  .shell{grid-template-columns:1fr;max-width:480px;min-height:auto;border-radius:16px;margin-top:0}
  .visual{padding:32px 26px 26px;text-align:center;align-items:center}
  .visual h2{font-size:22px}
  .visual p{font-size:13px;max-width:100%}
  .visual .foot{display:none}
  .form-panel{padding:32px 26px 34px}
  .form-panel .head h1{font-size:21px}
}
@media(max-width:480px){
  .top-bar{padding:12px 18px}
  .visual{padding:26px 20px 22px}
  .visual h2{font-size:19px}
  .visual .tag{font-size:11px;margin-bottom:18px}
  .form-panel{padding:26px 20px 28px}
  .form-panel .head h1{font-size:19px}
  .field input{padding:11px 12px 11px 38px;font-size:13.5px}
  .field .input-wrap .icon{left:12px}
}
</style>
</head>
<body>

<div class="top-bar">
  <a href="index.jsp" class="brand"><span class="dot">🎯</span> CareerPath AI</a>
  <button class="theme-toggle" id="themeToggle">🌙</button>
</div>

<div class="shell">

  <!-- LEFT -->
  <div class="visual">
    <div>
      <span class="tag">✨ Get started</span>
      <h2>Create your account.</h2>
      <p>Join thousands of students discovering their ideal career through AI-driven matching, skill gap analysis, and personalized roadmaps.</p>
    </div>
    <div class="foot">Free forever · No credit card</div>
  </div>

  <!-- RIGHT -->
  <div class="form-panel">
    <div class="head">
      <h1>Sign up</h1>
      <p>Create your free account to start exploring careers.</p>
    </div>

    <c:if test="${not empty error}">
      <div class="msg">⚠️ ${error}</div>
    </c:if>

    <form action="${pageContext.request.contextPath}/register" method="post"
          autocomplete="off" onsubmit="return validate()">

      <div class="field">
        <label for="fullName">Full name</label>
        <div class="input-wrap">
          <span class="icon">👤</span>
          <input type="text" id="fullName" name="fullName" required
                 value="${not empty fullName ? fullName : ''}"
                 placeholder="Your full name">
        </div>
      </div>

      <div class="field">
        <label for="email">Email address</label>
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
                 minlength="6" placeholder="Min 6 characters"
                 oninput="checkStrength()">
          <span class="pwd-toggle" onclick="togglePwd('password', this)">Show</span>
        </div>
        <div class="strength">
          <div class="strength-bar" id="s1"></div>
          <div class="strength-bar" id="s2"></div>
          <div class="strength-bar" id="s3"></div>
          <div class="strength-bar" id="s4"></div>
        </div>
      </div>

      <div class="field">
        <label for="confirmPassword">Confirm password</label>
        <div class="input-wrap">
          <span class="icon">🔒</span>
          <input type="password" id="confirmPassword" name="confirmPassword" required
                 minlength="6" placeholder="Re-enter password">
          <span class="pwd-toggle" onclick="togglePwd('confirmPassword', this)">Show</span>
        </div>
      </div>

      <button type="submit" class="btn">Create Account</button>
    </form>

    <div class="bottom">
      Already have an account? <a href="login.jsp">Sign in</a>
    </div>

    <div class="legal">
      By creating an account you agree to our <a href="#">Terms</a> &amp; <a href="#">Privacy Policy</a>.
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

function togglePwd(id, el){
  const p=document.getElementById(id);
  if(p.type==='password'){p.type='text';el.textContent='Hide';}
  else{p.type='password';el.textContent='Show';}
}

function checkStrength(){
  const v=document.getElementById('password').value;
  const bars=['s1','s2','s3','s4'].map(id=>document.getElementById(id));
  bars.forEach(b=>b.className='strength-bar');
  let score=0;
  if(v.length>=6)score++;
  if(v.length>=10)score++;
  if(/[A-Z]/.test(v) && /[a-z]/.test(v))score++;
  if(/[0-9]/.test(v) || /[^A-Za-z0-9]/.test(v))score++;
  const cls=['on-weak','on-fair','on-good','on-strong'];
  for(let i=0;i<score;i++) bars[i].classList.add(cls[score-1]);
}

function validate(){
  const p=document.getElementById('password').value;
  const c=document.getElementById('confirmPassword').value;
  if(p!==c){alert('Passwords do not match!');return false;}
  if(p.length<6){alert('Password must be at least 6 characters.');return false;}
  return true;
}
</script>
</body>
</html>