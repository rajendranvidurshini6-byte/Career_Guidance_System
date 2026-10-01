<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Your Matches · CareerPath AI</title>
<script>(function(){var t=localStorage.getItem('theme')||'light';document.documentElement.setAttribute('data-theme',t);})();</script>
<style>
:root{--bg:#fff;--surface:#f5f7fb;--text:#0f172a;--muted:#64748b;--primary:#4f46e5;--primary-hover:#4338ca;--border:#e5e7eb;--card:#fff;--shadow:0 4px 20px rgba(0,0,0,.06);--shadow-lg:0 12px 40px rgba(0,0,0,.08);--streak:rgba(79,70,229,.10);--glow:rgba(79,70,229,.14)}
[data-theme="dark"]{--bg:#0f172a;--surface:#1e293b;--text:#f1f5f9;--muted:#94a3b8;--primary:#818cf8;--primary-hover:#a5b4fc;--border:#334155;--card:#1e293b;--shadow:0 4px 20px rgba(0,0,0,.4);--shadow-lg:0 12px 40px rgba(0,0,0,.55);--streak:rgba(129,140,248,.10);--glow:rgba(129,140,248,.16)}
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
.navbar{display:flex;justify-content:space-between;align-items:center;padding:16px 48px;background:var(--card);border-bottom:1px solid var(--border);position:sticky;top:0;z-index:100}
.logo{font-weight:700;font-size:18px;color:var(--primary);text-decoration:none;display:flex;gap:8px;align-items:center}
.nav-links{display:flex;gap:4px;align-items:center}
.nav-links a{color:var(--text);text-decoration:none;font-weight:500;font-size:14px;padding:8px 14px;border-radius:8px}
.nav-links a:hover{color:var(--primary);background:var(--surface)}
.theme-toggle{background:var(--surface);border:1px solid var(--border);color:var(--text);padding:8px 14px;border-radius:999px;cursor:pointer;margin-left:6px}
.wrap{max-width:1180px;margin:0 auto;padding:50px 48px 90px}
.head{margin-bottom:40px}
.eyebrow{display:inline-block;color:var(--primary);font-size:12px;font-weight:700;letter-spacing:2px;text-transform:uppercase;margin-bottom:12px}
h1{font-size:42px;font-weight:800;letter-spacing:-1.5px;margin-bottom:10px}
h1 span{color:var(--primary)}
.sub{color:var(--muted);font-size:16px;max-width:640px}
.top-match{background:var(--card);border:1px solid var(--border);border-radius:24px;padding:36px;box-shadow:var(--shadow-lg);margin-bottom:36px;position:relative;overflow:hidden}
.top-match::before{content:'';position:absolute;top:0;left:0;right:0;height:4px;background:linear-gradient(90deg,var(--primary),var(--primary-hover))}
.tm-grid{display:grid;grid-template-columns:auto 1fr auto;gap:30px;align-items:center}
.tm-icon{width:84px;height:84px;border-radius:22px;background:var(--surface);border:1px solid var(--border);display:flex;align-items:center;justify-content:center;font-size:42px}
.tm-body h2{font-size:28px;font-weight:800;letter-spacing:-.8px;margin-bottom:6px}
.tm-body h2 span{color:var(--primary)}
.tm-body p{color:var(--muted);font-size:15px}
.tm-score{text-align:right}
.tm-score .num{font-size:52px;font-weight:800;color:var(--primary);letter-spacing:-3px;line-height:1}
.tm-score .lbl{color:var(--muted);font-size:12.5px;font-weight:600;letter-spacing:1px;text-transform:uppercase;margin-top:6px}
.actions-row{display:grid;grid-template-columns:repeat(3,1fr);gap:14px;margin-bottom:46px}
.action{background:var(--card);border:1px solid var(--border);border-radius:16px;padding:20px;text-decoration:none;color:var(--text);box-shadow:var(--shadow);transition:all .25s;display:flex;flex-direction:column;gap:6px}
.action:hover{transform:translateY(-4px);border-color:var(--primary);box-shadow:var(--shadow-lg)}
.action .icon{font-size:24px;margin-bottom:4px}
.action h4{font-size:15px;font-weight:700}
.action p{color:var(--muted);font-size:12.5px;line-height:1.5}
.sec-title{font-size:24px;font-weight:800;letter-spacing:-.6px;margin-bottom:6px}
.sec-sub{color:var(--muted);font-size:14.5px;margin-bottom:22px}
.rank-list{display:flex;flex-direction:column;gap:14px;margin-bottom:50px}
.rank{background:var(--card);border:1px solid var(--border);border-radius:16px;padding:22px;box-shadow:var(--shadow);display:grid;grid-template-columns:auto 1fr auto;gap:20px;align-items:center;transition:border-color .2s}
.rank:hover{border-color:var(--primary)}
.rank .pos{width:44px;height:44px;border-radius:12px;background:var(--surface);border:1px solid var(--border);display:flex;align-items:center;justify-content:center;font-weight:800;color:var(--primary);font-size:15px}
.rank .rank-icon{width:52px;height:52px;border-radius:14px;background:var(--surface);border:1px solid var(--border);display:flex;align-items:center;justify-content:center;font-size:24px;margin-right:6px}
.rank .head-row{display:flex;align-items:center;gap:14px;margin-bottom:6px}
.rank .info h4{font-size:16.5px;font-weight:700}
.rank .info p{color:var(--muted);font-size:13.5px;line-height:1.5}
.rank .bar-wrap{margin-top:10px;height:6px;background:var(--surface);border-radius:3px;overflow:hidden;border:1px solid var(--border)}
.rank .bar-wrap span{display:block;height:100%;background:linear-gradient(90deg,var(--primary),var(--primary-hover));border-radius:3px;transition:width .8s ease}
.rank .score{font-size:26px;font-weight:800;color:var(--primary);letter-spacing:-1px;text-align:right;min-width:80px}
.rank .score .unit{font-size:14px;color:var(--muted);display:block;font-weight:600;letter-spacing:0;margin-top:2px}
.rank.top{border-color:var(--primary);background:linear-gradient(180deg,rgba(79,70,229,.04),transparent 60%)}
.rank.top .pos{background:var(--primary);color:#fff;border-color:var(--primary)}
.two-col{display:grid;grid-template-columns:1fr 1fr;gap:22px;margin-bottom:50px}
.panel{background:var(--card);border:1px solid var(--border);border-radius:20px;padding:30px;box-shadow:var(--shadow)}
.panel .panel-head{display:flex;align-items:center;gap:12px;margin-bottom:20px}
.panel .panel-head .ic{width:44px;height:44px;border-radius:12px;background:var(--surface);border:1px solid var(--border);display:flex;align-items:center;justify-content:center;font-size:20px}
.panel .panel-head h3{font-size:18px;font-weight:800;letter-spacing:-.3px}
.panel .panel-head p{color:var(--muted);font-size:13px}
.skill-row{display:flex;justify-content:space-between;align-items:center;gap:14px;padding:14px 0;border-bottom:1px solid var(--border)}
.skill-row:last-child{border-bottom:none}
.skill-row .name{font-size:14.5px;font-weight:600}
.skill-row .tags{display:flex;gap:6px;flex-shrink:0}
.badge{font-size:11px;padding:4px 10px;border-radius:999px;font-weight:600;border:1px solid var(--border);background:var(--surface);color:var(--muted)}
.badge.high{color:#fff;background:#dc2626;border-color:#dc2626}
.badge.medium{color:#fff;background:#f59e0b;border-color:#f59e0b}
.badge.low{color:#fff;background:#16a34a;border-color:#16a34a}
.badge.adv{color:#fff;background:var(--primary);border-color:var(--primary)}
.badge.inter{background:var(--surface);color:var(--primary);border-color:var(--primary)}
.badge.beg{background:var(--surface);color:var(--muted);border-color:var(--border)}
.roadmap{list-style:none;position:relative;padding-left:8px;counter-reset:step}
.roadmap li{position:relative;padding:0 0 22px 40px;border-left:2px solid var(--border)}
.roadmap li:last-child{border-left-color:transparent;padding-bottom:0}
.roadmap li::before{content:counter(step);counter-increment:step;position:absolute;left:-16px;top:-4px;width:30px;height:30px;border-radius:50%;background:var(--primary);color:#fff;display:flex;align-items:center;justify-content:center;font-weight:800;font-size:12px;box-shadow:0 0 0 4px var(--bg)}
.roadmap li h4{font-size:15px;font-weight:700;margin-bottom:4px}
.roadmap li p{color:var(--muted);font-size:13.5px;line-height:1.55}
.empty{padding:60px 20px;text-align:center;color:var(--muted);border:1px dashed var(--border);border-radius:18px}
@media(max-width:900px){
  .navbar{padding:14px 20px}
  .nav-links a{padding:6px 10px;font-size:13px}
  .wrap{padding:30px 20px 60px}
  h1{font-size:30px}
  .tm-grid{grid-template-columns:1fr;text-align:center;gap:16px}
  .tm-icon{margin:0 auto}
  .tm-score{text-align:center}
  .actions-row{grid-template-columns:1fr}
  .two-col{grid-template-columns:1fr}
  .rank{grid-template-columns:36px 1fr;text-align:left}
  .rank .score{grid-column:2;text-align:left;font-size:22px;min-width:auto}
  .rank .rank-icon{width:44px;height:44px;font-size:20px}
}
</style>
</head>
<body>
<div class="bg-anim" aria-hidden="true"><div class="ambient"></div><div class="streak s1"></div><div class="streak s2"></div><div class="streak s3"></div></div>

<nav class="navbar">
    <a href="index.jsp" class="logo">🎯 CareerPath AI</a>
    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/fields">New Assessment</a>
        <a href="${pageContext.request.contextPath}/dashboard">Dashboard</a>
        <a href="${pageContext.request.contextPath}/profile">Profile</a>
        <button class="theme-toggle" id="themeToggle">🌙</button>
    </div>
</nav>

<div class="wrap">
    <div class="head">
        <span class="eyebrow">Step 3 of 3 · Your matches</span>
        <h1>Your top career matches are <span>ready</span></h1>
        <p class="sub">Based on your 15 answers, we compared you against every career in this field using cosine similarity. Here are the top 5 that fit you best.</p>
    </div>

    <c:if test="${not empty top}">
        <div class="top-match">
            <div class="tm-grid">
                <div class="tm-icon">${empty top.icon ? '🏆' : top.icon}</div>
                <div class="tm-body">
                    <h2>Your #1 match is <span>${top.careerName}</span></h2>
                    <p>${top.description}</p>
                </div>
                <div class="tm-score">
                    <div class="num"><fmt:formatNumber value="${top.matchScore}" maxFractionDigits="0"/>%</div>
                    <div class="lbl">Match score</div>
                </div>
            </div>
        </div>
    </c:if>

    <div class="actions-row">
        <a href="${pageContext.request.contextPath}/fields" class="action"><span class="icon">🔁</span><h4>Try another field</h4><p>Explore a different career area</p></a>
        <a href="${pageContext.request.contextPath}/dashboard" class="action"><span class="icon">💾</span><h4>Saved to dashboard</h4><p>View your assessment history</p></a>
        <a href="${pageContext.request.contextPath}/profile" class="action"><span class="icon">📊</span><h4>Compare results</h4><p>See past assessments</p></a>
    </div>

    <h2 class="sec-title">Top 5 careers for you</h2>
    <p class="sec-sub">Ranked by how closely your answers match each career's profile.</p>

    <div class="rank-list">
        <c:forEach var="c" items="${top5}" varStatus="s">
            <div class="rank ${s.index == 0 ? 'top' : ''}">
                <div class="pos">${s.index + 1}</div>
                <div class="info">
                    <div class="head-row">
                        <div class="rank-icon">${empty c.icon ? '🎓' : c.icon}</div>
                        <div><h4>${c.careerName}</h4></div>
                    </div>
                    <p>${c.description}</p>
                    <div class="bar-wrap"><span style="width:${c.matchScore}%"></span></div>
                </div>
                <div class="score"><fmt:formatNumber value="${c.matchScore}" maxFractionDigits="0"/>%<span class="unit">match</span></div>
            </div>
        </c:forEach>
        <c:if test="${empty top5}"><div class="empty">No results found. Please try again.</div></c:if>
    </div>

    <c:if test="${not empty top}">
        <h2 class="sec-title">What to do next</h2>
        <p class="sec-sub">Focus on these areas to become a strong candidate for <strong>${top.careerName}</strong>.</p>

        <div class="two-col">
            <div class="panel">
                <div class="panel-head">
                    <div class="ic">🛠️</div>
                    <div><h3>Skills to improve</h3><p>Prioritized by impact</p></div>
                </div>
                <c:choose>
                    <c:when test="${empty skills}"><p style="color:var(--muted);font-size:14px">No skills listed yet.</p></c:when>
                    <c:otherwise>
                        <c:forEach var="sk" items="${skills}">
                            <div class="skill-row">
                                <div class="name">${sk.skill}</div>
                                <div class="tags">
                                    <span class="badge ${sk.level == 'Advanced' ? 'adv' : ''}${sk.level == 'Intermediate' ? 'inter' : ''}${sk.level == 'Beginner' ? 'beg' : ''}">${sk.level}</span>
                                    <span class="badge ${sk.priority == 'High' ? 'high' : ''}${sk.priority == 'Medium' ? 'medium' : ''}${sk.priority == 'Low' ? 'low' : ''}">${sk.priority}</span>
                                </div>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="panel">
                <div class="panel-head">
                    <div class="ic">🚀</div>
                    <div><h3>Your roadmap</h3><p>7 steps to get there</p></div>
                </div>
                <c:choose>
                    <c:when test="${empty roadmap}"><p style="color:var(--muted);font-size:14px">No roadmap available yet.</p></c:when>
                    <c:otherwise>
                        <ul class="roadmap">
                            <c:forEach var="step" items="${roadmap}">
                                <li><h4>${step.title}</h4><p>${step.detail}</p></li>
                            </c:forEach>
                        </ul>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </c:if>

    <c:if test="${empty top}">
        <div class="empty"><p>No matches found. Please make sure you've answered all questions and try again.</p></div>
    </c:if>
</div>

<script>
const btn=document.getElementById('themeToggle');
function rf(){btn.textContent=document.documentElement.getAttribute('data-theme')==='dark'?'☀️':'🌙';}
rf();
btn.addEventListener('click',()=>{const c=document.documentElement.getAttribute('data-theme');const n=c==='dark'?'light':'dark';document.documentElement.setAttribute('data-theme',n);localStorage.setItem('theme',n);rf();});
window.addEventListener('load',()=>{
    document.querySelectorAll('.rank .bar-wrap span').forEach(el=>{
        const w=el.style.width;
        el.style.width='0%';
        setTimeout(()=>{el.style.width=w;},100);
    });
});
</script>
</body>
</html>