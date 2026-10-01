<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Assessment · ${field.fieldName}</title>
<script>(function(){var t=localStorage.getItem('theme')||'light';document.documentElement.setAttribute('data-theme',t);})();</script>
<style>
:root{--bg:#fff;--surface:#f5f7fb;--text:#0f172a;--muted:#64748b;--primary:#4f46e5;--primary-hover:#4338ca;--border:#e5e7eb;--card:#fff;--shadow:0 4px 20px rgba(0,0,0,.06);--streak:rgba(79,70,229,.10);--glow:rgba(79,70,229,.14)}
[data-theme="dark"]{--bg:#0f172a;--surface:#1e293b;--text:#f1f5f9;--muted:#94a3b8;--primary:#818cf8;--primary-hover:#a5b4fc;--border:#334155;--card:#1e293b;--shadow:0 4px 20px rgba(0,0,0,.4);--streak:rgba(129,140,248,.10);--glow:rgba(129,140,248,.16)}
*{box-sizing:border-box;margin:0;padding:0}html,body{width:100%;min-height:100%}
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
.nav-links{display:flex;gap:4px;align-items:center}
.nav-links a{color:var(--text);text-decoration:none;font-weight:500;font-size:14px;padding:8px 14px;border-radius:8px}
.nav-links a:hover{color:var(--primary);background:var(--surface)}
.theme-toggle{background:var(--surface);border:1px solid var(--border);color:var(--text);padding:8px 14px;border-radius:999px;cursor:pointer;margin-left:6px}
.wrap{max-width:920px;margin:0 auto;padding:50px 24px 90px}
.progress-wrap{margin-bottom:36px}
.progress-top{display:flex;justify-content:space-between;font-size:13px;color:var(--muted);font-weight:500;margin-bottom:10px}
.progress-bar{height:8px;background:var(--surface);border:1px solid var(--border);border-radius:999px;overflow:hidden}
.progress-bar span{display:block;height:100%;width:0;background:linear-gradient(90deg,var(--primary),var(--primary-hover));transition:width .3s}
.head{margin-bottom:36px}
.crumb{font-size:13.5px;color:var(--muted);margin-bottom:14px}
.crumb a{color:var(--primary);text-decoration:none}
.crumb span{margin:0 6px}
.eyebrow{display:inline-block;color:var(--primary);font-size:12px;font-weight:700;letter-spacing:2px;text-transform:uppercase;margin-bottom:12px}
h1{font-size:34px;font-weight:800;letter-spacing:-1px;margin-bottom:10px}
h1 span{color:var(--primary)}
.sub{color:var(--muted);font-size:15.5px}
.qlist{display:flex;flex-direction:column;gap:18px;margin-bottom:40px}
.qcard{background:var(--card);border:1px solid var(--border);border-radius:18px;padding:26px;box-shadow:var(--shadow);transition:border-color .25s}
.qcard:hover{border-color:var(--primary)}
.qhead{display:flex;align-items:flex-start;gap:14px;margin-bottom:20px}
.qnum{flex-shrink:0;width:34px;height:34px;border-radius:10px;background:var(--surface);border:1px solid var(--border);display:flex;align-items:center;justify-content:center;font-weight:800;font-size:14px;color:var(--primary)}
.qtext{font-size:16.5px;font-weight:600;line-height:1.5;padding-top:4px}
.scale{display:grid;grid-template-columns:repeat(5,1fr);gap:10px}
.scale label{display:flex;flex-direction:column;align-items:center;justify-content:center;padding:14px 8px;border-radius:12px;background:var(--surface);border:1.5px solid var(--border);cursor:pointer;transition:all .2s;text-align:center;user-select:none}
.scale label:hover{border-color:var(--primary);transform:translateY(-2px)}
.scale input{display:none}
.scale label:has(input:checked){background:var(--primary);border-color:var(--primary);color:#fff;box-shadow:0 8px 20px rgba(79,70,229,.25)}
.scale .val{font-size:18px;font-weight:800;line-height:1;margin-bottom:4px}
.scale .lbl{font-size:11.5px;font-weight:500;opacity:.85}
.actions{display:flex;justify-content:space-between;align-items:center;gap:14px;flex-wrap:wrap}
.btn{padding:14px 30px;border-radius:12px;font-weight:600;font-size:15px;cursor:pointer;border:none;transition:.2s;font-family:inherit;text-decoration:none;display:inline-flex;align-items:center;gap:8px}
.btn-primary{background:var(--primary);color:#fff}
.btn-primary:hover{background:var(--primary-hover);transform:translateY(-1px)}
.btn-primary:disabled{opacity:.5;cursor:not-allowed;transform:none}
.btn-outline{background:transparent;border:1.5px solid var(--border);color:var(--text)}
.btn-outline:hover{border-color:var(--primary);color:var(--primary)}
.hint{color:var(--muted);font-size:13.5px}
@media(max-width:700px){.navbar{padding:14px 20px}.nav-links a{padding:6px 10px;font-size:13px}.wrap{padding:30px 20px 60px}h1{font-size:26px}.scale{gap:6px}.scale label{padding:10px 4px}.scale .lbl{font-size:10px}}
</style>
</head>
<body>
<div class="bg-anim" aria-hidden="true"><div class="ambient"></div><div class="streak s1"></div><div class="streak s2"></div><div class="streak s3"></div></div>

<nav class="navbar">
    <a href="index.jsp" class="logo">🎯 CareerPath AI</a>
    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/fields">← Back to fields</a>
        <a href="${pageContext.request.contextPath}/dashboard">Dashboard</a>
        <button class="theme-toggle" id="themeToggle">🌙</button>
    </div>
</nav>

<div class="wrap">
    <div class="progress-wrap">
        <div class="progress-top"><span>Progress</span><span id="progTxt">0 / ${questions.size()} answered</span></div>
        <div class="progress-bar"><span id="progFill"></span></div>
    </div>

    <div class="head">
        <div class="crumb"><a href="${pageContext.request.contextPath}/fields">Fields</a><span>/</span><span style="color:var(--text);font-weight:600">${field.fieldName}</span></div>
        <span class="eyebrow">Step 2 of 3 · Field assessment</span>
        <h1>Tell us about your interest in <span>${field.fieldName}</span></h1>
        <p class="sub">Answer these 15 questions honestly. We'll match you with the top 5 careers in this field based on your responses.</p>
    </div>

    <form action="${pageContext.request.contextPath}/submitAssessment" method="post" id="quizForm" onsubmit="return checkAll()">
        <div class="qlist">
            <c:forEach var="q" items="${questions}" varStatus="s">
                <div class="qcard">
                    <div class="qhead">
                        <div class="qnum">${s.index + 1}</div>
                        <div class="qtext">${q.questionText}</div>
                    </div>
                    <div class="scale">
                        <c:forEach begin="1" end="5" var="v">
                            <label>
                                <input type="radio" name="q_${q.questionId}" value="${v}" required onchange="updateProgress()">
                                <span class="val">${v}</span>
                                <span class="lbl">
                                    <c:choose>
                                        <c:when test="${v == 1}">Strongly Disagree</c:when>
                                        <c:when test="${v == 2}">Disagree</c:when>
                                        <c:when test="${v == 3}">Neutral</c:when>
                                        <c:when test="${v == 4}">Agree</c:when>
                                        <c:when test="${v == 5}">Strongly Agree</c:when>
                                    </c:choose>
                                </span>
                            </label>
                        </c:forEach>
                    </div>
                </div>
            </c:forEach>
        </div>

        <div class="actions">
            <a href="${pageContext.request.contextPath}/fields" class="btn btn-outline">← Change field</a>
            <span class="hint" id="hintTxt">Answer all questions to see your top 5 careers.</span>
            <button type="submit" class="btn btn-primary" id="submitBtn" disabled>Get My Matches →</button>
        </div>
    </form>
</div>

<script>
const btn=document.getElementById('themeToggle');
function rf(){btn.textContent=document.documentElement.getAttribute('data-theme')==='dark'?'☀️':'🌙';}
rf();
btn.addEventListener('click',()=>{const c=document.documentElement.getAttribute('data-theme');const n=c==='dark'?'light':'dark';document.documentElement.setAttribute('data-theme',n);localStorage.setItem('theme',n);rf();});
const TOTAL=${questions.size()};
function updateProgress(){
    const answered=new Set();
    document.querySelectorAll('#quizForm input[type=radio]:checked').forEach(i=>answered.add(i.name));
    const done=answered.size;
    document.getElementById('progFill').style.width=((done/TOTAL)*100)+'%';
    document.getElementById('progTxt').textContent=done+' / '+TOTAL+' answered';
    const sb=document.getElementById('submitBtn');
    const hint=document.getElementById('hintTxt');
    if(done===TOTAL){sb.disabled=false;hint.textContent='All set! Click to see your matches.';hint.style.color='var(--primary)';}
    else{sb.disabled=true;hint.textContent='Answer all questions to see your top 5 careers.';hint.style.color='';}
}
function checkAll(){
    if(document.querySelectorAll('#quizForm input[type=radio]:checked').length<TOTAL){
        alert('Please answer all questions.');return false;
    }
    return true;
}
</script>
</body>
</html>