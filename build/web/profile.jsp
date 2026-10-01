<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Error · CareerPath AI</title>
<script>(function(){var t=localStorage.getItem('theme')||'light';document.documentElement.setAttribute('data-theme',t);})();</script>
<style>
:root{--bg:#fff;--surface:#f5f7fb;--text:#0f172a;--muted:#64748b;--primary:#4f46e5;--border:#e5e7eb;--card:#fff;--error:#dc2626}
[data-theme="dark"]{--bg:#0f172a;--surface:#1e293b;--text:#f1f5f9;--muted:#94a3b8;--primary:#818cf8;--border:#334155;--card:#1e293b;--error:#f87171}
*{box-sizing:border-box;margin:0;padding:0}
body{font-family:'Inter',system-ui,sans-serif;background:var(--bg);color:var(--text);line-height:1.6;min-height:100vh;display:flex;align-items:center;justify-content:center;padding:24px}
.card{max-width:720px;width:100%;background:var(--card);border:1px solid var(--border);border-radius:24px;padding:48px 40px;box-shadow:0 20px 60px rgba(0,0,0,.15);text-align:center;position:relative;overflow:hidden}
.card::before{content:'';position:absolute;top:0;left:0;right:0;height:4px;background:linear-gradient(90deg,var(--primary),var(--primary))}
.emoji{font-size:56px;margin-bottom:16px}
h1{font-size:32px;font-weight:800;letter-spacing:-1px;margin-bottom:10px}
h1 span{color:var(--primary)}
.sub{color:var(--muted);font-size:16px;margin-bottom:26px}
.detail{background:var(--surface);border:1px solid var(--border);border-radius:12px;padding:16px 20px;font-size:13.5px;color:var(--muted);text-align:left;word-break:break-word;margin-bottom:26px;font-family:ui-monospace,Menlo,monospace;max-height:280px;overflow:auto}
.detail strong{color:var(--error);display:block;margin-bottom:6px;font-family:'Inter',sans-serif;font-size:13px}
.actions{display:flex;gap:12px;justify-content:center;flex-wrap:wrap}
.btn{padding:13px 26px;border-radius:11px;font-weight:600;font-size:15px;text-decoration:none;cursor:pointer;border:none;transition:.2s;display:inline-flex;align-items:center;gap:8px}
.btn-primary{background:var(--primary);color:#fff}
.btn-primary:hover{background:var(--primary);opacity:.9;transform:translateY(-1px)}
.btn-outline{background:transparent;border:1.5px solid var(--border);color:var(--text)}
.btn-outline:hover{border-color:var(--primary);color:var(--primary)}
</style>
</head>
<body>
<div class="card">
    <div class="emoji">⚠️</div>
    <h1>Something <span>went wrong</span></h1>
    <p class="sub">
        <c:out value="${not empty requestScope.errorMessage ? requestScope.errorMessage : 'An unexpected error occurred. Please try again.'}"/>
    </p>

    <c:if test="${not empty requestScope['javax.servlet.error.exception']}">
        <div class="detail">
            <strong>Exception:</strong>
            <c:out value="${requestScope['javax.servlet.error.exception']}"/>
        </div>
    </c:if>

    <c:if test="${not empty pageContext.exception}">
        <div class="detail">
            <strong>Exception:</strong>
            <c:out value="${pageContext.exception}"/>
            <br><br>
            <strong>Message:</strong>
            <c:out value="${pageContext.exception.message}"/>
        </div>
    </c:if>

    <div class="actions">
        <a href="index.jsp" class="btn btn-outline">← Home</a>
        <a href="${pageContext.request.contextPath}/fields" class="btn btn-primary">Try Again →</a>
    </div>
</div>
</body>
</html>