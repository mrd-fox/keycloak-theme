<!DOCTYPE html>
<html lang="${locale.current}">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>${msg('registerTitle')}</title>
    <link rel="stylesheet" href="${url.resourcesPath}/css/style.css" />
</head>
<body>
<div class="register-container">
    <div class="register-box">

        <img src="${url.resourcesPath}/img/logo-skillshub.png" alt="Skillshub" class="logo" />

        <h1>${msg('registerTitle')}</h1>

        <#if message?has_content>
            <div class="alert ${message.type}">
                ${kcSanitize(message.summary)?no_esc}
            </div>
        </#if>

        <form id="kc-register-form" action="${url.registrationAction}" method="post">

            <input
                type="text"
                id="email"
                name="email"
                placeholder="${msg('usernameOrEmail')}"
                value="${(register.formData.email!'')}"
                autofocus
            />

            <div class="password-wrapper">
                <input
                    type="password"
                    id="password"
                    name="password"
                    placeholder="${msg('password')}"
                />
                <span class="toggle-password" onclick="togglePassword('password','toggle-icon-password')">
                    <img id="toggle-icon-password" src="${url.resourcesPath}/img/eye.svg" alt="Afficher le mot de passe" />
                </span>
            </div>

            <div class="password-wrapper">
                <input
                    type="password"
                    id="password-confirm"
                    name="password-confirm"
                    placeholder="${msg('passwordConfirm')}"
                />
                <span class="toggle-password" onclick="togglePassword('password-confirm','toggle-icon-confirm')">
                    <img id="toggle-icon-confirm" src="${url.resourcesPath}/img/eye.svg" alt="Afficher le mot de passe" />
                </span>
            </div>

            <button type="submit" id="kc-register">${msg('register')}</button>

            <div class="links">
                <a href="${url.loginUrl}">${msg('backToLogin')}</a>
            </div>
        </form>

        <footer>
            <p>${msg('skillshubFooter')}</p>
        </footer>
    </div>
</div>

<script>
function togglePassword(fieldId, iconId) {
    const field = document.getElementById(fieldId);
    const icon = document.getElementById(iconId);
    if (field.type === "password") {
        field.type = "text";
        icon.src = "${url.resourcesPath}/img/eye-slash.svg";
    } else {
        field.type = "password";
        icon.src = "${url.resourcesPath}/img/eye.svg";
    }
}
</script>
</body>
</html>
