<!DOCTYPE html>
<html lang="${locale.currentLanguageTag}">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>${msg("emailVerificationTitle")}</title>
    <link rel="stylesheet" href="${url.resourcesPath}/css/style.css" />
</head>
<body>

<div class="login-container">
    <div class="login-box">

        <!-- Logo -->
        <img src="${url.resourcesPath}/img/logo-skillshub.png" alt="Skillshub" class="logo" />

        <!-- Title -->
        <h1>${msg("emailVerificationTitle")}</h1>

        <!-- Message -->
        <p>${msg("emailVerificationInstruction")}</p>

        <!-- Email -->
        <p class="info-email">${email!""}</p>

        <!-- Resend link -->
        <#if resendEmailLink??>
            <a class="resend-link" href="${resendEmailLink}">
                ${msg("resendEmail")}
            </a>
        </#if>

        <!-- Back to login -->
        <div class="links">
            <a href="${url.loginUrl}">${msg("backToLogin")}</a>
        </div>

    </div>
</div>

</body>
</html>
