<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Choose Field · CareerPath AI</title>
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
.wrap{max-width:1280px;margin:0 auto;padding:60px 48px 90px}
.crumb{font-size:13.5px;color:var(--muted);margin-bottom:14px}
.crumb a{color:var(--primary);text-decoration:none}
.crumb span{margin:0 6px}
.head{margin-bottom:44px;max-width:760px}
.eyebrow{display:inline-flex;align-items:center;gap:8px;color:var(--primary);font-size:12px;font-weight:700;letter-spacing:2px;text-transform:uppercase;margin-bottom:14px}
.eyebrow::before{content:'';width:24px;height:2px;background:var(--primary);border-radius:2px}
h1{font-size:44px;font-weight:800;letter-spacing:-1.8px;line-height:1.1;margin-bottom:14px}
h1 span{color:var(--primary)}
.sub{color:var(--muted);font-size:17px;line-height:1.65;max-width:640px}
.search-wrap{margin:36px 0 40px;max-width:520px;position:relative}
.search-wrap input{width:100%;padding:14px 18px 14px 46px;border-radius:14px;border:1.5px solid var(--border);background:var(--card);color:var(--text);font-size:15px;font-family:inherit;outline:none;transition:.2s;box-shadow:var(--shadow)}
.search-wrap input:focus{border-color:var(--primary);box-shadow:0 0 0 4px rgba(79,70,229,.12)}
.search-wrap::before{content:'🔍';position:absolute;left:18px;top:50%;transform:translateY(-50%);font-size:15px;opacity:.6}
.search-wrap .hint{font-size:12.5px;color:var(--muted);margin-top:8px;padding-left:4px}
.stats-row{display:grid;grid-template-columns:repeat(4,1fr);gap:18px;margin-bottom:48px}
.stat-mini{background:var(--card);border:1px solid var(--border);border-radius:14px;padding:20px;box-shadow:var(--shadow);transition:transform .2s,border-color .2s}
.stat-mini:hover{transform:translateY(-2px);border-color:var(--primary)}
.stat-mini .num{font-size:26px;font-weight:800;color:var(--primary);letter-spacing:-1px;line-height:1}
.stat-mini .lbl{color:var(--muted);font-size:13px;font-weight:600;margin-top:8px}
.grid{display:grid;grid-template-columns:repeat(4,1fr);gap:20px}
.card{background:var(--card);border:1px solid var(--border);border-radius:20px;padding:26px;text-decoration:none;color:var(--text);box-shadow:var(--shadow);transition:all .25s cubic-bezier(.22,1,.36,1);position:relative;overflow:hidden;display:flex;flex-direction:column;min-height:200px}
.card::before{content:'';position:absolute;top:0;left:0;right:0;height:3px;background:linear-gradient(90deg,var(--primary),var(--primary-hover));transform:scaleX(0);transform-origin:left;transition:transform .3s}
.card:hover{transform:translateY(-6px);border-color:var(--primary);box-shadow:var(--shadow-lg)}
.card:hover::before{transform:scaleX(1)}
.card .icon{width:58px;height:58px;border-radius:16px;background:var(--surface);border:1px solid var(--border);display:flex;align-items:center;justify-content:center;font-size:28px;margin-bottom:16px;transition:transform .3s cubic-bezier(.22,1,.36,1)}
.card:hover .icon{transform:scale(1.1) rotate(-6deg);border-color:var(--primary)}
.card h3{font-size:17px;font-weight:700;letter-spacing:-.3px;margin-bottom:8px}
.card p{color:var(--muted);font-size:13.5px;line-height:1.55;flex:1;margin-bottom:14px;display:-webkit-box;-webkit-line-clamp:3;-webkit-box-orient:vertical;overflow:hidden}
.card .meta{display:flex;justify-content:space-between;align-items:center;padding-top:14px;border-top:1px solid var(--border);font-size:12.5px;color:var(--muted)}
.card .meta .q{display:inline-flex;align-items:center;gap:5px;font-weight:500}
.card .meta .cta{color:var(--primary);font-weight:700;display:inline-flex;align-items:center;gap:5px;transition:gap .25s}
.card:hover .meta .cta{gap:10px}
.empty{padding:80px 20px;text-align:center;color:var(--muted);border:1px dashed var(--border);border-radius:18px;background:var(--card);grid-column:1/-1}
.empty .icon{font-size:48px;margin-bottom:16px}
.empty h3{font-size:20px;font-weight:700;color:var(--text);margin-bottom:8px}
.empty p{font-size:14.5px}
.cta-strip{margin-top:60px;background:var(--card);border:1px solid var(--border);border-radius:22px;padding:36px 42px;box-shadow:var(--shadow);display:flex;justify-content:space-between;align-items:center;gap:26px;flex-wrap:wrap;position:relative;overflow:hidden}
.cta-strip::before{content:'';position:absolute;top:0;left:0;bottom:0;width:4px;background:linear-gradient(180deg,var(--primary),transparent)}
.cta-strip .info{max-width:640px}
.cta-strip h3{font-size:22px;font-weight:800;letter-spacing:-.5px;margin-bottom:8px}
.cta-strip p{color:var(--muted);font-size:14.5px;line-height:1.6}
.btn{padding:14px 30px;border-radius:12px;font-weight:600;font-size:15px;text-decoration:none;cursor:pointer;border:none;transition:.2s;display:inline-flex;align-items:center;gap:8px}
.btn-primary{background:var(--primary);color:#fff}
.btn-primary:hover{background:var(--primary-hover);transform:translateY(-1px);box-shadow:0 8px 20px rgba(79,70,229,.25)}
@media(max-width:1100px){.grid{grid-template-columns:repeat(3,1fr)}.stats-row{grid-template-columns:repeat(2,1fr)}}
@media(max-width:900px){.navbar{padding:14px 20px}.nav-links{display:none}.nav-links.open{display:flex;flex-direction:column;align-items:flex-start;position:absolute;top:100%;left:0;right:0;background:var(--card);border-bottom:1px solid var(--border);padding:16px 20px;gap:4px;z-index:200}.nav-links.open a{padding:10px 12px;width:100%}.menu-btn{display:block}.wrap{padding:40px 24px 60px}h1{font-size:32px;letter-spacing:-1px}.sub{font-size:15.5px}.grid{grid-template-columns:repeat(2,1fr)}.cta-strip{padding:28px 24px}}
@media(max-width:560px){.grid{grid-template-columns:1fr}.stats-row{grid-template-columns:1fr}h1{font-size:26px}.card{padding:22px}.card .icon{width:52px;height:52px;font-size:24px}}
</style>
</head>
<body>

<div class="bg-anim" aria-hidden="true"><div class="ambient"></div><div class="streak s1"></div><div class="streak s2"></div><div class="streak s3"></div></div>

<nav class="navbar">
    <a href="index.jsp" class="logo">🎯 CareerPath AI</a>
    <div class="nav-links" id="navLinks">
        <a href="index.jsp">Home</a>
        <a href="fields" class="active">Fields</a>
        <a href="dashboard">Dashboard</a>
        <a href="profile">Profile</a>
        <a href="logout">Logout</a>
        <button class="theme-toggle" id="themeToggle">🌙</button>
    </div>
    <button class="menu-btn" id="menuBtn">☰</button>
</nav>

<div class="wrap">
    <div class="crumb"><a href="dashboard">Dashboard</a><span>/</span><span style="color:var(--text);font-weight:600">Choose Field</span></div>
    <div class="head">
        <span class="eyebrow">Step 1 of 3 · Choose your field</span>
        <h1>What <span>field</span> are you curious about?</h1>
        <p class="sub">Pick any of the 50+ fields below. We'll then ask you 15 tailored questions and match you against every career inside that field.</p>
    </div>

    <div class="search-wrap">
        <input type="text" id="searchInput" placeholder="Search a field (e.g. Health, IT, Law)…" autocomplete="off">
        <div class="hint">Type to filter fields instantly.</div>
    </div>

    <div class="stats-row">
        <div class="stat-mini"><div class="num">${empty fields ? '50+' : fields.size()}</div><div class="lbl">Career Fields</div></div>
        <div class="stat-mini"><div class="num">15</div><div class="lbl">Questions per Field</div></div>
        <div class="stat-mini"><div class="num">20</div><div class="lbl">Careers per Field</div></div>
        <div class="stat-mini"><div class="num">5</div><div class="lbl">Top Matches Shown</div></div>
    </div>

    <div class="grid" id="fieldGrid">
        <c:forEach var="f" items="${fields}">
            <a href="${pageContext.request.contextPath}/quiz?fieldId=${f.fieldId}" class="card" data-name="${f.fieldName}">
                <div class="icon">${empty f.icon ? '📚' : f.icon}</div>
                <h3>${f.fieldName}</h3>
                <p>${f.description}</p>
                <div class="meta">
                    <span class="q">📝 15 questions</span>
                    <span class="cta">Start →</span>
                </div>
            </a>
        </c:forEach>
        <c:if test="${empty fields}">
            <div class="empty">
                <div class="icon">📭</div>
                <h3>No fields found</h3>
                <p>Please make sure the database has been seeded. Run the schema.sql from pgAdmin first.</p>
            </div>
        </c:if>
    </div>

    <c:if test="${not empty fields}">
        <div class="cta-strip">
            <div class="info">
                <h3>Not sure where to start?</h3>
                <p>Health and IT are the most popular fields. Law, Business, and Engineering are close behind — pick anything that sparks curiosity, you can always retake.</p>
            </div>
            <a href="${pageContext.request.contextPath}/quiz?fieldId=1" class="btn btn-primary">Try Health first →</a>
        </div>
    </c:if>
</div>

<script>
const btn=document.getElementById('themeToggle');
function rf(){btn.textContent=document.documentElement.getAttribute('data-theme')==='dark'?'☀️':'🌙';}
rf();
btn.addEventListener('click',()=>{const c=document.documentElement.getAttribute('data-theme');const n=c==='dark'?'light':'dark';document.documentElement.setAttribute('data-theme',n);localStorage.setItem('theme',n);rf();});
const menuBtn=document.getElementById('menuBtn'),navLinks=document.getElementById('navLinks');
menuBtn.addEventListener('click',()=>navLinks.classList.toggle('open'));
const searchInput=document.getElementById('searchInput');
const grid=document.getElementById('fieldGrid');
searchInput.addEventListener('input',()=>{
    const q=searchInput.value.trim().toLowerCase();
    const cards=grid.querySelectorAll('.card');
    let visible=0;
    cards.forEach(card=>{
        const name=(card.getAttribute('data-name')||'').toLowerCase();
        if(q==='' || name.includes(q)){card.style.display='';visible++;}
        else{card.style.display='none';}
    });
    let emptyHint=grid.querySelector('.search-empty');
    if(visible===0 && !emptyHint){
        const div=document.createElement('div');
        div.className='empty search-empty';
        div.innerHTML='<div class="icon">🔍</div><h3>No matching field</h3><p>Try another keyword.</p>';
        grid.appendChild(div);
    } else if(visible>0 && emptyHint){emptyHint.remove();}
});
</script>
</body>
</html>