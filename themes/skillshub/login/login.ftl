<!DOCTYPE html>
<html lang="${locale.currentLanguageTag}">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>${msg("loginTitle")}</title>
    <link rel="stylesheet" href="${url.resourcesPath}/css/style.css" />
</head>
<body>
<div class="login-container">
    <div class="login-box">


        <!-- 🖼️ Logo -->
        <img src="${url.resourcesPath}/img/logo-skillshub.png" alt="Skillshub" class="logo" />

        <!-- 🧾 Title -->
        <h1>${msg("loginTitle")}</h1>

        <!-- ⚠️ Message display -->
        <#if message?has_content>
            <div class="alert ${message.type}">
                ${kcSanitize(message.summary)?no_esc}
            </div>
        </#if>

        <!-- 🔐 Login form -->
        <form id="kc-form-login" action="${url.loginAction}" method="post">
            <input
                type="text"
                id="username"
                name="username"
                placeholder="${msg('usernameOrEmail')}"
                value="${(login.username!'')}"
                autofocus
            />

            <!-- Password with toggle -->
            <div class="password-wrapper">
                <input
                    type="password"
                    id="password"
                    name="password"
                    placeholder="${msg('password')}"
                />
                <span class="toggle-password" onclick="togglePassword()">
                    <img id="toggle-icon" src="${url.resourcesPath}/img/eye.svg" alt="Afficher le mot de passe" />
                </span>
            </div>

            <div class="remember-me">
                <label>
                    <input type="checkbox" id="rememberMe" name="rememberMe" /> ${msg("rememberMe")}
                </label>
            </div>

            <button type="submit" id="kc-login">${msg("login")}</button>

            <div class="links">
                <a href="${url.registrationUrl}">${msg("register")}</a> |
                <a href="${url.loginResetCredentialsUrl}">${msg("forgotPassword")}</a>
            </div>
        </form>

        <!-- Footer -->
        <footer>
            <p>${msg("skillshubFooter")}</p>
        </footer>
    </div>
</div>

<!-- =======================================
     🔧 Scripts
     ======================================= -->

<!-- 👁️ Toggle password -->
<script>
function togglePassword() {
    const passwordField = document.getElementById("password");
    const icon = document.getElementById("toggle-icon");
    if (passwordField.type === "password") {
        passwordField.type = "text";
        icon.src = "${url.resourcesPath}/img/eye-slash.svg";
    } else {
        passwordField.type = "password";
        icon.src = "${url.resourcesPath}/img/eye.svg";
    }
}
</script>

</body>
</html>
