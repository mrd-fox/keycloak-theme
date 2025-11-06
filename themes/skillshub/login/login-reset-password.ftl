<!DOCTYPE html>
<html lang="${locale.currentLanguageTag}">
<head>
    <meta charset="UTF-8" />
    <title>${msg("emailForgotTitle")} | Skillshub</title>
    <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />
    <link rel="stylesheet" href="${url.resourcesPath}/css/reset-password.css" />
</head>

<body>

<div class="reset-wrapper">

    <div class="reset-box">

        <!-- 🌐 Lang selector -->

        <!-- 🧠 Logo -->
        <div class="logo-container">
            <img src="${url.resourcesPath}/img/logo-skillshub.png" alt="Skillshub" />
        </div>

        <h1 class="form-title">${msg("emailForgotTitle")}</h1>

        <!-- 🔔 Alert message -->
        <#if message?has_content>
            <div class="alert ${message.type}">
                ${kcSanitize(message.summary)?no_esc}
            </div>
        </#if>

        <!-- 🔐 Form -->
        <form id="kc-reset-password-form" action="${url.loginAction}" method="post" class="reset-form">
            <label for="username">${msg("email")}</label>
            <input type="email" id="username" name="username"
                   value="${(login.username!'')}"
                   placeholder="${msg('email')}" required />

            <button type="submit" id="kc-reset-password" class="btn-submit">
                ${msg("doSubmit")}
            </button>
        </form>

        <a href="${url.loginUrl}" class="back-link">${msg("backToLogin")}</a>
    </div>

</div>

</body>
</html>
