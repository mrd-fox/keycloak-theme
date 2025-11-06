<!DOCTYPE html>
<html lang="${locale.currentLanguageTag}">
<head>
    <meta charset="UTF-8" />
    <title>${msg("updatePasswordTitle")} | Skillshub</title>
    <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />
    <link rel="stylesheet" href="${url.resourcesPath}/css/update-password-custom.css" />
</head>

<body>

<div class="update-wrapper">

    <div class="update-box">

        <!-- 🧠 Logo -->
        <div class="logo-container">
            <img src="${url.resourcesPath}/img/logo-skillshub.png" alt="Skillshub" />
        </div>

        <h1 class="form-title">${msg("updatePasswordTitle")}</h1>

        <!-- 🔔 Alert message -->
        <#if message?has_content>
            <div class="alert ${message.type}">
                ${kcSanitize(message.summary)?no_esc}
            </div>
        </#if>

        <!-- 🔐 Update Password Form -->
        <form id="kc-update-password-form" action="${url.loginAction}" method="post" class="update-form">

            <div class="form-group">
                <label for="password-new">${msg("passwordNew")}</label>
                <input type="password"
                       id="password-new"
                       name="password-new"
                       placeholder="${msg('passwordNew')}"
                       required />
            </div>

            <div class="form-group">
                <label for="password-confirm">${msg("passwordConfirm")}</label>
                <input type="password"
                       id="password-confirm"
                       name="password-confirm"
                       placeholder="${msg('passwordConfirm')}"
                       required />
            </div>

            <div class="checkbox-group">
                <input type="checkbox" id="logout-sessions" name="logout-sessions" value="on" />
                <label for="logout-sessions">${msg("logoutOtherSessions")}</label>
            </div>

            <button type="submit" id="kc-update-password" class="btn-submit">
                ${msg("doSubmit")}
            </button>
        </form>

        <a href="${url.loginUrl}" class="back-link">${msg("backToLogin")}</a>
    </div>

</div>

</body>
</html>
