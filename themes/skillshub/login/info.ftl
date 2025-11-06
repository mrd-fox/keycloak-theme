<!DOCTYPE html>
<html lang="${locale.currentLanguageTag}">
<head>
    <meta charset="UTF-8" />
    <title>${msg("infoPageTitle")} | Skillshub</title>
    <meta name="robots" content="noindex, nofollow" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />
    <link rel="stylesheet" href="${url.resourcesPath}/css/info-custom.css" />
</head>

<body>

<div class="info-wrapper">

    <div class="info-box">

        <!-- 🧠 Logo -->
        <div class="logo-container">
            <img src="${url.resourcesPath}/img/logo-skillshub.png" alt="Skillshub" />
        </div>

        <!-- 🧾 Title -->
        <h1 class="form-title" id="kc-page-title">
            <#if message?has_content>
                ${kcSanitize(message.summary)?no_esc}
            <#else>
                ${msg("infoPageDefaultTitle")}
            </#if>
        </h1>

        <!-- 💬 Message -->
        <div id="kc-info-message" class="info-message">
            <#if message?has_content && message.detail?has_content>
                <p class="instruction">${kcSanitize(message.detail)?no_esc}</p>
            <#elseif message?has_content>
                <p class="instruction">${kcSanitize(message.summary)?no_esc}</p>
            <#else>
                <p class="instruction">${msg("infoPageDefaultMessage")}</p>
            </#if>
        </div>

        <!-- 🔗 Back to application -->
        <#if skipLink?? && skipLink>
            <!-- no button if skipLink=true -->
        <#elseif url.clientBaseUrl??>
            <a id="backToApplication" href="${url.clientBaseUrl}" class="btn-return">
                ${msg("backToApplication")}
            </a>
        <#elseif url.loginUrl??>
            <a id="backToLogin" href="${properties.loginPageUrl!'http://localhost:5173/login'}" class="btn-return">
                ${msg("backToLogin")}
            </a>
        </#if>
    </div>

</div>

</body>
</html>
