<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Analyzing · CareerPath AI</title>
<script>(function(){var t=localStorage.getItem('theme')||'light';document.documentElement.setAttribute('data-theme',t);})();</script>
<style>
:root{--bg:#fff;--surface:#f5f7fb;--text:#0f172a;--muted:#64748b;--primary:#4f46e5;--primary-hover:#4338ca;--border:#e5e7eb;--card:#fff;--streak:rgba(79,70,229,.10);--glow:rgba(79,70,229,.14)}
[data-theme="dark"]{--bg:#0f172a;--surface:#1e293b;--text:#f1f5f9;--muted:#94a3b8;--primary:#818cf8;--primary-hover:#a5b4fc;--border:#334155;--card:#1e293b;--streak:rgba(129,140,248,.10);--glow:rgba(129,140,248,.16)}
*{box-sizing:border-box;margin:0;padding:0}html,body{width:100%;height:100%}
body{font-family:'Inter',system-ui,sans-serif;background:var(--bg);color:var(--text);overflow:hidden}
.bg-anim{position:fixed;inset:0;z-index:-1;pointer-events:none;overflow:hidden}
.bg-anim .ambient{position:absolute;top:-20%;left:-10%;width:120%;height:80%;background:radial-gradient(ellipse at 30% 30%, var(--glow), transparent 60%),radial-gradient(ellipse at 80% 70%, var(--streak), transparent 60%);filter:blur(60px);animation:ambientPulse 18s ease-in-out infinite alternate}
@keyframes ambientPulse{0%{transform:translate(0,0) scale(1)}100%{transform:translate(2%,3%) scale(1.08)}}
.bg-anim .streak{position:absolute;top:-50%;height:200%;width:22%;background:linear-gradient(180deg,transparent,var(--streak) 45%,transparent);filter:blur(50px);transform:rotate(18deg)}
.bg-anim .streak.s1{left:-10%;animation:sweep1 20s ease-in-out infinite}
.bg-anim .streak.s2{left:40%;animation:sweep2 26s ease-in-out infinite;width:16%;opacity:.8}
@keyframes sweep1{0%,100%{transform:rotate(18deg) translateX(0)}50%{transform:rotate(18deg) translateX(60px)}}
@keyframes sweep2{0%,100%{transform:rotate(18deg) translateX(0)}50%{transform:rotate(18deg) translateX(-80px)}}
.center{height:100vh;display:flex;align-items:center;justify-content:center;flex-direction:column;text-align:center;padding:24px}
.spinner{width:90px;height:90px;border-radius:50%;position:relative;margin-bottom:34px}
.spinner::before,.spinner::after{content:'';position:absolute;inset:0;border-radius:50%;border:3px solid transparent;border-top-color:var(--primary);animation:spin 1s linear infinite}
.spinner::after{inset:12px;border-top-color:var(--primary-hover);animation-duration:1.6s;animation-direction:reverse}
@keyframes spin{to{transform:rotate(360deg)}}
h1{font-size:30px;font-weight:800;letter-spacing:-1px;margin-bottom:10px}
h1 span{color:var(--primary)}
.sub{color:var(--muted);font-size:15.5px;margin-bottom:34px;max-width:420px}
.steps{display:grid;gap:10px;max-width:360px;width:100%}
.step{display:flex;align-items:center;gap:12px;font-size:14px;color:var(--muted);padding:10px 14px;border-radius:10px;background:var(--surface);border:1px solid var(--border);opacity:.4;transition:opacity .4s}
.step.active{opacity:1;border-color:var(--primary);color:var(--text)}
.step.done{opacity:1;color:var(--text)}
.step .dot{width:9px;height:9px;border-radius:50%;background:var(--muted);flex-shrink:0}
.step.active .dot{background:var(--primary);animation:pulse 1s infinite}
.step.done .dot{background:#16a34a}
@keyframes pulse{0%,100%{transform:scale(1)}50%{transform:scale(1.5)}}
</style>
</head>
<body>
<div class="bg-anim" aria-hidden="true"><div class="ambient"></div><div class="streak s1"></div><div class="streak s2"></div></div>

<div class="center">
    <div class="spinner"></div>
    <h1>Analyzing <span>your answers</span>…</h1>
    <p class="sub">Our AI engine is matching your responses against every career in this field.</p>
    <div class="steps">
        <div class="step active" id="s1"><span class="dot"></span> Loading your responses</div>
        <div class="step" id="s2"><span class="dot"></span> Comparing with career profiles</div>
        <div class="step" id="s3"><span class="dot"></span> Ranking top 5 matches</div>
        <div class="step" id="s4"><span class="dot"></span> Preparing skills &amp; roadmap</div>
    </div>
</div>

<script>
(function(){
    const ids=['s1','s2','s3','s4'];
    let i=0;
    const t=setInterval(()=>{
        if(i>0)document.getElementById(ids[i-1]).classList.replace('active','done');
        if(i<ids.length){document.getElementById(ids[i]).classList.add('active');i++;}
        else{clearInterval(t);
            const url=new URLSearchParams(location.search).get('next');
            if(url) location.href=url;
        }
    },900);
})();
</script>
</body>
</html>