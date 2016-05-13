<#import "/spring.ftl" as spring />
<#assign springTags=JspTaglibs["http://www.springframework.org/tags"]>
<#assign core=JspTaglibs["http://java.sun.com/jsp/jstl/core"]>
<#assign form=JspTaglibs["http://www.springframework.org/tags/form"]>
<!doctype html>
<html>
<head>
    <meta content="text/html" charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href='http://fonts.googleapis.com/css?family=PT+Sans:400,700' rel='stylesheet' type='text/css'>


    <link rel="stylesheet" href="<@spring.url relativeUrl='/resources/css/reset.css"'/>"/> <!-- CSS reset -->
    <link rel="stylesheet" href="<@spring.url relativeUrl='/resources/css/style.css'/>"/> <!-- Gem style -->
    <script src="<@spring.url  relativeUrl='/resources/js/modernizr.js'/>"></script> <!-- Modernizr -->

    <title>site</title>
</head>
<body>
<header role="banner">

    <button type="submit" class="locale" id="RUS" >RUS</button>
    <button type="submit" class="locale" id="ENG">ENG</button>
    <div id="cd-logo"><a href="#0"><img src="<@spring.url  relativeUrl='/resources/img/cd-logo.svg'/>" alt="Logo"></a></div>

    <nav class="main-nav">
        <ul>
            <!-- ссылки на вызов форм -->
            <li><a class="cd-signin" href="#0"><@spring.message code="login"/></a></li>
            <li><a class="cd-signup" href="#0"><@spring.message code="registration"/></a></li>
        </ul>
    </nav>
</header>

<div class="cd-intro">
    <h1 >404 Not Found</h1>


</div>

<div class="cd-user-modal"> <!-- все формы на фоне затемнения-->
    <div class="cd-user-modal-container"> <!-- основной контейнер -->
        <ul class="cd-switcher">
            <li><a href="#0"><@spring.message code="login"/></a></li>
            <li><a href="#0"><@spring.message code="registration"/></a></li>
        </ul>

        <div id="cd-login"> <!-- форма входа                -->

		<@form.form class="cd-form" action="test" commandName="user"  method="post">

            <p class="fieldset">
				<@form.label path="email" cssClass="image-replace cd-email" for="signin-email">E-mail</@form.label>
				<@form.input path="email" cssClass="full-width has-padding has-border" id="signin-email" type="email" placeholder="E-mail"/>
                <!--<span class="cd-error-message"></span>-->
                <span class="cd-error-message"><@form.errors path="email"/></span>
            </p>

            <p class="fieldset">
				<@form.label path="password" cssClass="image-replace cd-password" for="signin-password"><@spring.message code="password"/></@form.label>
				<@form.input path="password" cssClass="full-width has-padding has-border" id="signin-password" type="text"  placeholder="Password"/>
                <a href="#0" class="hide-password">Hide</a>
                <span class="cd-error-message"><@form.errors path="password" /></span>

            </p>

            <p class="fieldset">
                <label for="remember-me"><@spring.message code="rememberme"/></label>
            </p>

            <p class="fieldset">
                <input class="full-width" type="submit" value="<@spring.message code="login"/>">
            </p>
		</@form.form>

            <p class="cd-form-bottom-message"><a href="#0"><@spring.message code="forgotpass"/></a></p>
            <!-- <a href="#0" class="cd-close-form">Close</a> -->
        </div> <!-- cd-login -->

        <div id="cd-signup"> <!-- форма регистрации -->
		<@form.form class="cd-form" commandName="user" method="post">
            <p class="fieldset">
				<@form.label path="name" cssClass="image-replace cd-username" for="signup-username"><@spring.message code="name"/></@form.label>
				<@form.input path="name" cssClass="full-width has-padding has-border" id="signup-username" type="text" placeholder="Name"/>
                <span class="cd-error-message"><@form.errors path="name" /></span>
            </p>

            <p class="fieldset">
				<@form.label path="email" cssClass="image-replace cd-email" for="signup-email">E-mail</@form.label>
				<@form.input path="email" cssClass="full-width has-padding has-border" id="signup-email" type="email" placeholder="E-mail"/>
                <span class="cd-error-message"><@form.errors path="email" /></span>
            </p>

            <p class="fieldset">
				<@form.label path="password" cssClass="image-replace cd-password" for="signup-password"><@spring.message code="password"/></@form.label>
				<@form.input path="password" cssClass="full-width has-padding has-border" id="signup-password" type="text"  placeholder="Password"/>
                <a href="#0" class="hide-password">Hide</a>
                <span class="cd-error-message"><@form.errors path="password" /></span>
            </p>

            <p class="fieldset">
                <input type="checkbox" id="accept-terms">
                <label for="accept-terms"><@spring.message code="iagreewith"/> <a href="#0"><@spring.message code="conditions"/></a></label>
            </p>

            <p class="fieldset">
                <input class="full-width has-padding" type="submit" value="<@spring.message code="createaccaunt"/>">
            </p>
		</@form.form>

            <!-- <a href="#0" class="cd-close-form">Close</a> -->
        </div> <!-- cd-signup -->

        <div id="cd-reset-password"> <!-- форма восстановления пароля -->
            <p class="cd-form-message"><@spring.message code="forgotpasstext"/></p>
		<@form.form class="cd-form" commandName="user" method="post">

            <p class="fieldset">
				<@form.label path="email" cssClass="image-replace cd-email" for="reset-email">E-mail</@form.label>
				<@form.input path="email" cssClass="full-width has-padding has-border" id="reset-email" type="email" placeholder="E-mail"/>
                <span class="cd-error-message"><@form.errors path="email" /></span>
            </p>

            <p class="fieldset">
                <input class="full-width has-padding" type="submit" value="<@spring.message code="recoverpass"/>">
            </p>
		</@form.form>

            <p class="cd-form-bottom-message"><a href="<@spring.url  relativeUrl='#0'/>"><@spring.message code="returntologinform"/></a></p>
        </div> <!-- cd-reset-password -->
        <a href="#0" class="cd-close-form">Close</a>
    </div> <!-- cd-user-modal-container -->
</div> <!-- cd-user-modal -->
<!--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script  src=https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>-->
<script type="text/javascript" src="<@spring.url  relativeUrl='/resources/js/jquery-2.2.2.min.js'/>"></script>
<script type="text/javascript" src="<@spring.url  relativeUrl='/resources/js/jquery.cookie.js'/>"></script>

<script src="<@spring.url  relativeUrl='/resources/js/main.js'/>"></script> <!-- Gem jQuery -->
<#if modal_visible>

<script>
    $('.cd-user-modal').addClass("is-visible");
    $form = $('.cd-user-modal').find('#${login_or_regist}');
    $form.addClass('is-selected');
    $('.cd-switcher').children('li').eq( ${login_or_regist1} ).children('a').addClass('selected');
    $form.find('input[type="email"]').toggleClass('has-error').next('span').toggleClass('is-visible');
</script>

</#if >
<script type="text/javascript">
    $(document).ready(function () {

        $('#RUS').on("click",function () {
            $.cookie('lang', 'ru', { expires: 365, path: '/' });
            window.location.reload();
        });
        $('#ENG').on("click",function () {
            $.cookie('lang', 'en', { expires: 365, path: '/' });
            window.location.reload();
        });
    })
</script>
</body>
</html>